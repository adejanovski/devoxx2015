import org.apache.spark.sql.cassandra.CassandraSQLContext
import org.apache.spark.sql.SchemaRDD
import com.datastax.spark.connector._
import com.datastax.spark.connector.cql._
import org.apache.spark.SparkContext
import org.apache.spark.SparkContext._
import org.apache.spark.SparkConf

// Mots non pertinents, à exclure des mots clés de l'analyse
val stopWords = Array("alors","au","aucuns","aussi","autre","avant","avec","avoir","bon","car","ce","cela","ces","ceux","chaque","ci","comme","comment","dans","des","du","dedans","dehors","depuis","devrait","doit","donc","dos","début","elle","elles","en","encore","essai","est","et","eu","fait","faites","fois","font","hors","ici","il","ils","je","juste","la","le","les","leur","là","ma","maintenan","mais","mes","mine","moins","mon","mot","même","ni","nommés","notre","nous","ou","où","par","parce","pas","peut","peu","plupart","pour","pourquoi","quand","que","quel","quelle","quelles","quels","qui","sa","sans","ses","seulement","si","sien","son","sont","sous","soyez","sujet","sur","ta","tandis","tellement","tels","tes","ton","tous","tout","trop","très","tu","voient","vont","votre","vous","vu","ça","étaient","état","étions","été","être","au","aux","avec","ce","ces","dans","de","des","du","elle","en","et","eux","il","je","la","le","leur","lui","ma","mais","me","même","mes","moi","mon","ne","nos","notre","nous","on","ou","par","pas","pour","qu","que","qui","sa","se","ses","son","sur","ta","te","tes","toi","ton","tu","un","une","vos","votre","vous","été","étée","étées","étés","étant","suis","es","est","sommes","êtes","sont","serai","seras","sera","serons","serez","seront","serais","serait","serions","seriez","seraient","étais","était","étions","étiez","étaient","fus","fut","fûmes","fûtes","furent","sois","soit","soyons","soyez","soient","fusse","fusses","fût","fussions","fussiez","fussent","ayant","eu","eue","eues","eus","ai","as","avons","avez","ont","aurai","auras","aura","aurons","aurez","auront","aurais","aurait","aurions","auriez","auraient","avais","avait","avions","aviez","avaient","eut","eûmes","eûtes","eurent","aie","aies","ait","ayons","ayez","aient","eusse","eusses","eût","eussions","eussiez","eussent","ceci","cela","celà","cet","cette","ici","ils","les","leurs","quel","quels","quelle","quelles","sans","soi",",",".","'",";","chez","to","it","runs","plus","faire","for","why","the","with","conference","your")

// récupération du contexte Cassandra SQL
val cc = new CassandraSQLContext(sc)

// import de la classe permettant de convertir un RDD en schemaRDD
import cc.createSchemaRDD

// Récupération des speakers dans un RDD
val rddSpeaker = cc.sql("select * from devoxx.speaker")

// Récupération des talks dans un RDD
val rddTalk = cc.sql("select * from devoxx.talk")


// Split par mot des titres des talks
val splitByKeywordRdd = rddTalk.flatMap(r => (r.getString(1).toLowerCase().replaceAll("[\\.',:@\\?\\!]", " ").replace("  ", " ").split(" ").filter(k => !stopWords.contains(k) && k.length()>2).map(m => (m,r.getInt(0)) )))
case class KeywordTalk(keyword: String, annee: Int)
val keywordsSchemaRdd = splitByKeywordRdd.map(t => KeywordTalk(t._1,t._2))
keywordsSchemaRdd.registerTempTable("keyword_par_annee")

// Split par groupe de 2 mots des titres des talks
val splitBy2gramsRdd = rddTalk.flatMap(r => (r.getString(1).toLowerCase().replaceAll("[\\.',:@\\?\\!]", " ").replace("  ", " ").split(" ").sliding(2)).filter(k => !(stopWords.contains(k(0)) || stopWords.contains(k(1)) )).map(m => (m(0) + " " + m(1),r.getInt(0)) ))
val twoGramsSchemaRdd = splitBy2gramsRdd.map(t => KeywordTalk(t._1,t._2))
twoGramsSchemaRdd.registerTempTable("two_grams_par_annee")

// Insertion des mots clés et 2grams
cc.sql("insert into devoxx.keyword_par_annee select keyword, annee, count(*) from keyword_par_annee group by keyword, annee").collect()
cc.sql("insert into devoxx.keyword_par_annee select keyword, annee, count(*) from two_grams_par_annee group by keyword, annee").collect()


// On dédouble les talks qui ont plusieurs speakers pour les isoler des co-speakers
val splitBySpeakersRdd = rddTalk.flatMap(r => (r(3).asInstanceOf[scala.collection.immutable.Set[String]]).map(m => (m,r) ))
// ==> Array((francois_beaufort,[2015,10 trucs que j'ai appris en lisant le code source de Chrome OS,Langages alternatifs,Set(francois_beaufort),conf]))


// Utilisation d'une classe pour refaire un schemaRDD par la suite
case class Talk(titre: String, speaker: String, annee: Int, categorie: String, type_talk: String)
val talksSchemaRdd = splitBySpeakersRdd.map(t => Talk(t._2.getString(1),t._1,t._2.getInt(0),t._2.getString(2),t._2.getString(4)))
talksSchemaRdd.registerTempTable("talks_par_speaker")

val nbTalkParSpeaker = cc.sql("select annee, nom_speaker, b.id_speaker from talks_par_speaker a JOIN devoxx.speaker b ON a.speaker = b.id_speaker ")
nbTalkParSpeaker.registerTempTable("nb_talk_par_speaker")
// Insertion des comptages par speaker et par année
cc.sql("insert into devoxx.speaker_par_annee select nom_speaker, annee, id_speaker , count(*) as nb from nb_talk_par_speaker group by annee, nom_speaker, id_speaker").collect()

// Index des talks par speaker
cc.sql("insert into devoxx.talk_par_speaker select speaker, type_talk, titre, annee from talks_par_speaker").collect()


val nbTalkParSociete = cc.sql("select annee, b.societe, count(*) as nb  from talks_par_speaker a JOIN devoxx.speaker b ON a.speaker = b.id_speaker group by annee, b.societe")
nbTalkParSociete.registerTempTable("nb_talk_par_societe")
// Insertion des comptages par sociétés et par année
cc.sql("insert into devoxx.societe_par_annee select societe, annee, nb from nb_talk_par_societe where societe!='' and societe is not null").collect()
// Index des talks par societe
cc.sql("insert into devoxx.talk_par_societe select societe, type_talk, titre, annee from talks_par_speaker a JOIN devoxx.speaker b ON a.speaker = b.id_speaker AND societe!='' and societe is not null").collect()


val nbTalkParType = cc.sql("select annee, type_talk, count(*) as nb from devoxx.talk group by annee, type_talk")
nbTalkParType.registerTempTable("nb_talk_par_type")



// Insertion des comptages par type de talk et par année
cc.sql("insert into devoxx.type_talk_par_annee select type_talk, annee, nb from nb_talk_par_type").collect()


















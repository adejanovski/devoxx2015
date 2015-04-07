import org.apache.spark.sql.cassandra.CassandraSQLContext
import org.apache.spark.sql.SchemaRDD
import com.datastax.spark.connector._
import com.datastax.spark.connector.cql._
import org.apache.spark.SparkContext
import org.apache.spark.SparkContext._
import org.apache.spark.SparkConf

// récupération du contexte Cassandra SQL
val cc = new CassandraSQLContext(sc)

// import de la classe permettant de convertir un RDD en schemaRDD
import cc.createSchemaRDD

// Récupération des speakers dans un RDD
val rddSpeaker = cc.sql("select * from devoxx.speaker")

// Récupération des talks dans un RDD
val rddTalk = cc.sql("select * from devoxx.talk")

// On dédouble les talks qui ont plusieurs speakers pour les isoler des co-speakers
val splitBySpeakersRdd = rddTalk.flatMap(r => (r(3).asInstanceOf[scala.collection.immutable.Set[String]]).map(m => (m,r) ))
// ==> Array((francois_beaufort,[2015,10 trucs que j'ai appris en lisant le code source de Chrome OS,Langages alternatifs,Set(francois_beaufort),conf]))


// Utilisation d'une classe pour refaire un schemaRDD par la suite
case class Talk(titre: String, speaker: String, annee: Int, categorie: String, type_talk: String)
val talksSchemaRdd = splitBySpeakersRdd.map(t => Talk(t._2.getString(1),t._1,t._2.getInt(0),t._2.getString(2),t._2.getString(4)))
talksSchemaRdd.registerTempTable("talks_par_speaker")


val connector = CassandraConnector(sc.getConf)

// Index des talks par speaker
talksSchemaRdd.foreachPartition(partition => {
    connector.withSessionDo{ session =>      
	  partition.foreach(r => session.execute("insert into devoxx.talk_par_speaker (id_speaker, type_talk, titre, annee) values(?,?,?,?) ", r.speaker, r.type_talk, r.titre, r.annee.asInstanceOf[java.lang.Integer]))
   }
})


// Index des talks par societe
val talkParSocieteRdd = cc.sql("select societe, type_talk, titre, annee from talks_par_speaker a JOIN devoxx.speaker b ON a.speaker = b.id_speaker AND societe!='' and societe is not null")

talkParSocieteRdd.foreachPartition(partition => {
    connector.withSessionDo{ session =>      
	  partition.foreach(r => session.execute("insert into devoxx.talk_par_societe (societe, type_talk, titre, annee) values(?,?,?,?) ", r(0).asInstanceOf[java.lang.String], r(1).asInstanceOf[java.lang.String], r(2).asInstanceOf[java.lang.String], r(3).asInstanceOf[java.lang.Integer]))
   }
})


exit












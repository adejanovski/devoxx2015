# -*- coding: latin1 -*-

from calliope import CalliopeSQLContext
from pyspark.sql import *
import re

from pyspark import SparkContext
sc = SparkContext("local", "Analyse Devoxx", pyFiles=['/opt/spark/lib/calliope-0.0.1-py2.7.egg'])

sqlContext = CalliopeSQLContext(sc)

stopWords = ["alors","au","aucuns","aussi","autre","avant","avec","avoir","bon","car","ce","cela","ces","ceux","chaque","ci","comme","comment","dans","des","du","dedans","dehors","depuis","devrait","doit","donc","dos","début","elle","elles","en","encore","essai","est","et","eu","fait","faites","fois","font","hors","ici","il","ils","je","juste","la","le","les","leur","là","ma","maintenan","mais","mes","mine","moins","mon","mot","même","ni","nommés","notre","nous","ou","où","par","parce","pas","peut","peu","plupart","pour","pourquoi","quand","que","quel","quelle","quelles","quels","qui","sa","sans","ses","seulement","si","sien","son","sont","sous","soyez","sujet","sur","ta","tandis","tellement","tels","tes","ton","tous","tout","trop","très","tu","voient","vont","votre","vous","vu","ça","étaient","état","étions","été","être","au","aux","avec","ce","ces","dans","de","des","du","elle","en","et","eux","il","je","la","le","leur","lui","ma","mais","me","même","mes","moi","mon","ne","nos","notre","nous","on","ou","par","pas","pour","qu","que","qui","sa","se","ses","son","sur","ta","te","tes","toi","ton","tu","un","une","vos","votre","vous","été","étée","étées","étés","étant","suis","es","est","sommes","êtes","sont","serai","seras","sera","serons","serez","seront","serais","serait","serions","seriez","seraient","étais","était","étions","étiez","étaient","fus","fut","fûmes","fûtes","furent","sois","soit","soyons","soyez","soient","fusse","fusses","fût","fussions","fussiez","fussent","ayant","eu","eue","eues","eus","ai","as","avons","avez","ont","aurai","auras","aura","aurons","aurez","auront","aurais","aurait","aurions","auriez","auraient","avais","avait","avions","aviez","avaient","eut","eûmes","eûtes","eurent","aie","aies","ait","ayons","ayez","aient","eusse","eusses","eût","eussions","eussiez","eussent","ceci","cela","celà","cet","cette","ici","ils","les","leurs","quel","quels","quelle","quelles","sans","soi",",",".","'",";","chez","to","it","runs","plus","faire","for","why","the","with","conference","your","and","cest","dun"]
charsToRemove = [".","'",",",":","@","?","!","-",";",":","#","&","(",")","<",">","{","}"]
rx = '[' + re.escape(''.join(charsToRemove)) + ']'


rddTalk = sqlContext.sql("select titre, speakers, annee, categorie, type_talk from devoxx.talk")


## Insertion des comptages par type de talk et par année
rdd = sqlContext.sql("select  a.type_talk as type_talk, a.annee as annee,  count(*) as nb from devoxx.talk a group by a.type_talk, a.annee")
rdd_schema = sqlContext.inferSchema(rdd.map(lambda x:Row(type_talk=x[0],annee=x[1],nb=x[2])))
rdd_schema.registerTempTable("tmp_type_talk_annee")
sqlContext.sql("insert into devoxx.type_talk_par_annee select * from tmp_type_talk_annee")


## Fonction permettant de retourner un tuple par mot pour chaque presentation
def split_keywords(row):
    keywords = row[0].split(" ")
    output = []
    for word in keywords:
        w = re.sub(rx, '', word)
        if(w.lower() not in stopWords and len(w)>2):
            output.append((w.lower(),row[2]))
    return output


## Split des talk par mot	
splitByKeywordRdd = rddTalk.flatMap(lambda r:split_keywords(r))

## declaration de la table memoire contenant les mots avec les annees correspondantes
splitByKeywordRdd_schema = sqlContext.inferSchema(splitByKeywordRdd.filter(lambda word:len(word[0])>1).map(lambda x:Row(keyword=x[0],annee=x[1])))
splitByKeywordRdd_schema.registerTempTable("tmp_keywords")

## comptage des occurrences de mots par annees
keyword_count = sqlContext.sql("select keyword, annee, count(*) as nb from tmp_keywords group by keyword, annee")
keyword_count_schema = sqlContext.inferSchema(keyword_count.map(lambda x:Row(keyword=x[0],annee=x[1],nb=x[2])))
keyword_count_schema.registerTempTable("tmp_keywords_count")

## insertion dans la table cassandra
sqlContext.sql("INSERT INTO devoxx.keyword_par_annee select keyword, annee, nb from tmp_keywords_count")


## Insertion de la table d'index speaker_par_societe
sqlContext.sql("insert into devoxx.speaker_par_societe select * from devoxx.speaker where societe is not null and societe != ''")

exit()

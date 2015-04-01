# devoxx2015
Sources du TIA sur Cassandra et SparkSQL

# Setup Spark
Placer dans spark/lib les fichiers spark-cassandra-connector-assembly-1.x.x.jar et spark-cassandra-connector-java-assembly-1.x.x.jar

dans conf/spark-env.sh, pour permettre aux jointures sur des tables Cassandra de fonctionner, mettre (en indiquant le chemin correct et en remplaçant x.x par votre sous version du connecteur) :

**export SPARK_CLASSPATH="/xxxxx/lib/spark-cassandra-connector-assembly-1.x.x.jar"**

Dans conf/spark-defaults.conf, mettre : 

**spark.jars              /xxxxx/lib/spark-assembly-1.x.x-hadoop2.4.0.jar,/xxxxx/lib/spark-cassandra-connector-assembly-1.x.x.jar,/xxxxx/lib/spark-cassandra-connector-java-assembly-1.x.x.jar**

**spark.cassandra.connection.host adresse_dun_noeud_cassandra**

Dans bin/compute-classpath.sh, remplace la ligne : 

**CLASSPATH="$CLASSPATH:$ASSEMBLY_JAR"**

par : 

**CLASSPATH="$CLASSPATH:$ASSEMBLY_JAR:/xxxxx/lib/spark-cassandra-connector-assembly-1.x.x.jar:/xxxxx/lib/spark-cassandra-connector-java-assembly-1.x.x.jar"**


# devoxx2015
Sources du TIA sur Cassandra et SparkSQL

# Setup Spark

Vous pouvez récupérer notre installation Spark à cette adresse : https://dl.dropboxusercontent.com/u/708980/spark-1.1.1-bin-hadoop2.4.tgz

Pensez à remplacer dans les fichiers de conf les références à "centosvm" par l'adresse de votre machine maître.


**Si vous voulez partir de votre installation Spark:**

Placer dans spark/lib les fichiers spark-cassandra-connector-assembly-1.x.x.jar et spark-cassandra-connector-java-assembly-1.x.x.jar

Dans conf/spark-defaults.conf, mettre : 

**spark.jars              /xxxxx/lib/spark-assembly-1.x.x-hadoop2.4.0.jar,/xxxxx/lib/spark-cassandra-connector-assembly-1.x.x.jar,/xxxxx/lib/spark-cassandra-connector-java-assembly-1.x.x.jar**

**spark.cassandra.connection.host adresse_dun_noeud_cassandra**

Pous Scala et Java, de manière à éviter les exceptions sur jointures, dans bin/compute-classpath.sh remplace la ligne : 

**CLASSPATH="$CLASSPATH:$ASSEMBLY_JAR"**

par : 

**CLASSPATH="$CLASSPATH:$ASSEMBLY_JAR:/xxxxx/lib/spark-cassandra-connector-assembly-1.x.x.jar:/xxxxx/lib/spark-cassandra-connector-java-assembly-1.x.x.jar"**

# Exécution

**Application web de démo : /devoxx_tia**

**Sources du traitement Spark en Java : /DevoxxSparkJava**

**Scripts CQL, Scala et Python : /scripts**

**Pour exécuter les scripts dans l'ordre du TIA**

Lancer cqlsh : cqlsh 127.0.0.1
Jouer le script d'init de la base : SOURCE '/scripts/init_tables.cql'

Aller dans votre install spark et lancer le cluster (modifiez le fichier conf/slaves conformément à votre cluster) : sbin/start-all.sh

Ensuite allez dans le répertoire spark/bin pour lancer le script Scala : ./spark-shell.sh -i /scripts/analyse_devoxx.scala

Lancez les jobs java : ./spark-submit --class devoxx.DevoxxSpeakersParAnneeSummary --master spark://centosvm:7077 /scripts/devoxx.jar

Lancez les jobs java : ./spark-submit --class devoxx.DevoxxTalksParSocieteSummary --master spark://centosvm:7077 /data/devoxx.jar

Et enfin, lancez le script python : ./pyspark-calliope.sh /scripts/analyse_devoxx.py 

**Pour lancer pyspark avec Calliope**

Utiliser bin/pyspark-calliope.sh qui remet à son état d'origine le fichier bin/compute-classpath.sh (sans les dépendances du connecteur spark cassandra).
Sinon, lancer depuis le répertoire bin : ./pyspark --jars ../lib/calliope-sql-assembly-1.1.0-CTP-U2-H2.jar --driver-class-path ../lib/calliope-sql-assembly-1.1.0-CTP-U2-H2.jar  --py-files ../lib/calliope-0.0.1-py2.7.egg

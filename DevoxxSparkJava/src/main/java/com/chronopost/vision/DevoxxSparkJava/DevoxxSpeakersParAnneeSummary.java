package com.chronopost.vision.DevoxxSparkJava;

import org.apache.spark.SparkConf;
import org.apache.spark.api.java.JavaSparkContext;
import org.apache.spark.api.java.function.VoidFunction;
import org.apache.spark.sql.SchemaRDD;
import org.apache.spark.sql.cassandra.CassandraSQLContext;
import org.apache.spark.sql.catalyst.expressions.Row;

public class DevoxxSpeakersParAnneeSummary {

	public static void main(String[] args) {

		SparkConf conf = new SparkConf().setAppName("DevoxxSpeakersParAnneeSummaryApp");

		conf.setMaster("spark://centosvm:7077");

		conf.set("spark.cassandra.connection.host", "centosvm");

	//	conf.set("spark.executor.extraClassPath", "/usr/share/spark-1.2.1-bin-hadoop2.4/lib/spark-cassandra-connector-java-assembly-1.2.0-SNAPSHOT.jar,/usr/share/spark-1.2.1-bin-hadoop2.4/lib/spark-cassandra-connector-assembly-1.2.0-SNAPSHOT.jar,/usr/share/spark-1.2.1-bin-hadoop2.4/lib/spark-assembly-1.2.1-hadoop2.4.0.jar");
		//conf.set("spark.driver.extraClassPath", "/usr/share/spark-1.2.1-bin-hadoop2.4/lib/spark-cassandra-connector-java-assembly-1.2.0-SNAPSHOT.jar,/usr/share/spark-1.2.1-bin-hadoop2.4/lib/spark-cassandra-connector-assembly-1.2.0-SNAPSHOT.jar,/usr/share/spark-1.2.1-bin-hadoop2.4/lib/spark-assembly-1.2.1-hadoop2.4.0.jar");

	//	  conf.set("spark.cassandra.keyspace", "devoxx");
		
		JavaSparkContext sc = new JavaSparkContext(conf);

		CassandraSQLContext cassandraSQLContext = new CassandraSQLContext(sc.sc());

		 	// ////////////////////

		/*
		SchemaRDD nbTalkParSpeaker = cassandraSQLContext
				.sql("select annee, name, count(*) as nb from devoxx.talk_par_speaker a JOIN devoxx.speakers b ON a.speaker = b.speaker group by annee, name ");
*/
		
		/*
		SchemaRDD nbTalkParSpeaker = cassandraSQLContext
				.sql("select annee from devoxx.talk_par_speaker A,  devoxx.speakers B where A.speaker = B.speaker  ");
		*/

		SchemaRDD nbTalkParSpeaker = cassandraSQLContext
				.sql("select B.nom_speaker as nom_speaker, A.annee as annee from devoxx.talk_par_speaker A JOIN  devoxx.speaker B ON A.id_speaker = B.id_speaker  ");

		nbTalkParSpeaker.collect();
		// insert into devoxx.speaker_par_annee select name, annee, nb from
		// nb_talk_par_speaker

	    nbTalkParSpeaker.registerTempTable("nb_talk_par_speaker");

		 cassandraSQLContext.sql(
		 "insert into devoxx.speaker_par_annee select nom_speaker, annee, count(*) as nb from nb_talk_par_speaker group by nom_speaker, annee").collect();

//	SchemaRDD poer =  cassandraSQLContext.sql("insert into devoxx.speaker_par_annee   select 'name', 1999,  2 from nb_Talk_Par_Speaker") ;
		
	//	cassandraSQLContext.sql("insert into devoxx.speaker_par_annee select('roger', 1999) ") ;
		
	
		 
		
		

	}
}

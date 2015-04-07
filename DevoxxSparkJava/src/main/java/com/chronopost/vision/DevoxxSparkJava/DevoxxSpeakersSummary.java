package com.chronopost.vision.DevoxxSparkJava;

import java.util.ArrayList;
import java.util.LinkedList;
import java.util.List;

import org.apache.spark.SparkConf;
import org.apache.spark.api.java.JavaRDD;
import org.apache.spark.api.java.JavaSparkContext;
import org.apache.spark.api.java.function.FlatMapFunction;
import org.apache.spark.api.java.function.Function;
import org.apache.spark.api.java.function.VoidFunction;
import org.apache.spark.rdd.RDD;
import org.apache.spark.sql.SchemaRDD;
import org.apache.spark.sql.api.java.DataType;
import org.apache.spark.sql.api.java.JavaSQLContext;
import org.apache.spark.sql.api.java.JavaSchemaRDD;
import org.apache.spark.sql.api.java.StructField;
import org.apache.spark.sql.cassandra.CassandraSQLContext;
import org.apache.spark.sql.cassandra.CassandraSQLRow;
import org.apache.spark.sql.catalyst.expressions.Row;
import org.apache.spark.sql.catalyst.types.StructType;
import scala.collection.JavaConversions;
import scala.collection.Seq;

import com.datastax.spark.connector.japi.rdd.CassandraJavaRDD;

public class DevoxxSpeakersSummary {

	public static void main(String[] args) {

		SparkConf conf = new SparkConf().setAppName("DevoxxSummaryApp");

		conf.setMaster("local");

		conf.set("spark.cassandra.connection.host", "centosvm");

		//conf.set("spark.executor.extraClassPath", "/usr/share/spark-1.2.1-bin-hadoop2.4/lib/spark-cassandra-connector-java-assembly-1.2.0-SNAPSHOT.jar");
		//conf.set("spark.driver.extraClassPath", "/usr/share/spark-1.2.1-bin-hadoop2.4/lib/spark-cassandra-connector-java-assembly-1.2.0-SNAPSHOT.jar");

		// conf.set("spark.cassandra.keyspace", "devoxx");

		JavaSparkContext sc = new JavaSparkContext(conf);

		CassandraSQLContext cassandraSQLContext = new CassandraSQLContext(sc.sc());
		
 //cassandraSQLContext.setKeyspace("devoxx");

		// but : inserer dans speaker_par_annee
		System.out.println("demarrage");

		SchemaRDD schemaRDD = cassandraSQLContext.sql("select T.annee, T.speakers from  devoxx.talk T   ");
		System.out.println("après requete");
		JavaRDD<Row> javaRDD = schemaRDD.toJavaRDD();
		
	//	JavaSchemaRDD  javaRDD2b = schemaRDD.toJavaSchemaRDD();
		
		// ok pour ça
		schemaRDD.registerTempTable("voir");
		
		//Row[] e = cassandraSQLContext.sql("select * from voir").collect();
		//System.out.println(e.length);
		
		
		
	//	JavaRDD<Person> javaRDD2c =	javaRDD2b.flatMap(f);
		
		System.out.println("avant mapping");
		
		//JavaRDD<Row> javaRDD2 = javaRDD.flatMap(new FlatMapFunction<Row, Row>() {
		JavaRDD<Row> javaRDD2 = javaRDD.flatMap(new FlatMapFunction<Row, Row>() {

			
			public Iterable<Row> call(Row t) throws Exception {

				CassandraSQLRow cassandraSQLRow = (CassandraSQLRow) t;

//				return getPersonList(cassandraSQLRow);
				
				return new LinkedList<Row>();

			}

			private Iterable<Row> getPersonList(CassandraSQLRow cassandraSQLRow) {

				java.lang.Integer i1 = (Integer) cassandraSQLRow.apply(0);

				scala.collection.immutable.Set speakersEt = (scala.collection.immutable.Set) cassandraSQLRow.apply(1);

				scala.collection.Iterator<String> speakerIteraotr = speakersEt.iterator();

				Iterable<Row> l = new ArrayList<Row>(speakersEt.size());

				while (speakerIteraotr.hasNext()) {

					String s = speakerIteraotr.next();

// ...
				//	l.add(cassandraSQLRow.);
					
					

				}
				return l;
			}
			// }

			// return new LinkedList<Person>();
			// }
		});
		System.out.println("après mapping");
/*
		JavaRDD<Row> javaRDD2 = javaRDD.flatMap(new FlatMapFunction<Row, Row>() {

			public Iterable<Row> call(Row t) throws Exception {

				CassandraSQLRow cassandraSQLRow = (CassandraSQLRow) t;

				return getPersonList(cassandraSQLRow);

			}

			private Iterable<Row> getPersonList(CassandraSQLRow cassandraSQLRow) {

				java.lang.Integer i1 = (Integer) cassandraSQLRow.apply(0);

				scala.collection.immutable.Set speakersEt = (scala.collection.immutable.Set) cassandraSQLRow.apply(1);

				scala.collection.Iterator<String> speakerIteraotr = speakersEt.iterator();

				List<Row> l = new ArrayList<Row>(speakersEt.size());

				while (speakerIteraotr.hasNext()) {

					String s = speakerIteraotr.next();
					
					Row person = (Row) org.apache.spark.sql.api.java.Row.create(i1.intValue(), s); //new Person(i1.intValue(), s);
					l.add(person);

				}
				return l;
			} 
			// }

			// return new LinkedList<Person>();
			// }
		});
		*/
		
		
		
		
		List<StructField> fields = new ArrayList<StructField>();
		String schemaString = "speaker name annee";
		for (String fieldName: schemaString.split(" ")) {
		  fields.add(DataType.createStructField(fieldName, DataType.StringType, true));
		}
		org.apache.spark.sql.api.java.StructType schema = DataType.createStructType(fields);
		//org.apache.spark.sql.catalyst.types.StructType sType = new org.apache.spark.sql.catalyst.types.StructType((Seq<org.apache.spark.sql.catalyst.types.StructField>) JavaConversions.asScalaBuffer(fields).toSeq());
		
		org.apache.spark.sql.catalyst.types.StructType sType = new org.apache.spark.sql.catalyst.types.StructType(null);
		
		List<org.apache.spark.sql.catalyst.types.StructField> fields2 = new ArrayList<org.apache.spark.sql.catalyst.types.StructField>();
		
		JavaSQLContext sqlContext = new org.apache.spark.sql.api.java.JavaSQLContext(sc);
		
		


/*
cassandraSQLContext.applySchema(javaRDD2., Person.class);

		  JavaSQLContext sqlContext = new JavaSQLContext(sc);
	*/	  


		// sqlContext.applySchema(javaRDD2,
		// Person.class).registerTempTable("devoxx.talks_par_speaker");
/*
 
	javaRDD2.
	RDD<T> r;
	 
	StructType struc;
	cassandraSQLContext.applySchema(javaRDD2, struc);
//	JavaSchemaRDD javaSchemaRDD = sqlContext.applySchema(javaRDD2, Person.class);
	javaSchemaRDD.registerTempTable("devoxx.pouet");
	
	
	
	*/ 
	
	
//	List l = sqlContext.sql("select * from pouet").collect();

		  /*
	Row[] l = cassandraSQLContext.sql("select * from pouet P, devoxx.speakers S where P.speaker = S.speaker").collect();

	
	System.out.println(l.length);
	*/
		  
		/*
		 * StructType schema; SchemaRDD zz =
		 * cassandraSQLContext.applySchema(javaRDD2, schema);
		 * 
		 * 
		 * 
		 * 
		 * 
		 * 
		 * zz.registerTempTable("ztableName");
		 * 
		 * 
		 * cassandraSQLContext.applySchema(javaRDD2,
		 * Person.class).registerTempTable("devoxx.talks_par_speaker");
		 * 
		 * 
		 * 
		 * 
		 * // javaSchemaRDD;
		 * 
		 * JavaSchemaRDD nb_talk_par_speaker = sqlContext.sql(
		 * "select annee, name, count(*) as nb from talks_par_speaker a JOIN devoxx.speakers b ON a.speaker = b.speaker group by annee, name"
		 * );
		 * 
		 * 
		 * nb_talk_par_speaker.registerTempTable("nb_talk_par_speaker");
		 * 
		 * 
		 * sqlContext.sql(
		 * "insert into devoxx.speaker_par_annee select name, annee, nb from nb_talk_par_speaker"
		 * );
		 */
		sc.close();

	}
}

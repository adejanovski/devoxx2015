package fr.chronopost.labs.data;

import java.util.ArrayList;
import java.util.Collections;
import java.util.Comparator;
import java.util.Date;
import java.util.HashMap;
import java.util.LinkedHashMap;
import java.util.LinkedList;
import java.util.List;
import java.util.Map;
import java.util.Random;
import java.util.TreeMap;

import com.datastax.driver.core.Cluster;
import com.datastax.driver.core.ResultSet;
import com.datastax.driver.core.Row;
import com.datastax.driver.core.Session;
import com.datastax.driver.core.policies.DefaultRetryPolicy;
import com.google.common.base.Joiner;
import com.google.common.collect.Lists;
import com.google.common.collect.Maps;

import fr.chronopost.labs.servlet.model.SpeakerBean;

public class CassandraAccess {	
	
		
	private Session session = CassandraConnection.getInstance();
	
	public static final CassandraAccess INSTANCE = new CassandraAccess();

    private CassandraAccess() {}
		
	
	public List<SpeakerBean> getAllSpeakers() {
		
		Random random = new Random();

		java.util.List<SpeakerBean> l = new LinkedList<SpeakerBean>();
		

		ResultSet results = session.execute("select * from speakers");

		for (Row row : results) {
			SpeakerBean u = new SpeakerBean(row.getString("speaker"), row.getString("name"), row.getString("company"), row.getString("twitter"));			
			l.add(u);
		}

		return l;
	}
	
	
	public List<SpeakerBean> getSpeakers(ArrayList<String> speakerIds) {
		
		Random random = new Random();

		java.util.List<SpeakerBean> l = new LinkedList<SpeakerBean>();
		
		Joiner joiner = Joiner.on("','");

		ResultSet results = session.execute("select * from speakers where speaker in ('" + joiner.join(speakerIds) + "') ;");

		for (Row row : results) {

			SpeakerBean u = new SpeakerBean(row.getString("speaker"), row.getString("name"), row.getString("company"), row.getString("twitter"));			
			l.add(u);

		}

		return l;
	}


	public int getNbSpeakers() {
		// TODO Auto-generated method stub
		ResultSet results = session.execute("select distinct speaker from speaker_par_annee");
		int i=0;
		for(Row row:results){
			i++;
		}
		
		return i;
	}
	
	public int getNbTalks() {
		// TODO Auto-generated method stub
		ResultSet results = session.execute("select nb from type_talk_par_annee");
		int total = 0;
		for(Row row:results){
			total+=row.getInt("nb");
		}
		return total;
	}
	
	public HashMap<String,Integer> getByTalksType() {
		HashMap<String,Integer> typeTalks = Maps.newHashMap();
		ResultSet results = session.execute("select type_talk, annee, nb from type_talk_par_annee");
		int i=0;
		for(Row row:results){
			if(typeTalks.containsKey(row.getString("type_talk"))){
				typeTalks.put(row.getString("type_talk"), typeTalks.get(row.getString("type_talk"))+row.getInt("nb"));
			}else{
				typeTalks.put(row.getString("type_talk"), row.getInt("nb"));
			}
		}
		
		return typeTalks;
	}
	
	public LinkedHashMap<String,Integer> getTopBuzzwords() {
		LinkedHashMap<String,Integer> topWords = Maps.newLinkedHashMap();
		LinkedHashMap<String,Integer> words = Maps.newLinkedHashMap();
		ResultSet results = session.execute("select keyword, nb from keyword_par_annee");		
		for(Row row:results){
			if(words.containsKey(row.getString("keyword"))){
				words.put(row.getString("keyword"), words.get(row.getString("keyword"))+row.getInt("nb"));
			}else{
				words.put(row.getString("keyword"), row.getInt("nb"));
			}
		}
		
		words = (LinkedHashMap<String, Integer>) CassandraAccess.sortByValue(words);
		for(Map.Entry<String, Integer> entry : words.entrySet()) {
			System.out.println(entry.getKey() + " " + entry.getValue());
		}
		
		return topWords;
		
	}
	
	
	public static <K, V extends Comparable<? super V>> Map<K, V> sortByValue( Map<K, V> map )
	{
	    List<Map.Entry<K, V>> list =
	        new LinkedList<>( map.entrySet() );
	    Collections.sort( list, new Comparator<Map.Entry<K, V>>()
	    {
	        @Override
	        public int compare( Map.Entry<K, V> o1, Map.Entry<K, V> o2 )
	        {
	            return (o2.getValue()).compareTo( o1.getValue() );
	        }
	    } );
	
	    Map<K, V> result = new LinkedHashMap<>();
	    for (Map.Entry<K, V> entry : list)
	    {
	        result.put( entry.getKey(), entry.getValue() );
	    }
	    return result;
	}
	
	
}

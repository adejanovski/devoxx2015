package fr.chronopost.labs.data;

import java.util.ArrayList;
import java.util.Collections;
import java.util.Comparator;
import java.util.Date;
import java.util.HashMap;
import java.util.LinkedHashMap;
import java.util.LinkedHashSet;
import java.util.LinkedList;
import java.util.List;
import java.util.Map;
import java.util.Random;
import java.util.Set;
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
import fr.chronopost.labs.servlet.model.TalkBean;

public class CassandraAccess {	
	
		
	private Session session = CassandraConnection.getInstance();
	
	public static final CassandraAccess INSTANCE = new CassandraAccess();

    private CassandraAccess() {}
		
	
	public List<SpeakerBean> getAllSpeakers() {
		
		Random random = new Random();

		java.util.List<SpeakerBean> l = new LinkedList<SpeakerBean>();
		

		ResultSet results = session.execute("select * from speakers");

		for (Row row : results) {
			SpeakerBean u = new SpeakerBean(row.getString("id_speaker"), row.getString("nom_speaker"), row.getString("societe"), row.getString("twitter"));			
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

			SpeakerBean u = new SpeakerBean(row.getString("id_speaker"), row.getString("nom_speaker"), row.getString("societe"), row.getString("twitter"));			
			l.add(u);

		}

		return l;
	}


	public int getNbSpeakers() {
		// TODO Auto-generated method stub
		ResultSet results = session.execute("select distinct nom_speaker from speaker_par_annee");
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
		
		
		LinkedHashMap<String,Integer> wordsOutput = new LinkedHashMap<String,Integer>();
		int nb=0;
		for(String key:sortByValue(words).keySet()){
			if(nb>=50){
				break;
			}
			wordsOutput.put(key, words.get(key));
			nb++;
		}
		
		return wordsOutput;
		
	}
	
	
	public static <K, V extends Comparable<? super V>> Map<K, V> sortByValue( Map<K, V> map )
	{
		// tri d'une hashmap par valeurs décroissantes
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


	public HashMap<Integer,HashMap<String,Integer>> getByTalksTypeParAnnee() {		
		HashMap<Integer,HashMap<String,Integer>> annees = Maps.newHashMap();
		ResultSet results = session.execute("select type_talk, annee, nb from type_talk_par_annee");		
		for(Row row:results){
			HashMap<String,Integer> ta = Maps.newHashMap();
			ta.put(row.getString("type_talk"), row.getInt("nb"));
			if(!annees.containsKey(row.getInt("annee"))){
				annees.put(row.getInt("annee"),new HashMap<String,Integer>());
			}
			annees.get(row.getInt("annee")).put(row.getString("type_talk"), row.getInt("nb"));			
			
		}
					
		return annees;
	}
	
	public HashMap<Integer,HashMap<String,Integer>> getBySocieteParAnnee(String societe) {		
		HashMap<Integer,HashMap<String,Integer>> annees = Maps.newHashMap();
		ResultSet results = session.execute("select societe, annee, nb from societe_par_annee where societe = '" + societe + "'");		
		for(Row row:results){
			HashMap<String,Integer> soc = Maps.newHashMap();
			soc.put(row.getString("societe"), row.getInt("nb"));
			if(!annees.containsKey(row.getInt("annee"))){
				annees.put(row.getInt("annee"),new HashMap<String,Integer>());
			}
			annees.get(row.getInt("annee")).put(row.getString("societe"), row.getInt("nb"));			
			
		}
					
		return annees;
	}


	public LinkedHashMap<String,Integer>  getTopSociete() {
		HashMap<String,Integer> societes = Maps.newHashMap();
		ResultSet results = session.execute("select societe, nb from societe_par_annee");
		int i=0;
		for(Row row:results){
			if(societes.containsKey(row.getString("societe"))){
				societes.put(row.getString("societe"), societes.get(row.getString("societe"))+row.getInt("nb"));
			}else{
				societes.put(row.getString("societe"), row.getInt("nb"));
			}
		}
		
		
		LinkedHashMap<String,Integer> societesOutput = new LinkedHashMap<String,Integer>();
		int nb=0;
		for(String key:sortByValue(societes).keySet()){
			if(nb>=24){
				break;
			}
			societesOutput.put(key, societes.get(key));
			nb++;
		}
		
		return societesOutput;
	}
	
	public LinkedHashMap<String,Integer>  getTopSpeaker() {
		HashMap<String,Integer> speakers = Maps.newHashMap();
		ResultSet results = session.execute("select nom_speaker, id_speaker, nb from speaker_par_annee");
		int i=0;
		for(Row row:results){
			if(speakers.containsKey(row.getString("nom_speaker") + "--" + row.getString("id_speaker"))){
				speakers.put(row.getString("nom_speaker") + "--" + row.getString("id_speaker"), speakers.get(row.getString("nom_speaker") + "--" + row.getString("id_speaker"))+row.getInt("nb"));
			}else{
				speakers.put(row.getString("nom_speaker") + "--" + row.getString("id_speaker"), row.getInt("nb"));
			}
		}
		
		
		LinkedHashMap<String,Integer> speakerOutput = new LinkedHashMap<String,Integer>();
		int nb=0;
		for(String key:sortByValue(speakers).keySet()){
			if(nb>=30){
				break;
			}
			speakerOutput.put(key, speakers.get(key));
			nb++;
		}
		
		return speakerOutput;
	}


	public HashMap<Integer,HashMap<String,Integer>> getSpeakerParAnnee(String nom_speaker) {		
		HashMap<Integer,HashMap<String,Integer>> annees = Maps.newHashMap();
		ResultSet results = session.execute("select nom_speaker, annee, nb from speaker_par_annee where nom_speaker = '" + nom_speaker +"'");		
		for(Row row:results){
			HashMap<String,Integer> soc = Maps.newHashMap();
			soc.put(row.getString("nom_speaker"), row.getInt("nb"));
			if(!annees.containsKey(row.getInt("annee"))){
				annees.put(row.getInt("annee"),new HashMap<String,Integer>());
			}
			annees.get(row.getInt("annee")).put(row.getString("nom_speaker"), row.getInt("nb"));			
			
		}
					
		return annees;
	}


	public HashMap<Integer, HashMap<String, Integer>> getBuzzwordByAnnee(String buzzword) {
		HashMap<Integer,HashMap<String,Integer>> annees = Maps.newHashMap();
		ResultSet results = session.execute("select keyword, annee, nb from keyword_par_annee where keyword='" + buzzword +"'");		
		for(Row row:results){
			HashMap<String,Integer> keyw = Maps.newHashMap();
			keyw.put(row.getString("keyword"), row.getInt("nb"));
			if(!annees.containsKey(row.getInt("annee"))){
				annees.put(row.getInt("annee"),new HashMap<String,Integer>());
			}
			annees.get(row.getInt("annee")).put(row.getString("keyword"), row.getInt("nb"));			
			
		}
					
		return annees;
	}
	
	
	public HashMap<String,Long> getTableCounts() {
		// on compte les enregistrements dans les tables remplies par Spark
		HashMap<String,Long> counts = Maps.newHashMap();
		String[] tables = {"keyword_par_annee","societe_par_annee","speaker_par_societe","speaker_par_annee","talk_par_speaker","talk_par_societe"};
		
		for(String table:tables){			
			ResultSet results = session.execute("select count(1) as nb from " + table);		
			Row row = results.one();
			counts.put(table, row.getLong("nb"));
		}
	
		
		return counts;
	}
	
	
	public HashMap<Integer,ArrayList<TalkBean>> getSpeakerTalks(String idSpeaker) {
		// recup de la liste des talks d'un speaker, trié par année
		HashMap<Integer,ArrayList<TalkBean>> talks = Maps.newHashMap();
		
					
		ResultSet results = session.execute("select id_speaker, type_talk, titre, annee from talk_par_speaker where id_speaker = '" + idSpeaker + "'");
		
		for(Row row:results){
			LinkedHashSet<String> speakers = new LinkedHashSet<String>();
			speakers.add(idSpeaker);
			TalkBean talk = new TalkBean(row.getString("titre"), row.getInt("annee"), row.getString("type_talk"), speakers);

			// on regroupe les talks dans la HashMap par année 
			ArrayList<TalkBean> subTalks = Lists.newArrayList();
			if(talks.containsKey(row.getInt("annee"))){
				subTalks = talks.get(row.getInt("annee"));								
			}
			subTalks.add(talk);
			talks.put(row.getInt("annee"), subTalks);
		}
		
	
		
		return talks;
	}
	
	public HashMap<Integer,ArrayList<TalkBean>> getSocieteTalks(String societe) {
		// recup de la liste des talks d'un speaker, trié par année
		HashMap<Integer,ArrayList<TalkBean>> talks = Maps.newHashMap();
		
					
		ResultSet results = session.execute("select societe, titre, type_talk, annee from talk_par_societe where societe = '" + societe + "'");
		
		for(Row row:results){			
			TalkBean talk = new TalkBean(row.getString("titre"), row.getInt("annee"), row.getString("type_talk"), null);

			// on regroupe les talks dans la HashMap par année 
			ArrayList<TalkBean> subTalks = Lists.newArrayList();
			if(talks.containsKey(row.getInt("annee"))){
				subTalks = talks.get(row.getInt("annee"));								
			}
			subTalks.add(talk);
			talks.put(row.getInt("annee"), subTalks);
		}
		
	
		
		return talks;
	}


	public HashMap<Integer,HashMap<String, Integer>> getNbSpeakersParAnnee() {
		HashMap<Integer,HashMap<String, Integer>> output = new HashMap<Integer,HashMap<String, Integer>>();
		
		
		ResultSet results = session.execute("select annee, id_speaker from speaker_par_annee");
		for(Row row:results){
			if(output.containsKey(row.getInt("annee"))){
				HashMap<String, Integer> nbSpeakers = output.get(row.getInt("annee"));
				nbSpeakers.put("Speakers",nbSpeakers.get("Speakers")+1);
				output.put(row.getInt("annee"), nbSpeakers);
				
				
			}else{
				HashMap<String, Integer> nbSpeakers = Maps.newHashMap();
				nbSpeakers.put("Speakers", 1);
				output.put(row.getInt("annee"), nbSpeakers);
			}
		}
		
		
		List<Integer> sortedKeys=new ArrayList<Integer>(output.keySet());
		Collections.sort(sortedKeys);
		
		for(Integer key:sortedKeys){
			output.put(key, output.get(key));
		}
		
		
		
		return output;
	}
}

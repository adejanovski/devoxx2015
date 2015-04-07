package fr.chronopost.labs.utils;

import java.util.ArrayList;
import java.util.Collections;
import java.util.HashMap;
import java.util.Set;
import java.util.SortedSet;
import java.util.TreeSet;

import org.testng.collections.Lists;

public class Utils {
	
	
	public static String formatGraphData(HashMap<Integer,HashMap<String,Integer>> graphData){		
		/*	output : [
	        {"Annee": "2015", "TIA":62, "Conf":88, "Lab":15, "Quickie":20},
	        {"Annee": "2014", "TIA":44, "Conf":75, "Lab":13, "Quickie":24},
	        {"Annee": "2013", "TIA":23, "Conf":60, "Lab":12, "Quickie":18},
	        {"Annee": "2012", "TIA":34, "Conf":65, "Lab":10, "Quickie":12}
	   ]*/
		
		Integer[] annees = {2012,2013,2014,2015};
		
		StringBuilder output = new StringBuilder();
		SortedSet<Integer> keys = new TreeSet<Integer>(graphData.keySet());
		SortedSet<String> series =  new TreeSet<String>();
		for(Integer key:keys){
			Set<String> subKeys = graphData.get(key).keySet();
			for(String subKey:subKeys){
				series.add(subKey);
			}
		}
		output.append("[");
		int nb = 0;
		for(Integer annee:annees){
			if(!keys.contains(annee)){
				if(nb>0){
					output.append(",{\"Annee\":\"" + annee + "\"");
				}else{
					output.append("{\"Annee\":\"" + annee + "\"");
				}
				for(String serie:series){					
						output.append(",\"" + serie + "\":0");
				}
				output.append("}");
				nb++;
			}else{
				SortedSet<String> subKeys = new TreeSet<String>(graphData.get(annee).keySet());
				if(nb>0){
					output.append(",{\"Annee\":\"" + annee + "\"");
				}else{
					output.append("{\"Annee\":\"" + annee + "\"");
				}
				
				for(String subKey:subKeys){
					output.append(",\"" + subKey + "\":" + graphData.get(annee).get(subKey));
				}
				for(String serie:series){
					if(!graphData.get(annee).containsKey(serie)){
						output.append(",\"" + serie + "\":0");
					}
				}
				output.append("}");
				nb++;	
			}
		}
		
		
		
		
		
		output.append("]");
		
		return output.toString();
		
	}

}

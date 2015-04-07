package fr.chronopost.labs.utils;

import java.util.HashMap;

import org.testng.annotations.Test;
import org.testng.collections.Maps;
import static org.testng.Assert.*;

public class UtilsTest {

  @Test
  public void formatGraphData() {
    HashMap<Integer,HashMap<String,Integer>> graphData = new HashMap<Integer,HashMap<String,Integer>>();
    
    HashMap<String, Integer> values = new HashMap<String,Integer>();
    values.put("val1", 1);
    values.put("val3", 3);
    values.put("val2", 2);
    
    
    
    graphData.put(2013, values);
    graphData.put(2014, values);
    graphData.put(2015, values);
    graphData.put(2012, values);
    
	String graphDataJson = Utils.formatGraphData(graphData);
	String expected = "[{\"Annee\":\"2012\",\"val1\":1,\"val2\":2,\"val3\":3},{\"Annee\":\"2013\",\"val1\":1,\"val2\":2,\"val3\":3},{\"Annee\":\"2014\",\"val1\":1,\"val2\":2,\"val3\":3},{\"Annee\":\"2015\",\"val1\":1,\"val2\":2,\"val3\":3}]";	                	        
	assertEquals(graphDataJson, expected);
  }
  
  
}

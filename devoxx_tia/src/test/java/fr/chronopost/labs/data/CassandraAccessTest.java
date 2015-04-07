package fr.chronopost.labs.data;

import java.util.HashMap;
import java.util.LinkedHashMap;

import org.testng.annotations.Test;

import com.fasterxml.jackson.core.JsonProcessingException;
import com.fasterxml.jackson.databind.ObjectMapper;

public class CassandraAccessTest {

  @Test
  public void getTopBuzzwords() {
	  CassandraAccess.INSTANCE.getTopBuzzwords();
  }
  
  
  @Test
  public void getByTalksTypeParAnnee() throws JsonProcessingException{
	  HashMap<Integer, HashMap<String, Integer>> res = CassandraAccess.INSTANCE.getByTalksTypeParAnnee();
	  ObjectMapper mapper = new ObjectMapper();
	  //writer = new 
	  System.out.println(mapper.writeValueAsString(res));
  }
  
  @Test
  public void getTopSociete() throws JsonProcessingException{
	  LinkedHashMap<String, Integer> res = CassandraAccess.INSTANCE.getTopSociete();
	  ObjectMapper mapper = new ObjectMapper();
	  //writer = new 
	  System.out.println(mapper.writeValueAsString(res));
  }
  
}

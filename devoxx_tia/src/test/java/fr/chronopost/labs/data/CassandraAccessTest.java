package fr.chronopost.labs.data;

import org.testng.annotations.Test;

public class CassandraAccessTest {

  @Test
  public void getTopBuzzwords() {
	  CassandraAccess.INSTANCE.getTopBuzzwords();
  }
}

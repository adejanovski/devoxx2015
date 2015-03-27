package fr.chronopost.labs.data;

import com.datastax.driver.core.Cluster;
import com.datastax.driver.core.Session;

public class CassandraConnection {
	
	private static Session session;
	private static Cluster cluster;
	
	/**
	 * Méthode qui va nous retourner notre instance
	 * et la créer si elle n'existe pas...
	 * @return
	 */
	public static Session getInstance(){
		if(session == null){
			try {
				cluster = Cluster.builder().addContactPoint("centosvm").build();
				session = cluster.connect("devoxx");
			} catch (Exception e) {
				e.printStackTrace();
			}
		}		
		return session;	
	}	
}

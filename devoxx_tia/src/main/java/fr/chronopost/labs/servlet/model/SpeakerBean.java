package fr.chronopost.labs.servlet.model;

import java.util.Date;

public class SpeakerBean {

	private String id;
	private String nom;
	private String societe;
	private String twitter;
	
	
	
	
	public SpeakerBean(String id, String nom, String societe, String twitter) {
		super();
		this.id = id;
		this.nom = nom;
		this.societe = societe;
		this.twitter = twitter;
	}
	
	
	public String getId() {
		return id;
	}
	public void setId(String id) {
		this.id = id;
	}
	public String getNom() {
		return nom;
	}
	public void setNom(String nom) {
		this.nom = nom;
	}
	public String getSociete() {
		return societe;
	}
	public void setSociete(String societe) {
		this.societe = societe;
	}
	public String getTwitter() {
		return twitter;
	}
	public void setTwitter(String twitter) {
		this.twitter = twitter;
	}

	
}

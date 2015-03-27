package fr.chronopost.labs.servlet.model;

import java.util.Date;

public class SpeakerParAnBean {
	
	private String nom;
	private int annee;
	
	
		
	public SpeakerParAnBean(String nom, int annee) {
		super();		
		this.nom = nom;
		this.annee = annee;		
	}


	public String getNom() {
		return nom;
	}


	public void setNom(String nom) {
		this.nom = nom;
	}


	public int getAnnee() {
		return annee;
	}

	public void setAnnee(int annee) {
		this.annee = annee;
	}
	
	
	
	
}

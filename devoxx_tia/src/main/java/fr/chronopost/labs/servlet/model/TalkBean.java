package fr.chronopost.labs.servlet.model;

import java.util.Date;
import java.util.LinkedHashSet;

import com.fasterxml.jackson.annotation.JsonProperty;
import com.fasterxml.jackson.databind.annotation.JsonSerialize;

public class TalkBean {

	private String titre;
	private int annee;
	private String typeTalk;
	private LinkedHashSet<String> speakers;
		
	
	public TalkBean(String titre, int annee, String typeTalk,
			LinkedHashSet<String> speakers) {
		super();
		this.titre = titre;
		this.annee = annee;
		this.typeTalk = typeTalk;
		this.speakers = speakers;
	}
		
	@JsonProperty
	public String getTitre() {
		return titre;
	}
	public void setTitre(String titre) {
		this.titre = titre;
	}
	
	@JsonProperty
	public int getAnnee() {
		return annee;
	}
	public void setAnnee(int annee) {
		this.annee = annee;
	}
	
	@JsonProperty
	public String getTypeTalk() {
		return typeTalk;
	}
	public void setTypeTalk(String typeTalk) {
		this.typeTalk = typeTalk;
	}
	
	@JsonProperty
	public LinkedHashSet<String> getSpeakers() {
		return speakers;
	}
	
	public void setSpeakers(LinkedHashSet<String> speakers) {
		this.speakers = speakers;
	}

	
}

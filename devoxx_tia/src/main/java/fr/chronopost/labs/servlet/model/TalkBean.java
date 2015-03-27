package fr.chronopost.labs.servlet.model;

import java.util.Date;
import java.util.LinkedHashSet;

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
		
	
	public String getTitre() {
		return titre;
	}
	public void setTitre(String titre) {
		this.titre = titre;
	}
	public int getAnnee() {
		return annee;
	}
	public void setAnnee(int annee) {
		this.annee = annee;
	}
	public String getTypeTalk() {
		return typeTalk;
	}
	public void setTypeTalk(String typeTalk) {
		this.typeTalk = typeTalk;
	}
	public LinkedHashSet<String> getSpeakers() {
		return speakers;
	}
	public void setSpeakers(LinkedHashSet<String> speakers) {
		this.speakers = speakers;
	}

	
}

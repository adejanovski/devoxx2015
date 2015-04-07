package com.chronopost.vision.DevoxxSparkJava;

import java.io.Serializable;

public class Person implements Serializable {

	/**
	 * 
	 */
	private static final long serialVersionUID = 1833795838788347556L;

	private String speaker;
	private String name;
	private int annee;

	public int getAnnee() {
		return annee;
	}

	public void setAnnee(int annee) {
		this.annee = annee;
	}

	public Person(int i_anneei, String i_speaker) {

		annee = i_anneei;
		name = i_speaker;

	}

	public Person() {
		// TODO Auto-generated constructor stub
	}

	public String getName() {
		return name;
	}

	public void setName(String name) {
		this.name = name;
	}

	/**
	 * @return the speaker
	 */
	public final String getSpeaker() {
		return speaker;
	}

	/**
	 * @param speaker
	 *            the speaker to set
	 */
	public final void setSpeaker(String speaker) {
		this.speaker = speaker;
	}

}

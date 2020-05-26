package com.springmvc.model;

/**
 * POJO class for handling the Doctor data
 */
public class Doctor extends User {
	private String username;
	private String name;
	private String gender;
	private String rank;
	private String field;
	private String description;
	
	public Doctor() {
		name = ""; gender = ""; 
		rank = ""; field = "";
		description = "";
	}

	/* Username tasks */
	public String getUsername() {
		return username;
	}
	public void setUsername(String username) {
		this.username = username;
	}

	/* Name tasks */
	public String getName() {
		return name;
	}
	public void setName(String name) {
		this.name = name;
	}

	/* Gender tasks */
	public String getGender() {
		return gender;
	}
	public void setGender(String gender) {
		this.gender = gender;
	}

	/* Rank tasks */
	public String getRank() {
		return rank;
	}
	public void setRank(String rank) {
		this.rank = rank;
	}

	/* Field tasks */
	public String getField() {
		return field;
	}
	public void setField(String field) {
		this.field = field;
	}

	/* Description tasks */
	public String getDescription() {
		return description;
	}
	public void setDescription(String description) {
		this.description = description;
	}

}

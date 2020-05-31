package com.springmvc.model;

public class SymptomReport {
	private String gender, dob, id, address, description;
	
	public SymptomReport() {
		gender = "";
		dob = "";
		id = "";
		address = "";
		description= "";
	}

	/* Gender tasks */
	public String getGender() {
		return gender;
	}
	public void setGender(String gender) {
		this.gender = gender;
	}

	/* ID tasks */
	public String getId() {
		return id;
	}
	public void setId(String id) {
		this.id = id;
	}

	/* DOB tasks */
	public String getDob() {
		return dob;
	}
	public void setDob(String dob) {
		this.dob = dob;
	}
	
	/* Address tasks */
	public String getAddress() {
		return address;
	}
	public void setAddress(String address) {
		this.address = address;
	}

	/* Description tasks */
	public String getDescription() {
		return description;
	}
	public void setDescription(String description) {
		this.description = description;
	}
}

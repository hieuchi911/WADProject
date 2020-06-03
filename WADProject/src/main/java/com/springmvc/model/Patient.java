package com.springmvc.model;

/**
 * POJO class for handling the Patient data
 */
public class Patient extends User {
	private String username;
	private String name;
	private String gender;
	private String phone;
	private String address;
	private PatientDescription description;
	
	public Patient() {
		name = ""; gender = "";
		phone = ""; address = "";
		
		description = new PatientDescription();
		description.setAllergy("");
		description.setBackground("");
		description.setCurrent("");
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

	/* Phone tasks */
	public String getPhone() {
		return phone;
	}
	public void setPhone(String phone) {
		this.phone = phone;
	}

	/* Address tasks */
	public String getAddress() {
		return address;
	}
	public void setAddress(String address) {
		this.address = address;
	}

	/* Description tasks */
	public PatientDescription getDescription() {
		return description;
	}
	public void setDescription(String description) {
		if (description.length() == 0) 
			description = ".||.||.";
		String[] att = description.split("\\|\\|");
		this.description.setAllergy(att[0]);
		this.description.setBackground(att[1]);
		this.description.setCurrent(att[2]);
	}
}

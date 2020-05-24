package com.springmvc.model;

/**
 * POJO class for handling the Patient data
 */
public class Patient {
	
	private String username;
	private String name;
	private String gender;
	private String phone;
	private String address;
	private String description;
	
	public Patient() {
		name = ""; gender = "";
		phone = ""; address = "";
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
	public String getDescription() {
		return description;
	}
	public void setDescription(String description) {
		this.description = description;
	}

}

package com.springmvc.model;

/**
 * POJO class for handling the User data
 */
public class User {
	private String username;
	private String password;
	private String usertype;
	
	public User() {}
	
	/* Username tasks */
	public String getUsername() {
		return username;
	}
	public void setUsername(String username) {
		this.username = username;
	}

	/*  Password tasks */
	public String getPassword() {
		return password;
	}
	public void setPassword(String password) {
		this.password = password;
	}
	
	/*  Usertype tasks */
	public String getUsertype() {
		return usertype;
	}
	public void setUsertype(String usertype) {
		this.usertype = usertype;
	}
}

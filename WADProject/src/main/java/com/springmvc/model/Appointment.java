package com.springmvc.model;

public class Appointment {
	private String doctor;
	private String patient;
	private String illness_description;	// change this to symptom report!!!!!!!
	private String from_to;
	
	public String getDoctor() {
		return this.doctor;
	}
	
	public void setDoctor(String doctor) {
		this.doctor = doctor;
	}
	
	public String getPatient() {
		return this.patient;
	}
	
	public void setPatient(String patient) {
		this.patient = patient;
	}
	
	public String getIllness_description() {
		return this.illness_description;
	}
	
	public void setIllness_description(String descr) {
		this.illness_description = descr ;
	}
	
	public String getFrom_to() {
		return this.from_to;
	}
	
	public void setFrom_to(String duration) {
		this.from_to = duration ;
	}

}

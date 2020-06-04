package com.springmvc.model;

public class Prescription {
	private String doctor;
	private String patient;
	private String diagnosis;	// change this to symptom report!!!!!!!
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
	
	public String getDiagnosis() {
		return this.diagnosis;
	}
	
	public void setDiagnosis(String diagnosis) {
		this.diagnosis = diagnosis ;
	}
	
	public String getFrom_to() {
		return this.from_to;
	}
	
	public void setFrom_to(String duration) {
		this.from_to = duration ;
	}
}

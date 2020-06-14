package com.springmvc.model;

public class Appointment {
	private String doctor;
	private String patient;
	private PatientDescription illness_description;
	private String from_to;
	
	public Appointment() {
		illness_description = new PatientDescription();
		illness_description.setAllergy("");
		illness_description.setBackground("");
		illness_description.setCurrent("");
	}
	
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
	
	public PatientDescription getIllness_description() {
		return this.illness_description;
	}
	
	public void setIllness_description(String descr) {
		if (descr.length() == 0) 
			descr = ".||.||.";
		String[] att = descr.split("\\|\\|");
		this.illness_description.setAllergy(att[0]);
		this.illness_description.setBackground(att[1]);
		this.illness_description.setCurrent(att[2]);
	}
	
	public String getFrom_to() {
		if (this.from_to.equals("none") ) {
			return "";
		} else {
			String[] res = this.from_to.split("_");
			String result = res[0] + " o\'clock - shift " + res[1];
			return result;
		}
	}
	
	public void setFrom_to(String duration) {
		this.from_to = duration;
	}

}

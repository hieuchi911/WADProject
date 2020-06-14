package com.springmvc.model;

public class PrescribedMedicine extends Medicine {
	private String prescriptionid;
	private String medicineid;
	private int amount;
	private String dosage;
	
	public String getPrescriptionid() {
		return this.prescriptionid;
	}
	public void setPrescriptionid(String prescriptionid) {
		this.prescriptionid = prescriptionid;
	}
	
	public String getMedicineid() {
		return this.medicineid;
	}
	public void setMedicineid(String medicineid) {
		this.medicineid = medicineid;
	}
	
	public int getAmount() {
		return this.amount;
	}
	public void setAmount(int amount) {
		this.amount = amount;
	}
	
	public String getDosage() {
		return this.dosage;
	}
	public void setDosage(String dosage) {
		this.dosage = dosage;
	}
}

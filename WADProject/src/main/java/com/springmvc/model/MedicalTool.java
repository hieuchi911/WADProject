package com.springmvc.model;

/**
 * POJO class for handling the Medical-tool data
 */
public class MedicalTool extends ShopObject {
	private String description;
	
	public MedicalTool() {}

	/* Description tasks */
	public String getDescription() {
		return description;
	}
	public void setDescription(String description) {
		this.description = description;
	}
}

package com.springmvc.model;

/**
 * POJO class for handling the Medical-tool data
 */
public class MedicalTool extends ShopObject {
	private String usage;
	
	public MedicalTool() {}

	/* Description tasks */
	public String getUsage() {
		return usage;
	}
	public void setUsage(String usage) {
		this.usage = usage;
	}
}

package com.springmvc.model;

/**
 * POJO class for handling the Patient Description data
 */
public class PatientDescription {
	private String allergy = "";
	private String background = "";
	private String current = "";
	
	/* Allergy tasks */
	public void setAllergy(String allergy) {
		if (allergy.equals("."))
			this.allergy = "";
		else this.allergy = allergy;	
	}
	public String getAllergy() {
		return allergy;
	}

	/* Background diseases tasks */
	public void setBackground(String background) {
		if (background.equals("."))
			this.background = "";
		else this.background = background;	
	}
	public String getBackground() {
		return background;
	}
	
	/* Current diseases tasks */
	public void setCurrent(String current) {
		if (current.equals("."))
			this.current = "";
		else this.current = current;
	}
	public String getCurrent() {
		return current;
	}
	
	@Override
	public String toString() {
		String s_allergy = "";
		if (allergy.length() == 0)
			s_allergy = ".";
		
		String s_background = "";
		if (background.length() == 0)
			s_background = ".";
		
		String s_current = "";
		if (current.length() == 0)
			s_current = ".";
		
		return s_allergy + "||" + s_background + "||" + s_current;
	}
}
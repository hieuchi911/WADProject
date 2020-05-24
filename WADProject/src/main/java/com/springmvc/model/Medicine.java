package com.springmvc.model;

/**
 * POJO class for handling the Medicine data
 */
public class Medicine extends ShopObject {
	private String usage;
	private String ingredients;
	private String sideeffects;
	
	public Medicine() {}

	/* Usage tasks */
	public String getUsage() {
		return usage;
	}
	public void setUsage(String usage) {
		this.usage = usage;
	}

	/* Ingredients tasks */
	public String getIngredients() {
		return ingredients;
	}
	public void setIngredients(String ingredients) {
		this.ingredients = ingredients;
	}

	/* Side-effects tasks */
	public String getSideeffects() {
		return sideeffects;
	}
	public void setSideeffects(String sideeffects) {
		this.sideeffects = sideeffects;
	}

}

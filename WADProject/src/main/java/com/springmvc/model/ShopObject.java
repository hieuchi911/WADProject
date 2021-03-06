package com.springmvc.model;

/**
 * POJO class for handling the Shop-object data
 */
public class ShopObject {
	private String object_id;
	private String url;
	private String name;
	private String category;
	private String manufacturer;
	private String description;
	private double price;
	
	public ShopObject() {}

	/* URL tasks */
	public String getUrl() {
		return url;
	}
	public void setUrl(String url) {
		this.url = url;
	}
	
	/* Name tasks */
	public String getName() {
		return name;
	}
	public void setName(String name) {
		this.name = name;
	}

	/* Manufacturer tasks */
	public String getManufacturer() {
		return manufacturer;
	}
	public void setManufacturer(String manufacturer) {
		this.manufacturer = manufacturer;
	}

	/* Description tasks */
	public String getDescription() {
		return description;
	}
	public void setDescription(String description) {
		this.description = description;
	}

	/* Price tasks */
	public double getPrice() {
		return price;
	}
	public void setPrice(double price) {
		this.price = price;
	}
	
	/* Category tasks */
	public String getCategory() {
		return category;
	}
	public void setCategory(String category) {
		this.category = category;
	}
	
	/* ID tasks */
	public String getId() {
		return object_id;
	}
	public void setId(String object_id) {
		this.object_id = object_id;		
	}
}

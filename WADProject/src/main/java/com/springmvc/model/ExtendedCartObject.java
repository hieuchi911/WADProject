package com.springmvc.model;

/**
 * POJO class for extending cart-item data with shop-object data
 */
public class ExtendedCartObject {
	private String objectid;
	private String url;
	private String name;
	private String manufacturer;
	private double price;
	private int amount;
	
	public ExtendedCartObject() {}
	
	/* Object ID tasks */
	public String getObjectid() {
		return objectid;
	}
	public void setObjectid(String objectid) {
		this.objectid = objectid;
	}
	
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

	/* Price tasks */
	public double getPrice() {
		return price;
	}
	public void setPrice(double price) {
		this.price = price;
	}
	
	/* Amount tasks */
	public int getAmount() {
		return amount;
	}
	public void setAmount(int amount) {
		this.amount = amount;
	}
}

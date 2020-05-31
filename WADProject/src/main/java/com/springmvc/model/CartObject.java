package com.springmvc.model;

/**
 * POJO class for handling the cart-item data
 */
public class CartObject {
	private String cartid;
	private String objectid;
	private int amount;
	
	public CartObject() {}

	/* Cart ID tasks */
	public String getCartid() {
		return cartid;
	}
	public void setCartid(String cartid) {
		this.cartid = cartid;
	}
	
	/* Object ID tasks */
	public String getObjectid() {
		return objectid;
	}
	public void setObjectid(String objectid) {
		this.objectid = objectid;
	}
	
	/* Amount tasks */
	public int getAmount() {
		return amount;
	}
	public void setAmount(int amount) {
		this.amount = amount;
	}
}

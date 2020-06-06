package com.springmvc.model;

import java.util.List;

public class Cart {
	private String cart_id;
	private String checkout_date;
	private ObjectListContainer<CartObject> cart_objects;
	
	public Cart() {}

	/* Cart ID tasks */
	public String getCartid() {
		return cart_id;
	}
	public void setCartid(String cart_id) {
		this.cart_id = cart_id;
	}
	
	/* Checkout tasks */
	public String getCheckout() {
		return checkout_date;
	}
	public void setCheckout(String checkout_date) {
		this.checkout_date = checkout_date;
	}

	/* Shopping items tasks */
	public ObjectListContainer<CartObject> getItems() {
		return cart_objects;
	}
	public void setItems(ObjectListContainer<CartObject> objects) {
		this.cart_objects = objects;
	}
}

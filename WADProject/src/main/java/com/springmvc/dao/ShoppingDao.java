package com.springmvc.dao;

import java.util.List;

import com.springmvc.model.ShopObject;

/**
 * Data Access Object of Shopping Objects instances
 */
public interface ShoppingDao {
	/*
	 * This function provides all available shopping objects from the database
	 * @return 			(List <ShopObject>) The list of shopping objects
	 */
	List <ShopObject> getAllShopObjects();
}
package com.springmvc.service;

import java.util.List;

import com.springmvc.model.ShopObject;

/**
 * General services related to Shopping Object instances
 */
public interface ShoppingService {
	/*
	 * This function provides all available shopping objects via Data Access Object
	 * @return 			(List <ShopObject>) The list of shopping objects
	 */
	List <ShopObject> getAllShopObjects();
}
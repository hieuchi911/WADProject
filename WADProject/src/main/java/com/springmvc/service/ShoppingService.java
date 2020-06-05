package com.springmvc.service;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;

import com.springmvc.dao.ShoppingDao;
import com.springmvc.model.CartObject;
import com.springmvc.model.ExtendedCartObject;
import com.springmvc.model.ShopObject;

/**
 * This class provides implementations of Shopping Services
 */
public class ShoppingService {
	
	@Autowired
	public ShoppingDao shoppingDao;
	
	public List <ShopObject> getAllShopObjects() {
		return shoppingDao.getAllShopObjects();
	}
	
	public 	List <ShopObject> getShopObjectsByCategory(String category) {
		return shoppingDao.getShopObjectByCategory(category);
	}
	
	public ShopObject getShopObject(String object_id) {
		return shoppingDao.getShopObject(object_id);
	}
	
	public List<ExtendedCartObject> extendCartObjects(List<CartObject> objects) {
		return shoppingDao.extendCartObjects(objects);
	}
}

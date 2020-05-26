package com.springmvc.service;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;

import com.springmvc.dao.ShoppingDao;
import com.springmvc.model.ShopObject;

/**
 * This class provides implementations of Shopping Services
 */
public class ShoppingServiceImpl implements ShoppingService {
	
	@Autowired
	public ShoppingDao shoppingDao;
	
	public List <ShopObject> getAllShopObjects() {
		return shoppingDao.getAllShopObjects();
	}

}

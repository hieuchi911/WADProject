package com.springmvc.controller;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.servlet.ModelAndView;

import com.springmvc.model.ObjectListContainer;
import com.springmvc.model.ShopObject;
import com.springmvc.service.ShoppingService;

/** 
 * The ShopController class handles shopping activities of the user,
 * with urls:
 * | "/shop"				This page shows the shopping catalogues
 * 
 */
@Controller
public class ShopController {
	
	@Autowired
	ShoppingService shopService;
	
	/* ---------------------------- showShop --------------------------------------
	 * This method shows the shopping screen in url "/shop".
	 */
	@RequestMapping(value = "/shop", method = RequestMethod.GET)
	public ModelAndView showShop(HttpServletRequest request, HttpServletResponse response) {
		ModelAndView mav = new ModelAndView("shop");
		
		ObjectListContainer<ShopObject> objects = new ObjectListContainer<ShopObject>();
		objects.setObjects(shopService.getAllShopObjects());
		
		mav.addObject("objects", objects);
		return mav;
	}

}

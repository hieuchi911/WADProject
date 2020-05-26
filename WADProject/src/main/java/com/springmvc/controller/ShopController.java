package com.springmvc.controller;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.servlet.ModelAndView;

import com.springmvc.model.Doctor;
import com.springmvc.model.Login;
import com.springmvc.model.ObjectListContainer;
import com.springmvc.model.Patient;
import com.springmvc.model.User;
import com.springmvc.service.UserService;

/** 
 * The ShopController class handles shopping activities of the user,
 * with urls "/shop".
 * 
 */
@Controller
public class ShopController {
	@Autowired
	UserService userService;
	
	/* ---------------------------- showShop --------------------------------------
	 * This method shows the shopping screen in url "/shop".
	 */
	@RequestMapping(value = "/shop", method = RequestMethod.GET)
	public ModelAndView showShop(HttpServletRequest request, HttpServletResponse response) {
		ModelAndView mav = new ModelAndView("shop");
		
		ObjectListContainer objects = new ObjectListContainer();
		objects.setObjects(userService.getAllShopObjects());
		
		mav.addObject("objects", objects);
		return mav;
	}

}

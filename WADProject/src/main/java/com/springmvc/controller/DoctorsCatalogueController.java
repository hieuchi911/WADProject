package com.springmvc.controller;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.servlet.ModelAndView;

import com.springmvc.model.DoctorListContainer;
import com.springmvc.model.Doctor;
import com.springmvc.service.UserService;

/** 
 * The ShopController class handles shopping activities of the user,
 * with urls:
 * | "/shop"				This page shows the shopping catalogues
 * 
 */
@Controller
public class DoctorsCatalogueController {
	@Autowired
	UserService userService;
	
	/* ---------------------------- showShop --------------------------------------
	 * This method shows the shopping screen in url "/shop".
	 */
	@RequestMapping(value = "/showDoctors", method = RequestMethod.GET)
	public ModelAndView showDoctors(HttpServletRequest request, HttpServletResponse response) {
		ModelAndView mav = new ModelAndView("doctors");

		DoctorListContainer<Doctor> doctors = new DoctorListContainer<Doctor>();
		doctors.setDoctors(userService.getAllDoctors());
		for(Doctor d: doctors.getDoctors())
			System.out.println(d.getUsername());
		mav.addObject("doctors", doctors);
		return mav;
	}
}
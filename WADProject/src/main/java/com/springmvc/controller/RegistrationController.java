package com.springmvc.controller;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.servlet.ModelAndView;

import com.springmvc.model.Login;
import com.springmvc.model.Patient;
import com.springmvc.model.User;
import com.springmvc.service.UserService;

/** 
 * The RegistrationController class handles login activities of the user,
 * with urls: 
 * | "/register"			This url shows the patient registration screen.
 * | "/registerProcess" 	This url handles user's registration form.
 * 
 * For the time being, this controller class only allows patient registration
 * 
 */
@Controller
public class RegistrationController {
	
	@Autowired
	public UserService userService;
	
	/* ---------------------------- showRegister --------------------------------------
	 * This method shows the registration form url "/register".
	 */
	@RequestMapping(value = "/register", method = RequestMethod.GET)
	public ModelAndView showRegister(HttpServletRequest request, HttpServletResponse response) {
		ModelAndView mav = new ModelAndView("register");
		mav.addObject("patient", new Patient());
		
		return mav;
	}

	/* ---------------------------- addUser --------------------------------------
	 * This method adds a new user with the registration url "/registerProcess".
	 */
	@RequestMapping(value = "/registerProcess", method = RequestMethod.POST)
	public ModelAndView addUser(HttpServletRequest request, HttpServletResponse response,
			@ModelAttribute("patient") Patient patient) {

		userService.register(patient);
		
		ModelAndView mv = new ModelAndView();
		mv.setViewName("patientInfo");
		mv.addObject("patient", patient);
		
		return mv;
	}
	
	/* ---------------------------- continueRegistration --------------------------------------
	 * This method adds a new user with the registration url "/registerProcess".
	 */
	@RequestMapping(value = "/registerPatient", method = RequestMethod.POST)
	public String  continueRegistration(HttpServletRequest request, HttpServletResponse response,
			@ModelAttribute("patient") Patient patient) {
		patient = userService.registerPatient(patient);
		return "redirect:/";
	}
}

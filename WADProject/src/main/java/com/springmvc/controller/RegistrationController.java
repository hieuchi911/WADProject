package com.springmvc.controller;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.servlet.ModelAndView;

import com.springmvc.model.Patient;
import com.springmvc.model.Doctor;
import com.springmvc.model.User;
import com.springmvc.service.UserService;

/** 
 * The RegistrationController class handles login activities of the user,
 * with urls "/register" and "/registerProcess".
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
		mav.addObject("user", new User());

		return mav;
	}

	/* ---------------------------- addUser --------------------------------------
	 * This method adds a new user with the registration url "/registerProcess".
	 */
	@RequestMapping(value = "/registerProcess", method = RequestMethod.POST)
	public ModelAndView addUser(HttpServletRequest request, HttpServletResponse response,
			@ModelAttribute("user") User user) {

		userService.register(user);
	
		Patient patient = new Patient();
		ModelAndView mv = new ModelAndView();
		mv.setViewName("patientInfo");
		mv.addObject("user", user);
		mv.addObject("patient", patient);

		return mv;
	
		
//		Doctor doctor = userService.registerDoctor(user);
//		ModelAndView mv = new ModelAndView();
//		mv.setViewName("doctorInfo");
//		mv.addObject("user", doctor.getUsername());
//		return mv;
	}
	
	/* ---------------------------- addUser --------------------------------------
	 * This method adds a new user with the registration url "/registerProcess".
	 */
	@RequestMapping(value = "/registerPatient", method = RequestMethod.POST)
	public ModelAndView continueRegistration(HttpServletRequest request, HttpServletResponse response,
			@ModelAttribute("patient") Patient patient) {
		Patient p = userService.registerPatient(patient);
		ModelAndView mv = new ModelAndView();
		mv.setViewName("patientprofile");
		mv.addObject("username", p.getUsername());
		mv.addObject("name", p.getName());
		mv.addObject("sex", p.getGender());
		mv.addObject("phone", p.getPhone());
		mv.addObject("address", p.getAddress());
		mv.addObject("description", p.getDescription());
		return mv;
	}
}

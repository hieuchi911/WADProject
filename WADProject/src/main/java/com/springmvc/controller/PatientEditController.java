package com.springmvc.controller;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
//import org.springframework.web.bind.annotation.SessionAttributes;
import org.springframework.web.bind.annotation.SessionAttribute;
import org.springframework.web.servlet.ModelAndView;


import com.springmvc.model.User;
import com.springmvc.model.Patient;
import com.springmvc.model.Login;
import com.springmvc.service.UserService;

/** 
 * PatientEditController helps edit a patient's infor fields,
 * with urls:
 * | "/editUsername"	This url update the database with the specified username	 
 * | "/editFullName"	This url update the database with the specified name	 
 * | "/editGender"		This url update the database with the specified gender 	 
 * | "/editPhone"		This url update the database with the specified phone
 * | "/editDescription"	This url update the database with the specified description
 * 
 */
@Controller

public class PatientEditController {
	@Autowired
	UserService userService;
	
	@RequestMapping(value = "/editUser", method = RequestMethod.GET)
	public ModelAndView editUser(HttpServletRequest request, HttpServletResponse response,
			@SessionAttribute User user) {
		if(request.getParameter("edit-profile") != null) {
			System.out.println("user session is: " + user.getUsername());
			ModelAndView mav = new ModelAndView("editpatientprofile");
			Patient patient = new Patient();
			mav.addObject("patient", patient);
			return mav;
		}
		if(request.getParameter("edit-password") != null) {
			ModelAndView mav = new ModelAndView("editpassword");
			return mav;
		}
		
		if(request.getParameter("doctors") != null) {
			ModelAndView mav = new ModelAndView("doctors");
			Patient patient = new Patient();
			mav.addObject("patient", patient);
			mav.addObject("user", user);
			return mav;
		}
		return null;
	}

	@RequestMapping(value = "/editProfile", method = RequestMethod.POST)
	public ModelAndView editProfile(HttpServletRequest request, HttpServletResponse response,
			@ModelAttribute("patient") Patient patient, @SessionAttribute User user) {
		ModelAndView mav = null;

		if (user != null) {
			System.out.println("User name is: " + user.getUsername());
			if (user instanceof Patient) {
				user = userService.registerPatient(patient);
				
				mav = new ModelAndView("patientprofile");

				mav.addObject("user", user);
			}
		}
		return mav;
	}
	
	@RequestMapping(value = "/editPassword", method = RequestMethod.POST)
	public ModelAndView editPassword(HttpServletRequest request, HttpServletResponse response, @SessionAttribute User user) {
		ModelAndView mav = null;
		if (user != null) {
			System.out.println("Old pw entered: " + request.getParameter("oldpw"));
			System.out.println("New pw entered: " + request.getParameter("newpw"));
			System.out.println("Confirm new pw entered: " + request.getParameter("newpwCf"));
			
			Login login = new Login();
			login.setPassword(request.getParameter("oldpw"));
			login.setUsername(user.getUsername());
			
			if(userService.validateUser(login) != null) {
				if (request.getParameter("newpw").equals(request.getParameter("newpwCf"))) {
					System.out.println("Verified :DDDDDD");
					user.setPassword(request.getParameter("newpw"));
					user.setUsertype("patient");
					
					userService.register(user);
					
					mav = new ModelAndView("patientprofile");
				}
				else {
					mav = new ModelAndView("editpassword");
					mav.addObject("message", "Passwords conflicts!!");
			}
			}
		}
		return mav;
	}
}

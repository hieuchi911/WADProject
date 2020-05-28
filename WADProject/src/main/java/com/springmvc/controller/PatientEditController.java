package com.springmvc.controller;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.SessionAttributes;
import org.springframework.web.servlet.ModelAndView;


import com.springmvc.model.User;
import com.springmvc.model.Patient;
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
@SessionAttributes("user")
public class PatientEditController {
	@Autowired
	UserService userService;

	
	@RequestMapping(value = "/editUser", method = RequestMethod.GET)
	public ModelAndView editUser(HttpServletRequest request, HttpServletResponse response,
			@ModelAttribute("user") User user) {
		
		if(request.getParameter("edit-username") != null) {
			ModelAndView mav = new ModelAndView("editpatientprofile");
			Patient patient = new Patient();
			mav.addObject("patient", patient);
			mav.addObject("user", user);
			System.out.println("user session is: " + user.getUsertype());
			return mav;
		}
		if(request.getParameter("edit-password") != null) {
			ModelAndView mav = new ModelAndView("editpassword");
			return mav;
		}
		return null;
	}

	@RequestMapping(value = "/editProfile", method = RequestMethod.POST)
	public ModelAndView editProfile(HttpServletRequest request, HttpServletResponse response,
			@ModelAttribute("patient") Patient patient, @ModelAttribute("user") User user) {
		ModelAndView mav = null;

		if (user != null) {
			System.out.println(user.getUsertype());
			if (user.getUsertype().equals("patient")) {
				mav = new ModelAndView("patientprofile");
				// Get the patient's information
				user = userService.registerPatient(patient);
				
				user = userService.profilePatient(user);

				mav.addObject("user", user);
			} else if (user.getUsertype().equals("doctor")) {
				mav = new ModelAndView("doctorprofile");
				
				// Get the doctor's information
				user = userService.profileDoctor(user);
				mav.addObject("user", user);
			} else {
//				
			}
		} else {
			mav = new ModelAndView("login");
			mav.addObject("message", "Username or Password is wrong!!");
		}

		return mav;
	}
}

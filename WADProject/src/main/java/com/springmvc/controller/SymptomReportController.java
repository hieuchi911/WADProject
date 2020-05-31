package com.springmvc.controller;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.SessionAttribute;
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

public class SymptomReportController {
	@Autowired
	UserService userService;

	
	@RequestMapping(value = "/symptomRp", method = RequestMethod.GET)
	public ModelAndView symptomRp(HttpServletRequest request, HttpServletResponse response,
			@SessionAttribute User user) {
		ModelAndView mav = new ModelAndView("symptomreport");
		Patient patient = userService.profilePatient(user);
		mav.addObject("patient", patient);
		//mav.addObject("user", user);
		return mav;
	}

	@RequestMapping(value = "/addSymptomRp", method = RequestMethod.POST)
	public ModelAndView editProfile(HttpServletRequest request, HttpServletResponse response,
			@ModelAttribute("patient") Patient patient, @SessionAttribute User user) {
		ModelAndView mav = null;
		System.out.println("symptomRp: user session is: " + user.getUsername());

		if (user != null) {
			patient.setUsername(user.getUsername());
			userService.addSymptomReport(patient);
			mav = new ModelAndView("patientprofile");
			mav.addObject("user", user);
			mav.addObject("message", "Added symptom report, please choose a doctor!");
		}

		return mav;
	}
}

package com.springmvc.controller;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
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
	
	@RequestMapping(value = "/editPatient", method = RequestMethod.POST)
	public ModelAndView editPatient(Model model,
			@SessionAttribute User user, @ModelAttribute Patient editUser) {
		
		if(editUser instanceof Patient) {
			editUser.setUsername(user.getUsername());
			userService.updatePatient(editUser);
						
			((Patient) user).setName(editUser.getName());
			((Patient) user).setGender(editUser.getGender());
			((Patient) user).setPhone(editUser.getPhone());
			((Patient) user).setAddress(editUser.getAddress());
			
			ModelAndView mav = new ModelAndView("redirect:/profile");
			return mav;
		}
		
		return null;
	}

	@RequestMapping(value = "/editDescription", method = RequestMethod.POST)
	public ModelAndView editProfile(HttpServletRequest request, HttpServletResponse response,
			@SessionAttribute User user) {
		
		ModelAndView mav = null;
		if (user != null) {
			System.out.println("User name is: " + user.getUsername());
			
			// Allergy data
			String allergy = request.getParameter("allergy");
			if (allergy == null || allergy.length() == 0) 
				allergy = ".";
			
			// Background data
			String background = request.getParameter("background");
			if (background == null || background.length() == 0) 
				background = ".";
			
			// Current diseases data
			String current = request.getParameter("current");
			if (current == null || current.length() == 0) 
				current = ".";
			
			// Encode
			String description = allergy + "||" + background + "||" + current;
			
			userService.updateMedicalData(user.getUsername(), description);
			((Patient) user).setDescription(description);
			
			mav = new ModelAndView("redirect:/profile");
		}
		return mav;
	}
	
	@RequestMapping(value = "/editPassword", method = RequestMethod.POST)
	public ModelAndView editPassword(HttpServletRequest request, HttpServletResponse response, 
			@SessionAttribute User user) {
		
		ModelAndView mav = null;
		if (user != null) {
			System.out.println("Old pw entered: " + request.getParameter("oldpw"));
			System.out.println("New pw entered: " + request.getParameter("newpw"));
			System.out.println("Confirm new pw entered: " + request.getParameter("newpwCf"));
			
			Login login = new Login();
			login.setUsername(user.getUsername());
			login.setPassword(request.getParameter("oldpw"));
			
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

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
import com.springmvc.model.Patient;
import com.springmvc.model.User;
import com.springmvc.service.UserService;

/** 
 * The LoginController class handles login activities of the user,
 * with urls "/login" and "/loginProcess".
 * 
 */
@Controller
public class LoginController {

	@Autowired
	UserService userService;

	/* ---------------------------- showLogin --------------------------------------
	 * This method shows the login screen in url "/login".
	 */
	@RequestMapping(value = "/login", method = RequestMethod.GET)
	public ModelAndView showLogin(HttpServletRequest request, HttpServletResponse response) {
		ModelAndView mav = new ModelAndView("login");
		mav.addObject("login", new Login());

		return mav;
	}

	/* ---------------------------- loginProcess --------------------------------------
	 * This method shows handles login activities (i.e. verification, redirection) with url "/loginProcess".
	 */
	@RequestMapping(value = "/loginProcess", method = RequestMethod.POST)
	public ModelAndView loginProcess(HttpServletRequest request, HttpServletResponse response,
			@ModelAttribute("login") Login login) {
		ModelAndView mav = null;

		User user = userService.validateUser(login);

		if (user != null) {
			System.out.println(user.getUsertype());
			if (user.getUsertype().equals("patient")) {
				mav = new ModelAndView("patientprofile");
				
				Patient patient = userService.profilePatient(user);	// Get the patient's information
				mav.addObject("user", patient);
			} else if (user.getUsertype().equals("doctor")) {
				mav = new ModelAndView("doctorprofile");
				
				Doctor patient = userService.profileDoctor(user);
				mav.addObject("user", patient);
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

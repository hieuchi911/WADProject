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

import com.springmvc.model.Login;
import com.springmvc.model.User;
import com.springmvc.service.UserService;

/** 
 * The LoginController class handles login activities of the user,
 * with urls:
 * | "/login"			This url shows the login screen.		 
 * | "/loginProcess"	This url processes user login.	
 * 
 */
@Controller
@SessionAttributes("user")
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
			@ModelAttribute("login") Login login, @ModelAttribute("user") User user) {
		ModelAndView mav = null;

		user = userService.validateUser(login);

		if (user != null) {
			if (user.getUsertype().equals("patient")) {
				mav = new ModelAndView("patientprofile");
				
				// Get the patient's information
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

	/* ---------------------------- logoutProcess --------------------------------------
	 * This method shows the login screen in url "/logout".
	 */
	@RequestMapping(value = "/logout", method = RequestMethod.GET)
	public String logoutProcess(Model model) {
		model.addAttribute("user", new User());
		return "redirect:/";
	}
	
	@ModelAttribute("user")
	public void addUser(Model model) {
		model.addAttribute(new User());
	}
}

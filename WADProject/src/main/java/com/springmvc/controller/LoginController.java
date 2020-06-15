package com.springmvc.controller;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.SessionAttribute;
import org.springframework.web.bind.annotation.SessionAttributes;
import org.springframework.web.servlet.ModelAndView;

import com.springmvc.model.Appointment;
import com.springmvc.model.Doctor;
import com.springmvc.model.Login;
import com.springmvc.model.Patient;
import com.springmvc.model.User;
import com.springmvc.service.CookieService;
import com.springmvc.service.UserService;

/** 
 * The LoginController class handles login activities of the user
 * with urls:
 * | "/showLogin"		This url shows the login screen.		 
 * | "/loginProcess"	This url processes user login.	
 * | "/homepage"		This url brings user to the homepage.
 * | "/profile"			This url brings user to the profile view.
 * | "/logout" 			This url enables the user to log out.
 * 
 */
@Controller
@SessionAttributes("user")
public class LoginController {

	@Autowired
	UserService userService;

	/* ---------------------------- showLogin --------------------------------------
	 * This method shows the login screen in url "/showLogin".
	 */
	@RequestMapping(value = "/login", method = RequestMethod.GET)
	public ModelAndView showLogin(HttpServletRequest request, HttpServletResponse response) {
		ModelAndView mav;
		
		// Reset session
		HttpSession sess = request.getSession();
		sess.invalidate();
		sess = request.getSession();
		
		Login login = CookieService.getCookie(request, "login");
		if (login == null) {
			mav = new ModelAndView("login");
			mav.addObject("login", new Login());
		} else {
			mav = new ModelAndView("redirect:/loginProcess");
			sess.setAttribute("login", login);
		}

		return mav;
	}
	
	/* ---------------------------- homepage --------------------------------------
	 * This method brings user back to homepage by the url "/homepage".
	 */
	@RequestMapping(value = "/homepage", method = {RequestMethod.POST, RequestMethod.GET})
	public ModelAndView homepage(Model model, HttpServletRequest request, HttpServletResponse response,
				@ModelAttribute User user) {
		
		ModelAndView mav = null;
		
		if(user instanceof Patient){
			mav = new ModelAndView("homepage");
			user = userService.profilePatient(user);
			model.addAttribute("user", user);
		} else {
			if(user instanceof Doctor) {
				mav = new ModelAndView("homepage");
				user = userService.profileDoctor(user);
				model.addAttribute("user", user);
			}
		}
		
		return mav;
	}
	
	/* ---------------------------- loginProcess --------------------------------------
	 * This method shows handles login activities (i.e. verification, redirection) with url "/loginProcess".
	 */
	@RequestMapping(value = "/loginProcess", method = {RequestMethod.POST, RequestMethod.GET})
	public ModelAndView loginProcess(Model model, HttpServletRequest request, HttpServletResponse response,
			@ModelAttribute Login login, @ModelAttribute User user) {
		HttpSession sess = request.getSession();
		
		if (sess.getAttribute("login") != null) {
			login = (Login) sess.getAttribute("login");
			sess.setAttribute("login", null);
		}
		
		ModelAndView mav = null;

		user = userService.validateUser(login);
		
		if (user != null) {
			if (request.getParameter("remember") != null)
				CookieService.addCookie(response, login);
			if(user.getUsertype().equals("patient")){
				mav = new ModelAndView("homepage");
				user = userService.profilePatient(user);
				model.addAttribute("user", user);
			} else {
				if(user.getUsertype().equals("doctor")) {
					mav = new ModelAndView("homepage");
					user = userService.profileDoctor(user);
					model.addAttribute("user", user);
				} else {
					mav = new ModelAndView("manager");
				}
			}
//			mav = new ModelAndView("redirect:/profile");
//			model.addAttribute("user", user);
		} else {
			mav = new ModelAndView("login");
			mav.addObject("message", "Username or Password is wrong!!");
		}
		
		return mav;
	}

	@RequestMapping(value = "/profile", method = RequestMethod.GET)
	public ModelAndView profile(Model model, @SessionAttribute User user) {
		ModelAndView mav = null;
				
		if (user.getUsertype().contentEquals("patient")) {
			mav = new ModelAndView("patientprofile");
			
			// Get the patient's information
			user = userService.profilePatient(user);	
			
			model.addAttribute("user", user);
			mav.addObject("editUser", new Patient());
		} else if (user.getUsertype().contentEquals("doctor")) {
			mav = new ModelAndView("doctorprofile");
			
			// Get the doctor's information
			user = userService.profileDoctor(user);

			model.addAttribute("user", user);
			mav.addObject("editUser", new Doctor());
		}
		
		return mav;
	}
	
	/* ---------------------------- logoutProcess --------------------------------------
	 * This method shows the login screen in url "/logout".
	 */
	@RequestMapping(value = "/logout", method = RequestMethod.GET)
	public String logoutProcess(Model model, HttpServletRequest request, HttpServletResponse response, 
			@SessionAttribute User user) {
		CookieService.removeCookie(response, "login");
		model.addAttribute("user", new User());
		return "redirect:/";
	}
	
	@ModelAttribute("user")
	public void addUser(Model model) {
		model.addAttribute(new User());
	}
}
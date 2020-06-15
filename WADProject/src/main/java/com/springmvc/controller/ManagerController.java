package com.springmvc.controller;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.SessionAttribute;
import org.springframework.web.servlet.ModelAndView;

import com.springmvc.model.Login;
import com.springmvc.model.User;
import com.springmvc.service.CookieService;
import com.springmvc.service.ManagerService;
import com.springmvc.service.UserService;

/** 
 * The LoginController class handles managerial activities of the user
 */

@Controller
public class ManagerController {
	@Autowired
	ManagerService managerService;
	
	/* ---------------------------- addDoctor --------------------------------------
	 * This method adds a doctor to the database
	 */
	@RequestMapping(value = "/manager-doctor", method = RequestMethod.POST)
	public ModelAndView addDoctor(HttpServletRequest request, HttpServletResponse response, 
			@SessionAttribute User user) {
		ModelAndView mav = new ModelAndView("manager");
		
		String[] att = new String[8];
		
		att[0] = request.getParameter("doctor-username");
		att[1] = request.getParameter("doctor-password");
		att[2] = "doctor";
		att[3] = request.getParameter("doctor-name");
		att[4] = request.getParameter("doctor-gender");
		att[5] = request.getParameter("doctor-rank");
		att[6] = request.getParameter("doctor-field");
		att[7] = request.getParameter("doctor-description");
		managerService.addDoctor(att);
		
		return mav;
	}
	
	/* ---------------------------- addMedicine --------------------------------------
	 * This method adds a medicine to the database
	 */
	@RequestMapping(value = "/manager-medicine", method = RequestMethod.POST)
	public ModelAndView addMedicine(HttpServletRequest request, HttpServletResponse response, 
			@SessionAttribute User user) {
		
		ModelAndView mav = new ModelAndView("manager");
		
		String[] att = new String[8];
		
		att[0] = request.getParameter("medicine-name");
		att[1] = request.getParameter("medicine-photo");
		att[2] = request.getParameter("medicine-manufacturer");
		att[3] = request.getParameter("medicine-description");
		att[4] = request.getParameter("medicine-price");
		att[5] = request.getParameter("medicine-instruction");
		att[6] = request.getParameter("medicine-ingredients");
		att[7] = request.getParameter("medicine-sideeffects");
		managerService.addMedicine(att);
		
		return mav;
	}
	
	/* ---------------------------- addTool --------------------------------------
	 * This method adds a medical tool to the database
	 */
	@RequestMapping(value = "/manager-tool", method = RequestMethod.POST)
	public ModelAndView addTool(HttpServletRequest request, HttpServletResponse response, 
			@SessionAttribute User user) {
		ModelAndView mav = new ModelAndView("manager");
		
		String[] att = new String[6];
		
		att[0] = request.getParameter("tool-name");
		att[1] = request.getParameter("tool-photo");
		att[2] = request.getParameter("tool-manufacturer");
		att[3] = request.getParameter("tool-description");
		att[4] = request.getParameter("tool-price");
		att[5] = request.getParameter("tool-usage");
		managerService.addMedicine(att);
		
		return mav;
	}
}

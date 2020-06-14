package com.springmvc.controller;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.servlet.ModelAndView;

import com.springmvc.model.Login;
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
	public ModelAndView addDoctor(HttpServletRequest request, HttpServletResponse response) {
		ModelAndView mav;
		return null;
	}
	
	/* ---------------------------- addMedicine --------------------------------------
	 * This method adds a medicine to the database
	 */
	@RequestMapping(value = "/manager-medicine", method = RequestMethod.POST)
	public ModelAndView addMedicine(HttpServletRequest request, HttpServletResponse response) {
		ModelAndView mav;
		return null;
	}
	
	/* ---------------------------- addTool --------------------------------------
	 * This method adds a medical tool to the database
	 */
	@RequestMapping(value = "/manager-tool", method = RequestMethod.POST)
	public ModelAndView addTool(HttpServletRequest request, HttpServletResponse response) {
		ModelAndView mav;
		return null;
	}
}

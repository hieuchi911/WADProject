package com.springmvc.controller;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.SessionAttribute;
import org.springframework.web.servlet.ModelAndView;


import com.springmvc.model.User;
import com.springmvc.model.Patient;
import com.springmvc.model.Appointment;
import com.springmvc.model.Doctor;
import com.springmvc.model.Login;
import com.springmvc.model.ObjectListContainer;
import com.springmvc.service.AppointmentService;
import com.springmvc.service.UserService;

/** 
 * PatientEditController helps edit a patient's infor fields,
 * with urls:
 * | "/editPatient", "/editDescription", "/editPassword", "/{username}-appointment",
 * | "/showDoctors", "/patient-accepted-requests"
 * 
 */
@Controller

public class PatientController {
	@Autowired
	UserService userService;
	@Autowired
	AppointmentService appointmentService;
	
	/* ---------------------------- editPatient --------------------------------------
	 * This method helps editing patients basic information
	 */
	@RequestMapping(value = "/editPatient", method = RequestMethod.POST)
	public ModelAndView editPatient(Model model,
			@SessionAttribute User user, @ModelAttribute Patient editUser) {
		// User not logged in yet!
		if (user.getUsername() == null)
			return null;
		
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
	
	
	/* ---------------------------- editDescription --------------------------------------
	 * This method helps patients report their symptoms
	 */
	@RequestMapping(value = "/editDescription", method = RequestMethod.POST)
	public ModelAndView editProfile(HttpServletRequest request, HttpServletResponse response,
			@SessionAttribute User user) {
		// User not logged in yet!
		if (user.getUsername() == null)
			return null;
		
		ModelAndView mav = null;
		if (user != null) {
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
	
	/* ---------------------------- editPassword --------------------------------------
	 * This method helps updating patients' password
	 */
	@RequestMapping(value = "/editPassword", method = RequestMethod.POST)
	public ModelAndView editPassword(HttpServletRequest request, HttpServletResponse response, 
			@SessionAttribute User user) {
		// User not logged in yet!
		if (user.getUsername() == null)
			return null;
		
		ModelAndView mav = null;
		if (user != null) {
			Login login = new Login();
			login.setUsername(user.getUsername());
			login.setPassword(request.getParameter("oldpw"));
			
			mav = new ModelAndView("redirect:/profile");
			if(userService.validateUser(login) != null) {
				if (request.getParameter("newpw").equals(request.getParameter("newpwCf"))) {
					user.setPassword(request.getParameter("newpw"));
					user.setUsertype("patient");
					
					userService.changePassword(user);		
					mav.addObject("message", "Success!!");
				}
				else {
					mav.addObject("message", "Passwords conflicts!!");
				}
			} else {
				mav.addObject("message", "Wrong password!!");
			}
		}
		return mav;
	}
	
	/* ---------------------------- {username}-appointment --------------------------------------
	 * This method creates an appointment request with the patient's name
	 * and the doctor in demand. It also updates appointment table in database
	 * with "None"-from_to records
	 */
	@RequestMapping(value = "/{username}-appointment", method = RequestMethod.GET)
	public ModelAndView makeAppointment(HttpServletRequest request, HttpServletResponse response,
			@SessionAttribute User user, @PathVariable String username) {
		// User not logged in yet!
		if (user.getUsername() == null)
			return null;
		
		ModelAndView mav = null;
		if (user != null) {
			if(user instanceof Patient) {
				
				// create a temporary doctor user whose name is path variable name above to put in profileDoctor method
				User doctor = new User();
				doctor.setUsername(username);
				String description = ((Patient) user).getDescription().getAllergy() + "||"
							+ ((Patient) user).getDescription().getBackground() + "||"
							+((Patient) user).getDescription().getCurrent();
				
				doctor = userService.profileDoctor(doctor);
				
				Appointment appointment = new Appointment();
				appointment.setDoctor(doctor.getUsername());
				appointment.setPatient(user.getUsername());
				appointment.setIllness_description(description);
				
				appointmentService.makeAppointment(appointment);
				
				mav = new ModelAndView("redirect:/profile");
				mav.addObject("appointment", appointment);
				
				mav.addObject("message_request", "Request submitted, please wait for approvement from the doctor");
			}
		}

		return mav;
	}
	
	/* ---------------------------- showDoctors --------------------------------------
	 * This method returns the doctor catalog
	 */
	@RequestMapping(value = "/showDoctors", method = RequestMethod.GET)
	public ModelAndView showDoctors(HttpServletRequest request, HttpServletResponse response, 
			@SessionAttribute User user) {
		// User not logged in yet!
		if (user.getUsername() == null)
			return null;
		
		ModelAndView mav = new ModelAndView("doctors");
		
		ObjectListContainer<Doctor> doctors = new ObjectListContainer<Doctor>();
		doctors.setObjects(userService.getAllDoctors());

		mav.addObject("doctors", doctors);
		return mav;
	}
	
	
	/* ---------------------------- showAppointments --------------------------------------
	 * This method shows the user's appointments.
	 */
	@RequestMapping(value = "/patient-accepted-requests", method = RequestMethod.GET)
	public ModelAndView showAppointments(HttpServletRequest request, HttpServletResponse response,
			@SessionAttribute User user) {		
		// User not logged in yet!
		if (user.getUsername() == null)
			return null;
		
		ModelAndView mav = new ModelAndView("accepteddoctorappointment");

		ObjectListContainer<Appointment> apps = new ObjectListContainer<Appointment>();
		apps.setObjects(appointmentService.getAllAppointmentForPatient((Patient) user));
		mav.addObject("appointments", apps);
		return mav;
	}
}

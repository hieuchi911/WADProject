package com.springmvc.controller;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
//import org.springframework.web.bind.annotation.SessionAttributes;
import org.springframework.web.bind.annotation.SessionAttribute;
import org.springframework.web.servlet.ModelAndView;


import com.springmvc.model.User;
import com.springmvc.model.Patient;
import com.springmvc.model.Appointment;
import com.springmvc.model.Doctor;
import com.springmvc.model.DoctorListContainer;
import com.springmvc.model.Login;
import com.springmvc.model.ObjectListContainer;
import com.springmvc.service.AppointmentService;
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
	@Autowired
	AppointmentService appointmentService;
	
	@RequestMapping(value = "/editUser", method = RequestMethod.GET)
	public ModelAndView editUser(HttpServletRequest request, HttpServletResponse response,
			@SessionAttribute User user) {
		if(request.getParameter("edit-profile") != null) {
			System.out.println("user session is: " + user.getUsername());
			ModelAndView mav = new ModelAndView("editpatientprofile");
			Patient patient = new Patient();
			mav.addObject("patient", patient);	// this is for the form in the view that uses modelAttribute = "patient"
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
				System.out.println("editProfile: user class is: " + user.getClass());
				user = userService.registerPatient(patient);
				
				mav = new ModelAndView("patientprofile");

				mav.addObject("user", user);
			}
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
			}
			else {
				mav = new ModelAndView("editpassword");
				mav.addObject("message", "Passwords conflicts!!");
		}
		}
		return mav;
	}
	
	@RequestMapping(value = "/symptomRp", method = RequestMethod.GET)
	public ModelAndView symptomRp(HttpServletRequest request, HttpServletResponse response,
			@SessionAttribute User user) {
		
		ModelAndView mav = new ModelAndView("symptomreport");
		Patient patient = userService.profilePatient(user);
		mav.addObject("patient", patient);
		return mav;
	}

	@RequestMapping(value = "/addSymptomRp", method = RequestMethod.POST)
	public ModelAndView addSymptomReport(HttpServletRequest request, HttpServletResponse response,
			@ModelAttribute("patient") Patient patient, @SessionAttribute User user) {
		ModelAndView mav = null;
		if (user != null) {
			if(user instanceof Patient) {
				// update medical description on database
				patient.setUsername(user.getUsername());
				userService.addSymptomReport(patient);
				mav = new ModelAndView("patientprofile");
				
				/* set user (now of class Patient)'s description to the specified of
				 * patient model attribute from the previous form */
				((Patient) user).setDescription(patient.getDescription());
				
				mav.addObject("message", "Added symptom report, please choose a doctor!");
			}
		}

		return mav;
	}
	
	@RequestMapping(value = "/{username}-appointment", method = RequestMethod.GET)
	public ModelAndView makeAppointment(HttpServletRequest request, HttpServletResponse response,
			@SessionAttribute User user, @PathVariable String username) {
		ModelAndView mav = null;
		if (user != null) {
			if(user instanceof Patient) {
				
				// create a temporary doctor user whose name is path variable name above to put in profileDoctor method
				User doctor = new User();
				doctor.setUsername(username);
				String description = ((Patient) user).getDescription();
				
				doctor = userService.profileDoctor(doctor);
				
				Appointment appointment = new Appointment();
				appointment.setDoctor(doctor.getUsername());
				appointment.setPatient(user.getUsername());
				appointment.setIllness_description(description); // Need to add symptom report here
				
				appointmentService.makeAppointment(appointment);
				
				mav = new ModelAndView("patientprofile");
				mav.addObject("appointment", appointment);
				
				mav.addObject("message_request", "Request submitted, please wait for approvement from the doctor");
			}
		}

		return mav;
	}
	
	@RequestMapping(value = "/showDoctors", method = RequestMethod.GET)
	public ModelAndView showDoctors(HttpServletRequest request, HttpServletResponse response, @SessionAttribute User user) {
		ModelAndView mav = new ModelAndView("doctors");

		ObjectListContainer<Doctor> doctors = new ObjectListContainer<Doctor>();
		doctors.setObjects(userService.getAllDoctors());
		for(Doctor d: doctors.getObjects())
			System.out.println(d.getUsername());
		
		ObjectListContainer<Appointment> appointmentList = new ObjectListContainer<Appointment>();
		appointmentList.setObjects(appointmentService.getAllAppointmentForPatient((Patient) user));

		mav.addObject("appointments", appointmentList);
		
		for(Appointment a: appointmentList.getObjects()) {
			mav.addObject("appointment-" + a.getDoctor(), a);	// this is to check if appointment is accepted yet
			for(Doctor d: doctors.getObjects()){
				if(a.getDoctor().equals(d.getUsername()))
					mav.addObject("haveappointment-" + a.getDoctor(), 1); // this is to check if appointment is made with the doctor
			}
		}
		
		mav.addObject("doctors", doctors);
		return mav;
	}
}

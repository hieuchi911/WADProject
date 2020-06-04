package com.springmvc.controller;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.SessionAttribute;
import org.springframework.web.servlet.ModelAndView;


import com.springmvc.model.User;
import com.springmvc.model.Patient;
import com.springmvc.model.Prescription;
import com.springmvc.model.Appointment;
import com.springmvc.model.Doctor;
import com.springmvc.model.ObjectListContainer;
import com.springmvc.service.AppointmentService;
import com.springmvc.service.UserService;

@Controller

public class DoctorController {
	@Autowired
	UserService userService;
	
	@Autowired
	AppointmentService appointmentService;
	
	/* ---------------------------- showPatientRecords --------------------------------------
	 * This method shows the patients that the doctor worked with in the past
	 */
	@RequestMapping(value = "/showPatientRecords", method = RequestMethod.GET)
	public ModelAndView showRecords(HttpServletRequest request, HttpServletResponse response, @SessionAttribute User user) {
		ModelAndView mav = null;
		
		ObjectListContainer<Prescription> prescriptionList = new ObjectListContainer<Prescription>();
		
		prescriptionList.setObjects(appointmentService.getAllPrescription((Doctor) user));
		
		mav = new ModelAndView("patientrecords");
		mav.addObject("patientsRecords", prescriptionList);
		
		return mav;
	}
	
	/* ---------------------------- appointments --------------------------------------
	 * This method shows the appointment requests from patients
	 */
	@RequestMapping(value = "/appointments", method = RequestMethod.GET)
	public ModelAndView appointments(HttpServletRequest request, HttpServletResponse response, @SessionAttribute User user) {
		ModelAndView mav = null;
		ObjectListContainer<Appointment> appointmentList = new ObjectListContainer<Appointment>();

		appointmentList.setObjects(appointmentService.getAllAppointment((Doctor) user));
		mav = new ModelAndView("appointments");
		mav.addObject("appointments", appointmentList);
		
		
		return mav;
	}
	
	/* ---------------------------- acceptRequest/{patient} --------------------------------------
	 * This method update the pre-made appointment in the database (done by 
	 * makeAppointment/{username} controller) with the computed from_to
	 */
	@RequestMapping(value = "/acceptRequest/{patient}", method = RequestMethod.GET)
	public ModelAndView acceptRequest(HttpServletRequest request, HttpServletResponse response,
			@SessionAttribute User user, @PathVariable String patient) {
		ModelAndView mav = null;

		if(user instanceof Doctor) {
			Appointment appointment = new Appointment();
			appointment = appointmentService.computeTime(user.getUsername(), patient);
			mav = new ModelAndView("appointments");
			mav.addObject("message_accept", "Patient accepted");
			mav.addObject("appointment", appointment);
		}
		return mav;
	}
	
	
	@RequestMapping(value = "/rejectRequest/{patient}", method = RequestMethod.GET)
	public ModelAndView rejectRequest(HttpServletRequest request, HttpServletResponse response,
			@SessionAttribute User user, @PathVariable String patient) {
		ModelAndView mav = null;

		if(user instanceof Doctor) {
			Appointment appointment = new Appointment();
			appointment.setDoctor(user.getUsername());
			appointment.setPatient(patient);
			
			appointmentService.rejectAppointment(appointment);
		}
		mav = new ModelAndView("appointments");
		mav.addObject("message_reject", "Patient rejected");
		
		
		return mav;
	}
	

}

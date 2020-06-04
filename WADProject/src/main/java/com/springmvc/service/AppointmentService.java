package com.springmvc.service;

import com.springmvc.model.Doctor;
import com.springmvc.model.Appointment;
import com.springmvc.model.Patient;
import com.springmvc.model.Prescription;
import com.springmvc.model.User;
import com.springmvc.model.ObjectListContainer;
import java.util.List;
public interface AppointmentService {
	
	/*
	 * This function adds a specific patient via Data Access Object
	 * @param patient:	(Patient) A patient for registration
	 * @return 			(Patient) A registered patient
	 */
	Appointment makeAppointment(Appointment appointment);

	/*
	 * This function validates a login via Data Access Object
	 * @param login:	(Login) A login attempt
	 * @return 			(User) A valid user / null
	 */
	void rejectAppointment(Appointment appointment);
	
	/*
	 * This function provides the profile of a patient user via Data Access Object
	 * @param user:		(User) A valid user
	 * @return 			(Patient) The patient
	 */
	
	Appointment computeTime(String doctor, Patient patient);


	
	List<Appointment> getAllAppointment(Doctor doctor);
	
	List<Prescription> getAllPrescription(Doctor doctor);
}

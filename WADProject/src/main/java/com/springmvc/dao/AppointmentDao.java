package com.springmvc.dao;

import java.util.List;

import com.springmvc.model.Appointment;
import com.springmvc.model.Doctor;
import com.springmvc.model.ObjectListContainer;
import com.springmvc.model.Patient;
import com.springmvc.model.Prescription;

public interface AppointmentDao {


	Appointment makeAppointment(Appointment appointment);

	
	void rejectAppointment(Appointment appointment);
	
	
	Appointment computeTime(String doctor, Patient patient);


	
	List<Appointment> getAllAppointment(Doctor doctor);
	
	List<Prescription> getAllPrescription(Doctor doctor);

}

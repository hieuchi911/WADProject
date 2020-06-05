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
	
	
	Appointment setAppointment(String doctor, Patient patient, int appointment_hour, int appointment_shift);

	List<String> getFromTo(String doctor);
	
	List<Appointment> getAllAppointment(Doctor doctor);
	
	List<Appointment> getAllAppointmentForPatient(Patient patient);
	
	List<Prescription> getAllPrescription(Doctor doctor);

}

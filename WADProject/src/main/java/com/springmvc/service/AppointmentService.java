package com.springmvc.service;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;

import com.springmvc.dao.AppointmentDao;
import com.springmvc.model.Appointment;
import com.springmvc.model.Doctor;
import com.springmvc.model.ObjectListContainer;
import com.springmvc.model.Patient;
import com.springmvc.model.Prescription;

public class AppointmentService {
	
	@Autowired
	AppointmentDao appointmentDao;

	public Appointment makeAppointment(Appointment appointment) {
		appointmentDao.makeAppointment(appointment);
		return null;
	}

	public void rejectAppointment(Appointment appointment) {
		appointmentDao.rejectAppointment(appointment);
	}

	
	public Appointment computeTime(String doctor, Patient patient) {
		appointmentDao.computeTime(doctor, patient);
		return null;
	}

	
	public List<Appointment> getAllAppointment(Doctor doctor) {
		return appointmentDao.getAllAppointment(doctor);
	}
	
	
	public List<Appointment> getAllAppointmentForPatient(Patient patient) {
		return appointmentDao.getAllAppointmentForPatient(patient);
	}

	
	public List<Prescription> getAllPrescription(Doctor doctor){
		return appointmentDao.getAllPrescription(doctor); 
	}
}

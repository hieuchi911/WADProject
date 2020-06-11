package com.springmvc.service;

import java.time.LocalDateTime;
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
		List<String> from_to = appointmentDao.getFromTo(doctor);
		// Not consider existing appointments, this is just plain computation for a proper from_to
		int appointment_hour = 0;
		int appointment_shift = 0;
		int hour = LocalDateTime.now().getHour();
		int minute = LocalDateTime.now().getMinute();
		if(hour < 7 || hour > 17) {		// if making appointment at non-working time, then set appointment time as the first shift in a day
			appointment_hour = 7;
			appointment_shift = 1;
		} else {
			if(minute > 40) {
				appointment_hour = hour + 1;
				appointment_shift = 1;
			} else {
				if(minute < 20) {
					appointment_hour = hour;
					appointment_shift = 2;
				} else {
					appointment_hour = hour;
					appointment_shift = 3;
				}
			}
		}
		
		
		// Handle existing appointments
		int[][] shifts = new int[11][3]; // 11 working hours a day (index i --> i + 7 o'clock), 3 shifts per hour (a one-hot vector)
		
		if(from_to != null) {
			for(String f_t: from_to) {
				if(!f_t.equals("none")) {
					String[] splitstring = f_t.split("_");	// 16_1
					if(Integer.parseInt(splitstring[1]) == 1) {	// if the shift is 1, then the first element of array is 1
						shifts[Integer.parseInt(splitstring[0]) - 7][0] = 1;
					}
					
					if(Integer.parseInt(splitstring[1]) == 2) {		// if the shift is 2, then the second element of array is 1
						shifts[Integer.parseInt(splitstring[0]) - 7][1] = 1;
					}
					
					if(Integer.parseInt(splitstring[1]) == 3) {		// if the shift is 3, then the third element of array is 1
						shifts[Integer.parseInt(splitstring[0]) - 7][2] = 1;
					}
				}
			}
			
			// Find for empty slots after appointment_hour to choose shift
			int count_hour = 0;
			int count_shift = 1;
			int shift_index = 0;
			int hour_index = 0;
			boolean flag = false;
			for(int[] shift: shifts) {
				if(count_hour + 7 < appointment_hour) {
					hour_index++;
					count_hour++;
					continue;
				}
				else {
					shift_index = 0;
					for(int s : shift) {
						if(count_shift < appointment_shift) {
							shift_index++;
							count_shift++;
							continue;
						}
						else {
							if(s == 1) {
								shift_index++;
								continue;
							}
							if(s == 0) {
								appointment_shift = shift_index + 1;
								appointment_hour = hour_index + 7;
								flag = true;
								break;
							}
						}
					}
				}
				if(flag)
					break;
				hour_index++;
				count_shift = 1;
				appointment_shift = 1;
				shift_index = 0;
			}
		}
		appointmentDao.setAppointment(doctor, patient, appointment_hour, appointment_shift);
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

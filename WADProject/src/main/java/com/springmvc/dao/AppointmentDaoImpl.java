package com.springmvc.dao;

import java.time.LocalDateTime;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.List;
import java.util.stream.IntStream;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.jdbc.core.JdbcTemplate;
import org.springframework.jdbc.core.RowMapper;

import com.springmvc.model.Appointment;
import com.springmvc.model.Doctor;
import com.springmvc.model.ObjectListContainer;
import com.springmvc.model.Patient;
import com.springmvc.model.Prescription;
import com.springmvc.model.ShopObject;

public class AppointmentDaoImpl implements AppointmentDao{
	
	@Autowired
	JdbcTemplate jdbcTemplate;

	@Override
	public Appointment makeAppointment(Appointment appointment) { // Need symptom report here, not yet handled
		String sql = "INSERT INTO appointment (from_to, doctor_username, patient_username, illness_description)"
				+ "VALUES (1, ?, ?, ?);";
		jdbcTemplate.update(sql, new Object[] { appointment.getDoctor(), appointment.getPatient(), appointment.getIllness_description()});
		
		
		return appointment;
	}

	@Override
	public void rejectAppointment(Appointment appointment) {
		String sql = "DELETE FROM appointment "
				+ "WHERE doctor_username = '" + appointment.getDoctor()+ "' "
				+ "AND patient_username = '" + appointment.getPatient() + "';";
		jdbcTemplate.update(sql);
	}

	@Override
	public Appointment computeTime(String doctor, Patient patient) {
		
		String sql = "SELECT from_to FROM appointment WHERE doctor_username = '" + doctor + "';";
		List<String> from_to = jdbcTemplate.query(sql, new FromToMapper());
		
		//.... handle String split here
		int[][] shifts = new int[20][2];
		int i = 0;
		int[] hour_list = new int[20];
		int[] shift_list = new int[20];
		for(String f_t: from_to) {
			String[] splitstring = f_t.split("_");	// 2020_12_1_16_1
			//shifts[i][0] = Integer.parseInt(splitstring[3]);
			hour_list[i] = Integer.parseInt(splitstring[3]);
			//shifts[i][1] = Integer.parseInt(splitstring[4]);
			shift_list[i] = Integer.parseInt(splitstring[4]);
			
			i++;
		}

		int appointment_hour = 0;
		int appointment_shift = 0;
		int hour = LocalDateTime.now().getHour();
		int minute = LocalDateTime.now().getMinute();
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
		
//		if(! IntStream.of(hour_list).anyMatch(x -> x == hour)) {
//			if(!IntStream.of(shift_list).anyMatch(x -> x == appointment_shift)) {
//				
//			}
//		}
		
		for(int[] shift: shifts) {
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
		String f_t = appointment_hour + "_" + appointment_shift;
		
		
		sql = "UPDATE appointment "
				+ "SET from_to = '" + from_to + "' "	// (doctor username, patient username, symptom report??, from_to)
				+ "WHERE doctor_username = '" + doctor + "' AND patient_username = '" + patient + "';";
		Appointment appointment = new Appointment();
		appointment.setDoctor(doctor);
		appointment.setPatient(patient.getUsername());
		appointment.setFrom_to(f_t); // this needs handling
		appointment.setIllness_description(patient.getDescription()); // can retrieve by modifying String sql above to select from_to and illness_descr
		return appointment;
	}

	@Override
	public List<Appointment> getAllAppointment(Doctor doctor) {
		String sql = "SELECT * FROM appointment \n"
				+ "WHERE doctor_username = '" + doctor.getUsername() + "';";
		List<Appointment> appointments = jdbcTemplate.query(sql, new AppointmentMapper());
		
		return appointments;
	}
	
	@Override
	public List<Prescription> getAllPrescription(Doctor doctor) {
		String sql = "SELECT * FROM prescription \n"
				+ "WHERE doctor_username = '" + doctor.getUsername() + "';";
		List<Prescription> prescriptions = jdbcTemplate.query(sql, new PrescriptionMapper());
		
		return prescriptions;
	}
	
	
	
}

class FromToMapper implements RowMapper<String> {
	public String mapRow(ResultSet rs, int arg1) throws SQLException {
		String from_to = rs.getString("from_to");

		return from_to;
	}
}


class AppointmentMapper implements RowMapper<Appointment> {
	public Appointment mapRow(ResultSet rs, int arg1) throws SQLException {
		Appointment appointment = new Appointment();

		appointment.setDoctor(rs.getString("doctor_username"));
		appointment.setPatient(rs.getString("patient_username"));
		appointment.setFrom_to(rs.getString("from_to"));
		appointment.setIllness_description(rs.getString("illness_description"));

		return appointment;
	}
}


class PrescriptionMapper implements RowMapper<Prescription> {
	public Prescription mapRow(ResultSet rs, int arg1) throws SQLException {
		Prescription prescription = new Prescription();

		prescription.setDoctor(rs.getString("doctor_username"));
		prescription.setPatient(rs.getString("patient_username"));
		prescription.setFrom_to(rs.getString("from_to"));
		prescription.setDiagnosis(rs.getString("diagnosis"));

		return prescription;
	}
}



package com.springmvc.dao;

import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.List;

import javax.sql.DataSource;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.jdbc.core.JdbcTemplate;
import org.springframework.jdbc.core.RowMapper;

import com.springmvc.model.Appointment;
import com.springmvc.model.Doctor;
import com.springmvc.model.Patient;
import com.springmvc.model.Prescription;

public class AppointmentDao {
	// The followings are necessary to establish database connection
	@Autowired
	DataSource datasource;
	@Autowired
	JdbcTemplate jdbcTemplate;

	
	public Appointment makeAppointment(Appointment appointment) { // Need symptom report here, not yet handled
		String sql = "INSERT INTO appointment (doctor_username, patient_username, illness_description, from_to)"
				+ 																			"VALUES (?, ?, ?, ?);";
		jdbcTemplate.update(sql, new Object[] { appointment.getDoctor(), appointment.getPatient(), appointment.getIllness_description(), "none"});
		
		return appointment;
	}

	
	public void rejectAppointment(Appointment appointment) {
		String sql = "DELETE FROM appointment "
				+ "WHERE doctor_username = '" + appointment.getDoctor()+ "' "
				+ "AND patient_username = '" + appointment.getPatient() + "';";
		jdbcTemplate.update(sql);
	}
	
	public List<String> getFromTo(String doctor){
		String sql = "SELECT from_to FROM appointment WHERE doctor_username = '" + doctor + "';";
		List<String> from_to = jdbcTemplate.query(sql, new FromToMapper());
		return from_to;
	}
	public Appointment setAppointment(String doctor, Patient patient, String appointment_shift) {
		String f_t = appointment_shift;
		System.out.println("f_t is: " + f_t);
		
		String sql_update = "UPDATE appointment \n"
				+ "SET from_to = '" + f_t+ "' \n"
				+ "WHERE doctor_username = '" + doctor + "' AND patient_username = '" + patient.getUsername() + "';";
		jdbcTemplate.update(sql_update);
		Appointment appointment = new Appointment();
		appointment.setDoctor(doctor);
		appointment.setPatient(patient.getUsername());
		appointment.setFrom_to(f_t);
		
		appointment.setIllness_description(patient.getDescription().toString());
		
		return appointment;
	}

	
	public List<Appointment> getAllAppointment(Doctor doctor) {
		String sql = "SELECT * FROM appointment \n"
				+ "WHERE doctor_username = '" + doctor.getUsername() + "';";
		List<Appointment> appointments = jdbcTemplate.query(sql, new AppointmentMapper());
		
		return appointments;
	}
	
	
	public List<Appointment> getAllAppointmentForPatient(Patient patient) {
		String sql = "SELECT * FROM appointment \n"
				+ 	"WHERE patient_username = '" + patient.getUsername() + "';";
		List<Appointment> appointments = jdbcTemplate.query(sql, new AppointmentMapper());
		
		return appointments;
	}
	
	
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


package com.springmvc.dao;

import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.List;

import javax.sql.DataSource;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.jdbc.core.JdbcTemplate;
import org.springframework.jdbc.core.RowMapper;

import com.springmvc.model.Doctor;
import com.springmvc.model.Login;
import com.springmvc.model.Patient;
import com.springmvc.model.User;

import com.springmvc.service.Cryptography;
/**
 * This class provides an implementation of the Data Access Object
 * It gets user data from the database
 */
public class UserDao {
	// The followings are necessary to establish database connection
	@Autowired
	DataSource datasource;
	@Autowired
	JdbcTemplate jdbcTemplate;

	public int register(User user) {
		// Checking existence
		String sql = "SELECT * FROM user WHERE username ='" + user.getUsername() + "';";
		List<User> users = jdbcTemplate.query(sql, new UserMapper());
		if (users.size() > 0) {
			return 0;
		}
		
		// Add new user
		sql = "INSERT INTO user VALUES(?,?,?);";
		return jdbcTemplate.update(sql, new Object[] { user.getUsername(), user.getPassword(), user.getUsertype() });
	}

	public Patient registerPatient(Patient patient) {
		String sql = "INSERT INTO patient VALUES(?,?,?,?,?,?);";
	
		jdbcTemplate.update(sql, new Object[] { patient.getUsername(), patient.getName(), patient.getGender(),
				patient.getPhone(), patient.getAddress(), patient.getDescription().toString()});

		return patient;
	}	
	
	public void updateMedicalData(String username, String description) {
		String sql = "UPDATE patient SET medical_description='" + description + "' "
				+ 	"WHERE patient_username='" + username + "';";
		jdbcTemplate.update(sql);	
	}

	
	public User validateUser(Login login) {
		String sql = "SELECT * FROM user WHERE username ='" + login.getUsername() + "' AND password='"
				+ 											  login.getPassword() + "';";
		List<User> users = jdbcTemplate.query(sql, new UserMapper());

		return users.size() > 0 ? users.get(0) : null;
	}

	public Patient profilePatient(User user) {
		String sql = "SELECT * FROM patient WHERE patient_username ='" + user.getUsername() + "';";
		List<Patient> patients = jdbcTemplate.query(sql, new PatientMapper());
		
		Patient patient = null;
		if (patients.size() > 0) {
			patient = patients.get(0);
			patient.setUsertype("patient");
		}
		return patient;
	}
	
	public Doctor profileDoctor(User user) {
		String sql = "SELECT * FROM doctor WHERE doctor_username ='" + user.getUsername() + "';";
		List<Doctor> doctors = jdbcTemplate.query(sql, new DoctorMapper());

		Doctor doctor = null;
		if (doctors.size() > 0) {
			doctor = doctors.get(0);
			doctor.setUsertype("doctor");
		}
		return doctor;	
	}
	
	public List<Doctor> getAllDoctors() {
		String sql = "SELECT * FROM doctor;";
		List<Doctor> doctors = jdbcTemplate.query(sql, new DoctorMapper());
		
		return doctors;
	}
	
	
	public void updatePatient(Patient editUser) {
		String sql = "UPDATE patient SET name='" + editUser.getName() + "',"
				+ 						"gender='" + editUser.getGender() + "',"
				+ 						"phone_number='" + editUser.getPhone() + "',"
				+						"home_address='" + editUser.getAddress() + "' "
				+ 	"WHERE patient_username='" + editUser.getUsername() + "';";
		jdbcTemplate.update(sql);
	}

	public void changePassword(User user) {
		String sql = "UPDATE user SET password='" + user.getPassword() + "' "
					+ "WHERE username='" + user.getUsername() + "';";
		jdbcTemplate.update(sql);		
	}

}

class UserMapper implements RowMapper<User> {
	public User mapRow(ResultSet rs, int arg1) throws SQLException {
		User user = new User();

		user.setUsername(rs.getString("username"));
		user.setPassword(rs.getString("password"));
		user.setUsertype(rs.getString("user_type"));
		
		return user;
	}
}

class PatientMapper implements RowMapper<Patient> {
	public Patient mapRow(ResultSet rs, int arg1) throws SQLException {
		Patient patient = new Patient();

		patient.setUsername(rs.getString("patient_username"));
		patient.setName(rs.getString("name"));
		patient.setGender(rs.getString("gender"));
		patient.setPhone(rs.getString("phone_number"));
		patient.setAddress(rs.getString("home_address"));
		patient.setDescription(rs.getString("medical_description"));

		return patient;
	}
}

class DoctorMapper implements RowMapper<Doctor> {
	public Doctor mapRow(ResultSet rs, int arg1) throws SQLException {
		Doctor doctor = new Doctor();

		doctor.setUsername(rs.getString("doctor_username"));
		doctor.setName(rs.getString("name"));
		doctor.setUrl(rs.getString("photo_url"));
		doctor.setGender(rs.getString("gender"));
		doctor.setRank(rs.getString("academic_rank"));
		doctor.setField(rs.getString("specialized_field"));
		doctor.setDescription(rs.getString("bio_description"));

		return doctor;
	}
}
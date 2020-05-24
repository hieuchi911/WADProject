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

/**
 * This class provides an implementation of the Data Access Object
 * It gets user data from the database
 */
public class UserDaoImpl implements UserDao {

	@Autowired
	DataSource datasource;

	@Autowired
	JdbcTemplate jdbcTemplate;

	public int register(User user) {
		String sql = "INSERT INTO users VALUES(?,?,?)";

		return jdbcTemplate.update(sql, new Object[] { user.getUsername(), user.getPassword(), user.getUsertype() });
	}

	public Patient registerPatient(User user) {
		String sql = "INSERT INTO patients VALUES(?,?,?,?,?,?)";
		jdbcTemplate.update(sql, new Object[] { user.getUsername(), "", "", "", "", "" });
											// username, name, sex, phone, address, medical description
		Patient patient = new Patient();
		patient.setUsername(user.getUsername());
		return patient;
	}
	
	public User validateUser(Login login) {
		String sql = "SELECT * FROM users WHERE username ='" + login.getUsername() + "' AND password='"
				+ login.getPassword() + "'";
		List<User> users = jdbcTemplate.query(sql, new UserMapper());

		return users.size() > 0 ? users.get(0) : null;
	}

	public Patient profilePatient(User user) {
		String sql = "SELECT * FROM patients WHERE username ='" + user.getUsername() + "'";
		List<Patient> patients = jdbcTemplate.query(sql, new PatientMapper());

		return patients.size() > 0 ? patients.get(0) : null;
	}
	
	public Doctor profileDoctor(User user) {
		String sql = "SELECT * FROM doctors WHERE username ='" + user.getUsername() + "'";
		List<Doctor> doctors = jdbcTemplate.query(sql, new DoctorMapper());

		return doctors.size() > 0 ? doctors.get(0) : null;	}
}

class UserMapper implements RowMapper<User> {
	public User mapRow(ResultSet rs, int arg1) throws SQLException {
		User user = new User();

		user.setUsername(rs.getString("username"));
		user.setPassword(rs.getString("password"));
		user.setUsertype(rs.getString("usertype"));
		return user;
	}
}

class PatientMapper implements RowMapper<Patient> {
	public Patient mapRow(ResultSet rs, int arg1) throws SQLException {
		Patient patient = new Patient();

		patient.setUsername(rs.getString("username"));
		patient.setName(rs.getString("name"));
		patient.setGender(rs.getString("gender"));
		patient.setPhone(rs.getString("phone"));
		patient.setAddress(rs.getString("address"));
		patient.setDescription(rs.getString("description"));

		return patient;
	}
}

class DoctorMapper implements RowMapper<Doctor> {
	public Doctor mapRow(ResultSet rs, int arg1) throws SQLException {
		Doctor doctor = new Doctor();

		doctor.setUsername(rs.getString("username"));
		doctor.setName(rs.getString("name"));
		doctor.setGender(rs.getString("gender"));
		doctor.setRank(rs.getString("rank"));
		doctor.setField(rs.getString("field"));
		doctor.setDescription(rs.getString("description"));

		return doctor;
	}
}
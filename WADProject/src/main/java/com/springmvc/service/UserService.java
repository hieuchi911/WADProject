package com.springmvc.service;

import org.springframework.beans.factory.annotation.Autowired;

import com.springmvc.dao.UserDao;
import com.springmvc.model.Doctor;
import com.springmvc.model.Login;
import com.springmvc.model.Patient;
import com.springmvc.model.User;
import java.util.List;

import javax.servlet.http.Cookie;
import javax.servlet.http.HttpServletResponse;

/**
 * This class provides implementations of User Services
 */
public class UserService {

	@Autowired
	public UserDao userDao;

	public int register(User user) {
		return userDao.register(user);
	}

	public User validateUser(Login login) {
		return userDao.validateUser(login);
	}

	public Patient registerPatient(Patient patient) {
		return userDao.registerPatient(patient);
	}
	
	public void updateMedicalData(String username, String description) {
		userDao.updateMedicalData(username, description);
	}

	
	public Patient profilePatient(User user) {
		return userDao.profilePatient(user);
	}

	public Doctor profileDoctor(User user) {
		return userDao.profileDoctor(user);
	}
	
	public List<Doctor> getAllDoctors(){
		return userDao.getAllDoctors();
	}
	
	public void updatePatient(Patient editUser) {
		userDao.updatePatient(editUser);
	}
}

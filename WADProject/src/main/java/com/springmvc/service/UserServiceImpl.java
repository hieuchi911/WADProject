package com.springmvc.service;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;

import com.springmvc.dao.UserDao;
import com.springmvc.model.Doctor;
import com.springmvc.model.Login;
import com.springmvc.model.Patient;
import com.springmvc.model.ShopObject;
import com.springmvc.model.User;

/**
 * This class provides an implementation of User Services
 */
public class UserServiceImpl implements UserService {

	@Autowired
	public UserDao userDao;

	public int register(User user) {
		return userDao.register(user);
	}

	public User validateUser(Login login) {
		return userDao.validateUser(login);
	}

	public Patient registerPatient(User user) {
		return userDao.registerPatient(user);
	}
	public Patient profilePatient(User user) {
		return userDao.profilePatient(user);
	}

	public Doctor profileDoctor(User user) {
		return userDao.profileDoctor(user);
	}
	
	public List <ShopObject> getAllShopObjects() {
		return userDao.getAllShopObjects();
	}

}

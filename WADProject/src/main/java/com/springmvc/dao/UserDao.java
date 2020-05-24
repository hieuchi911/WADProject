package com.springmvc.dao;

import com.springmvc.model.Login;
import com.springmvc.model.Patient;
import com.springmvc.model.User;

public interface UserDao {

	int register(User user);
	Patient registerPatient(User user);
	
	User validateUser(Login login);
	Patient profilePatient(User user);
}

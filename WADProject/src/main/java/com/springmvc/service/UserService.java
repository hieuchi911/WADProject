package com.springmvc.service;

import com.springmvc.model.Doctor;
import com.springmvc.model.Login;
import com.springmvc.model.Patient;
import com.springmvc.model.User;

public interface UserService {

	int register(User user);
	Patient registerPatient(User user);

	User validateUser(Login login);
	Patient profilePatient(User user);
	Doctor profileDoctor(User user);
}

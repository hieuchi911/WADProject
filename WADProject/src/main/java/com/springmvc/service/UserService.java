package com.springmvc.service;

import java.util.List;

import com.springmvc.model.Doctor;
import com.springmvc.model.Login;
import com.springmvc.model.Patient;
import com.springmvc.model.ShopObject;
import com.springmvc.model.User;

/**
 * General services related to User instances
 */
public interface UserService {

	int register(User user);
	Patient registerPatient(User user);

	User validateUser(Login login);
	Patient profilePatient(User user);
	Doctor profileDoctor(User user);
	
	List <ShopObject> getAllShopObjects();
}

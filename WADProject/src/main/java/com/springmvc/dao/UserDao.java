package com.springmvc.dao;

import java.util.List;

import com.springmvc.model.Doctor;
import com.springmvc.model.Login;
import com.springmvc.model.Patient;
import com.springmvc.model.ShopObject;
import com.springmvc.model.User;

/**
 * Data Access Object of User instances
 */
public interface UserDao {

	int register(User user);
	Patient registerPatient(Patient patient);
	
	User validateUser(Login login);
	Patient profilePatient(User user);
	Doctor profileDoctor(User user);
	
	List <ShopObject> getAllShopObjects();
}

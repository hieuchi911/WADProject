package com.springmvc.dao;

import com.springmvc.model.Doctor;
import com.springmvc.model.Login;
import com.springmvc.model.Patient;
import com.springmvc.model.User;

/**
 * Data Access Object of User instances
 */
public interface UserDao {
	/* 
	 * This function adds the user to database
	 * @param user:	(User) A user for registration
	 * @return 		(int) Positive for successful add
	 */
	int register(User user);
	
	/*
	 * This function adds a specific patient to database
	 * @param patient:	(Patient) A patient for registration
	 * @return 			(Patient) A registered patient
	 */
	Patient registerPatient(Patient patient);
	
	/*
	 * This function validates a login via database
	 * @param login:	(Login) A login attempt
	 * @return 			(User) A valid user / null
	 */
	User validateUser(Login login);
	
	/*
	 * This function provides the profile of a patient user
	 * @param user:		(User) A valid user
	 * @return 			(Patient) The patient
	 */
	Patient profilePatient(User user);

	/*
	 * This function provides the profile of a doctor user
	 * @param user:		(User) A valid user
	 * @return 			(Doctor) The doctor
	 */
	Doctor profileDoctor(User user);
}

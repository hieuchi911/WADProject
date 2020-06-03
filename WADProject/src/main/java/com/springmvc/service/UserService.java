package com.springmvc.service;

import com.springmvc.model.Doctor;
import com.springmvc.model.Login;
import com.springmvc.model.Patient;
import com.springmvc.model.User;
import java.util.List;

/**
 * General services related to User instances
 */
public interface UserService {
	/* 
	 * This function adds the user via Data Access Object
	 * @param user:	(User) A user for registration
	 * @return 		(int) Positive for successful add
	 */
	int register(User user);
	
	/*
	 * This function adds a specific patient via Data Access Object
	 * @param patient:	(Patient) A patient for registration
	 * @return 			(Patient) A registered patient
	 */
	Patient registerPatient(Patient patient);

	/*
	 * This function validates a login via Data Access Object
	 * @param login:	(Login) A login attempt
	 * @return 			(User) A valid user / null
	 */
	User validateUser(Login login);
	
	/*
	 * This function provides the profile of a patient user via Data Access Object
	 * @param user:		(User) A valid user
	 * @return 			(Patient) The patient
	 */
	Patient profilePatient(User user);
	
		
	/*
	 * This function provides the profile of a doctor user via Data Access Object
	 * @param user:		(User) A valid user
	 * @return 			(Doctor) The doctor
	 */
	Doctor profileDoctor(User user);

//	void addSymptomReport(Patient patient);

	List<Doctor> getAllDoctors();

	/*
	 * This function updates the profile of a Patient user via Data Access Object
	 * @param editUser:		(Patient) A patient with updated params
	 * @return 			
	 */
	void updatePatient(Patient editUser);

	void updateMedicalData(String username, String description);
}

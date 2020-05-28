/*
	Random comment
*/

/*------------ User tables ------------*/

CREATE TABLE IF NOT EXISTS User (
	user_id int(10) NOT NULL AUTO_INCREMENT,
	username varchar(255) NOT NULL,
	password varchar(255) NOT NULL,
	PRIMARY KEY (user_id)
);

CREATE TABLE IF NOT EXISTS Doctor (
	doctor_id int(10) NOT NULL,
	name varchar(255) NOT NULL,
	sex varchar(6) NOT NULL,
	academic_rank varchar(255) NOT NULL,
	specialized_field varchar(255) NOT NULL,
	bio_description varchar(255) NOT NULL,

	PRIMARY KEY (doctor_id),
	FOREIGN KEY (doctor_id) REFERENCES User(user_id)
);

CREATE TABLE IF NOT EXISTS Patient (
	patient_id int(10) NOT NULL,
	name varchar(255) NOT NULL,
	phone_number varchar(12) NOT NULL,
	home_address varchar(255) NOT NULL,
	medical_description varchar(255) NOT NULL,
	
	PRIMARY KEY (patient_id),
	FOREIGN KEY (patient_id) REFERENCES User(user_id)
);

CREATE TABLE IF NOT EXISTS DoctorReview (
	review_id int(10) NOT NULL AUTO_INCREMENT,
	doctor_id int(10) NOT NULL,
	patient_id int(10) NOT NULL,
	description varchar(255) NOT NULL,
	stars int(2) NOT NULL,

	PRIMARY KEY (review_id),
	FOREIGN KEY (doctor_id) REFERENCES Doctor(doctor_id)
	FOREIGN KEY (patient_id) REFERENCES Patient(patient_id)
);

CREATE TABLE IF NOT EXISTS Appointment (
	appointment_id int(10) NOT NULL AUTO_INCREMENT,
	doctor_id int(10) NOT NULL,
	patient_id int(10) NOT NULL,
	illness_description varchar(255) NOT NULL,
	from_to varchar(255) NOT NULL,

	PRIMARY KEY (appointment_id),
	FOREIGN KEY (doctor_id) REFERENCES Doctor(doctor_id)
	FOREIGN KEY (patient_id) REFERENCES Patient(patient_id)
);

/*------------ Shop object tables ------------*/

CREATE TABLE IF NOT EXISTS ShopObject (
	object_id int(10) NOT NULL AUTO_INCREMENT,
	name varchar(255) NOT NULL,
	manufacturer varchar(255) NOT NULL,
	description varchar(255) NOT NULL,
	price int(10) NOT NULL,

	PRIMARY KEY (object_id)
);

CREATE TABLE IF NOT EXISTS MedicalTool (
	tool_id int(10) NOT NULL,
	description varchar(255) NOT NULL,

	PRIMARY KEY (tool_id),
	FOREIGN KEY (tool_id) REFERENCES ShopObject(object_id)
);

CREATE TABLE IF NOT EXISTS Medicine (
	medicine_id int(10) NOT NULL,
	usage varchar(255) NOT NULL,
	ingredients varchar(255) NOT NULL,
	side_effects varchar(255) NOT NULL,    # very truthful

	PRIMARY KEY (medicine_id),
	FOREIGN KEY (medicine_id) REFERENCES ShopObject(object_id)
);

CREATE TABLE IF NOT EXISTS ObjectReview (
	review_id int(10) NOT NULL AUTO_INCREMENT,
	user_id int(10) NOT NULL,
	object_id int(10) NOT NULL,
	description varchar(255) NOT NULL,
	stars int(2) NOT NULL,

	PRIMARY KEY (review_id),
	FOREIGN KEY (object_id) REFERENCES ShopObject(object_id)
	FOREIGN KEY (user_id) REFERENCES User(user_id)
);

/*------------ Prescriptions ------------*/

CREATE TABLE IF NOT EXISTS Prescription (
	prescription_id int(10) NOT NULL AUTO_INCREMENT,
	doctor_id int(10) NOT NULL,
	patient_id int(10) NOT NULL,
	diagnosis varchar(255) NOT NULL,

	PRIMARY KEY (prescription_id),
	FOREIGN KEY (doctor_id) REFERENCES Doctor(doctor_id),
	FOREIGN KEY (patient_id) REFERENCES Patient(patient_id)
);

CREATE TABLE IF NOT EXISTS PrescribedMedicine (
	prescription_id int(10) NOT NULL,
	medicine_id int(10) NOT NULL,

	PRIMARY KEY (prescription_id, medicine_id),
	FOREIGN KEY (prescription_id) REFERENCES Prescription(prescription_id),
	FOREIGN KEY (medicine_id) REFERENCES Medicine(medicine_id)
);

/*------------ Cart ------------*/

CREATE TABLE IF NOT EXISTS Cart (
	cart_id int(10) NOT NULL AUTO_INCREMENT,
	user_id int(10) NOT NULL,
	checkout_date varchar(20) NOT NULL,

	PRIMARY KEY (cart_id),
	FOREIGN KEY (user_id) REFERENCES User(user_id)
);

CREATE TABLE IF NOT EXISTS CartObject (
	cart_id int(10) NOT NULL,
	object_id int(10) NOT NULL,

	PRIMARY KEY (cart_id, object_id),
	FOREIGN KEY (cart_id) REFERENCES Cart(cart_id),
	FOREIGN KEY (object_id) REFERENCES Object(object_id)
);

-- MySQL Workbench Forward Engineering

-- -----------------------------------------------------
-- Database spring_mvc
-- -----------------------------------------------------
CREATE DATABASE IF NOT EXISTS `spring_mvc`;
USE `spring_mvc` ;

-- -----------------------------------------------------
-- Table `spring_mvc`.`user`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `spring_mvc`.`user` (
  `username` VARCHAR(255) NOT NULL,
  `password` VARCHAR(255) NOT NULL,
  `user_type` VARCHAR(45) NOT NULL,
  PRIMARY KEY (`username`))
ENGINE = InnoDB
DEFAULT CHARACTER SET = utf8mb4
COLLATE = utf8mb4_0900_ai_ci;


-- -----------------------------------------------------
-- Table `spring_mvc`.`doctor`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `spring_mvc`.`doctor` (
  `doctor_username` VARCHAR(255) NOT NULL,
  `name` VARCHAR(255) NOT NULL,
  `photo_url` VARCHAR(45) NOT NULL,
  `gender` VARCHAR(6) NOT NULL,
  `academic_rank` VARCHAR(255) NOT NULL,
  `specialized_field` VARCHAR(255) NOT NULL,
  `bio_description` VARCHAR(255) NOT NULL,
  PRIMARY KEY (`doctor_username`),
  CONSTRAINT `fk_doctor_user1`
    FOREIGN KEY (`doctor_username`)
    REFERENCES `spring_mvc`.`user` (`username`))
ENGINE = InnoDB
DEFAULT CHARACTER SET = utf8mb4
COLLATE = utf8mb4_0900_ai_ci;


-- -----------------------------------------------------
-- Table `spring_mvc`.`patient`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `spring_mvc`.`patient` (
  `patient_username` VARCHAR(255) NOT NULL,
  `name` VARCHAR(255) NOT NULL,
  `gender` VARCHAR(6) NOT NULL,
  `phone_number` VARCHAR(12) NOT NULL,
  `home_address` VARCHAR(255) NOT NULL,
  `medical_description` VARCHAR(255) NOT NULL,
  PRIMARY KEY (`patient_username`),
  CONSTRAINT `fk_patient_user1`
    FOREIGN KEY (`patient_username`)
    REFERENCES `spring_mvc`.`user` (`username`))
ENGINE = InnoDB
DEFAULT CHARACTER SET = utf8mb4
COLLATE = utf8mb4_0900_ai_ci;


-- -----------------------------------------------------
-- Table `spring_mvc`.`appointment`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `spring_mvc`.`appointment` (
  `appointment_id` INT NOT NULL AUTO_INCREMENT,
  `doctor_username` VARCHAR(255) NOT NULL,
  `patient_username` VARCHAR(255) NOT NULL,
  `illness_description` VARCHAR(255) NOT NULL,
  `from_to` VARCHAR(255) NOT NULL,
  PRIMARY KEY (`appointment_id`),
  INDEX `fk_appointment_doctor1_idx` (`doctor_username` ASC) VISIBLE,
  INDEX `fk_appointment_patient1_idx` (`patient_username` ASC) VISIBLE,
  CONSTRAINT `fk_appointment_doctor1`
    FOREIGN KEY (`doctor_username`)
    REFERENCES `spring_mvc`.`doctor` (`doctor_username`),
  CONSTRAINT `fk_appointment_patient1`
    FOREIGN KEY (`patient_username`)
    REFERENCES `spring_mvc`.`patient` (`patient_username`))
ENGINE = InnoDB
AUTO_INCREMENT = 22
DEFAULT CHARACTER SET = utf8mb4
COLLATE = utf8mb4_0900_ai_ci;


-- -----------------------------------------------------
-- Table `spring_mvc`.`cart`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `spring_mvc`.`cart` (
  `cart_id` INT NOT NULL AUTO_INCREMENT,
  `username` VARCHAR(255) NOT NULL,
  `checkout_date` VARCHAR(20) NOT NULL,
  PRIMARY KEY (`cart_id`),
  INDEX `fk_cart_user1_idx` (`username` ASC) VISIBLE,
  CONSTRAINT `fk_cart_user1`
    FOREIGN KEY (`username`)
    REFERENCES `spring_mvc`.`user` (`username`))
ENGINE = InnoDB
DEFAULT CHARACTER SET = utf8mb4
COLLATE = utf8mb4_0900_ai_ci;


-- -----------------------------------------------------
-- Table `spring_mvc`.`shopobject`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `spring_mvc`.`shopobject` (
  `object_id` INT NOT NULL AUTO_INCREMENT,
  `name` VARCHAR(255) NOT NULL,
  `category` VARCHAR(45) NOT NULL,
  `photo_url` VARCHAR(45) NOT NULL,
  `manufacturer` VARCHAR(255) NOT NULL,
  `description` VARCHAR(255) NOT NULL,
  `price` INT NOT NULL,
  PRIMARY KEY (`object_id`))
ENGINE = InnoDB
AUTO_INCREMENT = 7
DEFAULT CHARACTER SET = utf8mb4
COLLATE = utf8mb4_0900_ai_ci;


-- -----------------------------------------------------
-- Table `spring_mvc`.`cartobject`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `spring_mvc`.`cartobject` (
  `object_id` INT NOT NULL,
  `cart_id` INT NOT NULL,
  `amount` INT NOT NULL,
  PRIMARY KEY (`object_id`, `cart_id`),
  INDEX `object_id` (`object_id` ASC) VISIBLE,
  INDEX `fk_cartobject_cart1_idx` (`cart_id` ASC) VISIBLE,
  CONSTRAINT `cartobject_ibfk_2`
    FOREIGN KEY (`object_id`)
    REFERENCES `spring_mvc`.`shopobject` (`object_id`),
  CONSTRAINT `fk_cartobject_cart1`
    FOREIGN KEY (`cart_id`)
    REFERENCES `spring_mvc`.`cart` (`cart_id`))
ENGINE = InnoDB
DEFAULT CHARACTER SET = utf8mb4
COLLATE = utf8mb4_0900_ai_ci;


-- -----------------------------------------------------
-- Table `spring_mvc`.`medicaltool`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `spring_mvc`.`medicaltool` (
  `tool_id` INT NOT NULL,
  `usage` VARCHAR(255) NOT NULL,
  PRIMARY KEY (`tool_id`),
  CONSTRAINT `medicaltool_ibfk_1`
    FOREIGN KEY (`tool_id`)
    REFERENCES `spring_mvc`.`shopobject` (`object_id`))
ENGINE = InnoDB
DEFAULT CHARACTER SET = utf8mb4
COLLATE = utf8mb4_0900_ai_ci;


-- -----------------------------------------------------
-- Table `spring_mvc`.`medicine`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `spring_mvc`.`medicine` (
  `medicine_id` INT NOT NULL,
  `instruction` VARCHAR(255) NOT NULL,
  `ingredients` VARCHAR(255) NOT NULL,
  `side_effects` VARCHAR(255) NOT NULL,
  PRIMARY KEY (`medicine_id`),
  CONSTRAINT `medicine_ibfk_1`
    FOREIGN KEY (`medicine_id`)
    REFERENCES `spring_mvc`.`shopobject` (`object_id`))
ENGINE = InnoDB
DEFAULT CHARACTER SET = utf8mb4
COLLATE = utf8mb4_0900_ai_ci;


-- -----------------------------------------------------
-- Table `spring_mvc`.`prescription`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `spring_mvc`.`prescription` (
  `prescription_id` INT NOT NULL AUTO_INCREMENT,
  `doctor_username` VARCHAR(255) NOT NULL,
  `patient_username` VARCHAR(255) NOT NULL,
  `diagnosis` VARCHAR(255) NOT NULL,
  `from_to` VARCHAR(45) NOT NULL,
  PRIMARY KEY (`prescription_id`),
  INDEX `fk_prescription_doctor1_idx` (`doctor_username` ASC) VISIBLE,
  INDEX `fk_prescription_patient1_idx` (`patient_username` ASC) VISIBLE,
  CONSTRAINT `fk_prescription_doctor1`
    FOREIGN KEY (`doctor_username`)
    REFERENCES `spring_mvc`.`doctor` (`doctor_username`),
  CONSTRAINT `fk_prescription_patient1`
    FOREIGN KEY (`patient_username`)
    REFERENCES `spring_mvc`.`patient` (`patient_username`))
ENGINE = InnoDB
AUTO_INCREMENT = 4
DEFAULT CHARACTER SET = utf8mb4
COLLATE = utf8mb4_0900_ai_ci;


-- -----------------------------------------------------
-- Table `spring_mvc`.`prescribedmedicine`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `spring_mvc`.`prescribedmedicine` (
  `prescription_id` INT NOT NULL,
  `medicine_id` INT NOT NULL,
  `amount` INT NOT NULL,
  `dosage` VARCHAR(255) NOT NULL,
  PRIMARY KEY (`prescription_id`, `medicine_id`),
  INDEX `medicine_id` (`medicine_id` ASC) VISIBLE,
  CONSTRAINT `prescribedmedicine_ibfk_1`
    FOREIGN KEY (`prescription_id`)
    REFERENCES `spring_mvc`.`prescription` (`prescription_id`),
  CONSTRAINT `prescribedmedicine_ibfk_2`
    FOREIGN KEY (`medicine_id`)
    REFERENCES `spring_mvc`.`medicine` (`medicine_id`))
ENGINE = InnoDB
DEFAULT CHARACTER SET = utf8mb4
COLLATE = utf8mb4_0900_ai_ci;

-- Add users
INSERT INTO `spring_mvc`.`user`
	VALUES
        ("DrPhoebe", "123", "doctor"),
		("DrJoey", "123", "doctor"),
        ("DrChandler", "123", "doctor"),
        ("DrMonica", "123", "doctor"),
        ("DrRoss", "123", "doctor"),
        ("DrRachel", "123", "doctor");

-- Add doctors


INSERT INTO `spring_mvc`.`doctor`
	VALUES
		("DrPhoebe", "Phoebe Buffay", "images/doctors/phoebe-buffay.jpg",  "Female", "MD PhD", "Cardiology", "Been doctor since while"),
        ("DrJoey", "Joey Tribbiani", "images/doctors/joey-tribbiani.jpg",  "Male", "MD PhD", "Endocrinology", "Been doctor since while"),
        ("DrRoss", "Ross Geller", "images/doctors/ross-geller.jpg",  "Male", "MD PhD", "Neurology", "Been doctor since while"),
        ("DrRachel", "Rachel Green", "images/doctors/rachel-green.jpg",  "Female", "MD PhD", "Gastroenterology", "Been doctor since while"),
        ("DrChandler", "Chandler Bing", "images/doctors/chandler-bing.jpg",  "Male", "MD PhD", "Rheumatology", "Been doctor since while"),
        ("DrMonica", "Monica Geller", "images/doctors/monica-geller.jpg", "Female", "MD PhD", "Pulmonology", "Been doctor since while");

-- Add medicines and medical tools
INSERT INTO `spring_mvc`.`shopobject` (`object_id`, `photo_url`, `name`, `manufacturer`, `description`, `price`, `category`)
	VALUES
		(1, "images/elthon50mg.jpg", "Elthon 550mg", "Vietnam", "pills", 50, "medicine"),
		(2, "images/ampicillin500mg.jpg", "Ampicillin Trihydrate 500mg Capsules", "Murika", "inedible", 20, "medicine"),
		(3, "images/noroxin.jpg", "Noroxin (Norfloxacin) 400mg", "Murika", "inedible", 70, "medicine"),
		(4, "images/revia.jpg", "Revia 50 mg", "Murika", "inedible", 100, "medicine"),
		(5, "images/stethoscope.jpg", "Stethoscope", "Murika", "For doctors only", 150, "tool"),
		(6, "images/blood-pressure-meter.jpg", "Blood pressure meter arm band AXP-CUFFFAGY103", "Vietnam", "Keep out of children's reach", 300, "tool");

-- Add medicines
INSERT INTO `spring_mvc'.'medicine` (`medicine_id`,`instruction`,`ingredients`,`side_effects`) VALUES (1,'Elthon 50mg pills are produced in the form of film-coated tablets and are used orally. People should use the medicine before meals and must follow the manufacturer\'s instructions.','The composition of Elthon 50mg pills includes active ingredient Itopride hydrochloride 50mg and some excipients, pharmaceuticals just enough to make a film-coated tablet as provided by the manufacturer.','Shock and hypersensitivity reactions such as dyspnea, paleness, hypotension, laryngeal edema, jaundice, sweating, liver dysfunction ...');
INSERT INTO `spring_mvc'.'medicine` (`medicine_id`,`instruction`,`ingredients`,`side_effects`) VALUES (2,'Take this medication by mouth usually 4 times a day (every 6 hours), or as directed by your doctor.','Penicillin, cephalosporin','Nausea, vomiting, diarrhea, or mouth/tongue sores may occur. If any of these effects persist or worsen, notify your doctor or pharmacist promptly.');
INSERT INTO `spring_mvc'.'medicine` (`medicine_id`,`instruction`,`ingredients`,`side_effects`) VALUES (3,'NOROXIN is indicated for the treatment of adults with the following infections caused by susceptible strains of the designated microorganisms.','Norfloxacin, a fluoroquinolone, is 1-ethyl-6-fluoro-1,4-dihydro-4-oxo-7-(1-piperazinyl)-3-quinolinecarboxylic acid.','Fluoroquinolones, including NOROXIN, may exacerbate muscle weakness in patients with myasthenia gravis. Avoid NOROXIN in patients with known history of myasthenia gravis.');
INSERT INTO `spring_mvc'.'medicine` (`medicine_id`,`instruction`,`ingredients`,`side_effects`) VALUES (4,'Take this medication by mouth with or without food, usually 50 milligrams once daily or as directed by your doctor.','Naltrexone belongs to a class of drugs known as opiate antagonists.','Nausea, headache, dizziness, anxiety, tiredness, and trouble sleeping may occur.');

-- Add medical tools
INSERT INTO `spring_mvc'.'medicaltool` (`tool_id`,`usage`) VALUES (5,'The stethoscope is an acoustic medical device for auscultation, or listening to internal sounds of an animal or human body.');
INSERT INTO `spring_mvc'.'medicaltool` (`tool_id`,`usage`) VALUES (6,'An at-home monitor will give your doctor better insight into how your blood pressure changes throughout the day, rather than only getting immediate readings when you visit their office.');

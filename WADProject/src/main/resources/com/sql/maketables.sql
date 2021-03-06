-- MySQL Workbench Forward Engineering-------

-- -----------------------------------------------------
-- Database `spring_mvc`
-- -----------------------------------------------------
CREATE DATABASE IF NOT EXISTS `spring_mvc`;
USE `spring_mvc` ;

-- -----------------------------------------------------
-- Table `spring_mvc`.`user`
-- -----------------------------------------------------
DROP TABLE IF EXISTS `spring_mvc`.`user` ;

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
DROP TABLE IF EXISTS `spring_mvc`.`doctor` ;

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
    REFERENCES `spring_mvc`.`user` (`username`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION)
ENGINE = InnoDB
DEFAULT CHARACTER SET = utf8mb4
COLLATE = utf8mb4_0900_ai_ci;


-- -----------------------------------------------------
-- Table `spring_mvc`.`patient`
-- -----------------------------------------------------
DROP TABLE IF EXISTS `spring_mvc`.`patient` ;

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
    REFERENCES `spring_mvc`.`user` (`username`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION)
ENGINE = InnoDB
DEFAULT CHARACTER SET = utf8mb4
COLLATE = utf8mb4_0900_ai_ci;


-- -----------------------------------------------------
-- Table `spring_mvc`.`appointment`
-- -----------------------------------------------------
DROP TABLE IF EXISTS `spring_mvc`.`appointment` ;

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
    REFERENCES `spring_mvc`.`doctor` (`doctor_username`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION,
  CONSTRAINT `fk_appointment_patient1`
    FOREIGN KEY (`patient_username`)
    REFERENCES `spring_mvc`.`patient` (`patient_username`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION)
ENGINE = InnoDB
DEFAULT CHARACTER SET = utf8mb4
COLLATE = utf8mb4_0900_ai_ci;


-- -----------------------------------------------------
-- Table `spring_mvc`.`cart`
-- -----------------------------------------------------
DROP TABLE IF EXISTS `spring_mvc`.`cart` ;

CREATE TABLE IF NOT EXISTS `spring_mvc`.`cart` (
  `cart_id` INT NOT NULL AUTO_INCREMENT,
  `username` VARCHAR(255) NOT NULL,
  `checkout_date` VARCHAR(20) NOT NULL,
  INDEX `fk_cart_user1_idx` (`username` ASC) VISIBLE,
  PRIMARY KEY (`cart_id`),
  CONSTRAINT `fk_cart_user1`
    FOREIGN KEY (`username`)
    REFERENCES `spring_mvc`.`user` (`username`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION)
ENGINE = InnoDB
DEFAULT CHARACTER SET = utf8mb4
COLLATE = utf8mb4_0900_ai_ci;


-- -----------------------------------------------------
-- Table `spring_mvc`.`shopobject`
-- -----------------------------------------------------
DROP TABLE IF EXISTS `spring_mvc`.`shopobject` ;

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
DEFAULT CHARACTER SET = utf8mb4
COLLATE = utf8mb4_0900_ai_ci;


-- -----------------------------------------------------
-- Table `spring_mvc`.`cartobject`
-- -----------------------------------------------------
DROP TABLE IF EXISTS `spring_mvc`.`cartobject` ;

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
    REFERENCES `spring_mvc`.`cart` (`cart_id`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION)
ENGINE = InnoDB
DEFAULT CHARACTER SET = utf8mb4
COLLATE = utf8mb4_0900_ai_ci;


-- -----------------------------------------------------
-- Table `spring_mvc`.`doctorreview`
-- -----------------------------------------------------
DROP TABLE IF EXISTS `spring_mvc`.`doctorreview` ;

CREATE TABLE IF NOT EXISTS `spring_mvc`.`doctorreview` (
  `review_id` INT NOT NULL AUTO_INCREMENT,
  `doctor_username` VARCHAR(255) NOT NULL,
  `patient_username` VARCHAR(255) NOT NULL,
  `description` VARCHAR(255) NOT NULL,
  `liked` BINARY NOT NULL,
  PRIMARY KEY (`review_id`),
  INDEX `fk_doctorreview_doctor1_idx` (`doctor_username` ASC) VISIBLE,
  INDEX `fk_doctorreview_patient1_idx` (`patient_username` ASC) VISIBLE,
  CONSTRAINT `fk_doctorreview_doctor1`
    FOREIGN KEY (`doctor_username`)
    REFERENCES `spring_mvc`.`doctor` (`doctor_username`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION,
  CONSTRAINT `fk_doctorreview_patient1`
    FOREIGN KEY (`patient_username`)
    REFERENCES `spring_mvc`.`patient` (`patient_username`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION)
ENGINE = InnoDB
DEFAULT CHARACTER SET = utf8mb4
COLLATE = utf8mb4_0900_ai_ci;


-- -----------------------------------------------------
-- Table `spring_mvc`.`medicaltool`
-- -----------------------------------------------------
DROP TABLE IF EXISTS `spring_mvc`.`medicaltool` ;

CREATE TABLE IF NOT EXISTS `spring_mvc`.`medicaltool` (
  `tool_id` INT NOT NULL,
  `description` VARCHAR(255) NOT NULL,
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
DROP TABLE IF EXISTS `spring_mvc`.`medicine` ;

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
-- Table `spring_mvc`.`objectreview`
-- -----------------------------------------------------
DROP TABLE IF EXISTS `spring_mvc`.`objectreview` ;

CREATE TABLE IF NOT EXISTS `spring_mvc`.`objectreview` (
  `review_id` INT NOT NULL AUTO_INCREMENT,
  `username` VARCHAR(255) NOT NULL,
  `object_id` INT NOT NULL,
  `description` VARCHAR(255) NOT NULL,
  `liked` BINARY NOT NULL,
  INDEX `fk_objectreview_user1_idx` (`username` ASC) VISIBLE,
  INDEX `fk_objectreview_shopobject1_idx` (`object_id` ASC) VISIBLE,
  PRIMARY KEY (`review_id`),
  CONSTRAINT `fk_objectreview_user1`
    FOREIGN KEY (`username`)
    REFERENCES `spring_mvc`.`user` (`username`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION,
  CONSTRAINT `fk_objectreview_shopobject1`
    FOREIGN KEY (`object_id`)
    REFERENCES `spring_mvc`.`shopobject` (`object_id`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION)
ENGINE = InnoDB
DEFAULT CHARACTER SET = utf8mb4
COLLATE = utf8mb4_0900_ai_ci;


-- -----------------------------------------------------
-- Table `spring_mvc`.`prescription`
-- -----------------------------------------------------
DROP TABLE IF EXISTS `spring_mvc`.`prescription` ;

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
    REFERENCES `spring_mvc`.`doctor` (`doctor_username`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION,
  CONSTRAINT `fk_prescription_patient1`
    FOREIGN KEY (`patient_username`)
    REFERENCES `spring_mvc`.`patient` (`patient_username`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION)
ENGINE = InnoDB
DEFAULT CHARACTER SET = utf8mb4
COLLATE = utf8mb4_0900_ai_ci;


-- -----------------------------------------------------
-- Table `spring_mvc`.`prescribedmedicine`
-- -----------------------------------------------------
DROP TABLE IF EXISTS `spring_mvc`.`prescribedmedicine` ;

CREATE TABLE IF NOT EXISTS `spring_mvc`.`prescribedmedicine` (
  `prescription_id` INT NOT NULL,
  `medicine_id` INT NOT NULL,
  `amount` INT NOT NULL,
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


-- -----------------------------------------------------
-- Database spring_mvc
-- -----------------------------------------------------
CREATE DATABASE IF NOT EXISTS `spring_mvc`;
USE `spring_mvc` ;

-- -----------------------------------------------------
-- Table `spring_mvc`.`user`
-- -----------------------------------------------------
DROP TABLE IF EXISTS `spring_mvc`.`user` ;

CREATE TABLE IF NOT EXISTS `spring_mvc`.`user` (
  `user_id` INT NOT NULL AUTO_INCREMENT,
  `username` VARCHAR(255) NOT NULL,
  `password` VARCHAR(255) NOT NULL,
  `user_type` VARCHAR(255) NOT NULL,
  PRIMARY KEY (`user_id`))
ENGINE = InnoDB
DEFAULT CHARACTER SET = utf8mb4
COLLATE = utf8mb4_0900_ai_ci;


-- -----------------------------------------------------
-- Table `spring_mvc`.`doctor`
-- -----------------------------------------------------
DROP TABLE IF EXISTS `spring_mvc`.`doctor` ;

CREATE TABLE IF NOT EXISTS `spring_mvc`.`doctor` (
  `doctor_id` INT NOT NULL,
  `name` VARCHAR(255) NOT NULL,
  `photo-url` VARCHAR(45) NOT NULL,
  `sex` VARCHAR(6) NOT NULL,
  `academic_rank` VARCHAR(255) NOT NULL,
  `specialized_field` VARCHAR(255) NOT NULL,
  `bio_description` VARCHAR(255) NOT NULL,
  PRIMARY KEY (`doctor_id`),
  CONSTRAINT `fk_doctor_user`
    FOREIGN KEY (`doctor_id`)
    REFERENCES `spring_mvc`.`user` (`user_id`)
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
  `patient_id` INT NOT NULL,
  `name` VARCHAR(255) NOT NULL,
  `phone_number` VARCHAR(12) NOT NULL,
  `home_address` VARCHAR(255) NOT NULL,
  `medical_description` VARCHAR(255) NOT NULL,
  PRIMARY KEY (`patient_id`),
  CONSTRAINT `fk_patient_user`
    FOREIGN KEY (`patient_id`)
    REFERENCES `spring_mvc`.`user` (`user_id`)
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
  `doctor_id` INT NOT NULL,
  `patient_id` INT NOT NULL,
  `illness_description` VARCHAR(255) NOT NULL,
  `from_to` VARCHAR(255) NOT NULL,
  PRIMARY KEY (`appointment_id`),
  INDEX `fk_appointment_doctor_idx` (`doctor_id` ASC) VISIBLE,
  INDEX `fk_appointment_patient_idx` (`patient_id` ASC) VISIBLE,
  CONSTRAINT `fk_appointment_doctor`
    FOREIGN KEY (`doctor_id`)
    REFERENCES `spring_mvc`.`doctor` (`doctor_id`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION,
  CONSTRAINT `fk_appointment_patient`
    FOREIGN KEY (`patient_id`)
    REFERENCES `spring_mvc`.`patient` (`patient_id`)
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
  `user_id` INT NOT NULL,
  `checkout_date` VARCHAR(20) NOT NULL,
  INDEX `fk_cart_user_idx` (`user_id` ASC) VISIBLE,
  PRIMARY KEY (`cart_id`),
  CONSTRAINT `fk_cart_user`
    FOREIGN KEY (`user_id`)
    REFERENCES `spring_mvc`.`user` (`user_id`)
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
  `photo-url` VARCHAR(45) NOT NULL,
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
  INDEX `fk_cartobject_cart_idx` (`cart_id` ASC) VISIBLE,
  CONSTRAINT `fk_cartobject_shopobject`
    FOREIGN KEY (`object_id`)
    REFERENCES `spring_mvc`.`shopobject` (`object_id`),
  CONSTRAINT `fk_cartobject_cart`
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
  `doctor_id` INT NOT NULL,
  `patient_id` INT NOT NULL,
  `description` VARCHAR(255) NOT NULL,
  `stars` INT NOT NULL,
  PRIMARY KEY (`review_id`),
  INDEX `fk_doctorreview_doctor_idx` (`doctor_id` ASC) VISIBLE,
  INDEX `fk_doctorreview_patient_idx` (`patient_id` ASC) VISIBLE,
  CONSTRAINT `fk_doctorreview_doctor`
    FOREIGN KEY (`doctor_id`)
    REFERENCES `spring_mvc`.`doctor` (`doctor_id`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION,
  CONSTRAINT `fk_doctorreview_patient`
    FOREIGN KEY (`patient_id`)
    REFERENCES `spring_mvc`.`patient` (`patient_id`)
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
  CONSTRAINT `fk_medicaltool_shopobject`
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
  CONSTRAINT `fk_medicine_shopobject`
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
  `user_id` INT NOT NULL,
  `object_id` INT NOT NULL,
  `description` VARCHAR(255) NOT NULL,
  `stars` INT NOT NULL,
  INDEX `fk_objectreview_user_idx` (`user_id` ASC) VISIBLE,
  INDEX `fk_objectreview_shopobject_idx` (`object_id` ASC) VISIBLE,
  PRIMARY KEY (`review_id`),
  CONSTRAINT `fk_objectreview_user`
    FOREIGN KEY (`user_id`)
    REFERENCES `spring_mvc`.`user` (`user_id`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION,
  CONSTRAINT `fk_objectreview_shopobject`
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
  `doctor_id` INT NOT NULL,
  `patient_id` INT NOT NULL,
  `diagnosis` VARCHAR(255) NOT NULL,
  PRIMARY KEY (`prescription_id`),
  INDEX `fk_prescription_doctor_idx` (`doctor_id` ASC) VISIBLE,
  INDEX `fk_prescription_patient_idx` (`patient_id` ASC) VISIBLE,
  CONSTRAINT `fk_prescription_doctor`
    FOREIGN KEY (`doctor_id`)
    REFERENCES `spring_mvc`.`doctor` (`doctor_id`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION,
  CONSTRAINT `fk_prescription_patient`
    FOREIGN KEY (`patient_id`)
    REFERENCES `spring_mvc`.`patient` (`patient_id`)
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
  PRIMARY KEY (`prescription_id`, `medicine_id`),
  INDEX `medicine_id` (`medicine_id` ASC) VISIBLE,
  CONSTRAINT `fk_prescribedmedicine_prescriptionid`
    FOREIGN KEY (`prescription_id`)
    REFERENCES `spring_mvc`.`prescription` (`prescription_id`),
  CONSTRAINT `fk_prescribedmedicine_medicineid`
    FOREIGN KEY (`medicine_id`)
    REFERENCES `spring_mvc`.`medicine` (`medicine_id`))
ENGINE = InnoDB
DEFAULT CHARACTER SET = utf8mb4
COLLATE = utf8mb4_0900_ai_ci;



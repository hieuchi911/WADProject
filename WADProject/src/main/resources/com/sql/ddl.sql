CREATE DATABASE IF NOT EXISTS spring_mvc;

USE spring_mvc;

DROP TABLE IF EXISTS `spring_mvc`.`users`;

CREATE TABLE `spring_mvc`.`users` (
  `username` VARCHAR(45) NOT NULL,
  `password` VARCHAR(45) NOT NULL,
  `usertype` VARCHAR(45) NOT NULL,
  PRIMARY KEY (`username`));
  
DROP TABLE IF EXISTS `spring_mvc`.`patients`;

CREATE TABLE `spring_mvc`.`patients` (
  `username` VARCHAR(45) NOT NULL,
  `name` VARCHAR(45) NOT NULL,
  `gender` VARCHAR(45) NOT NULL,
  `phone` VARCHAR(45) NOT NULL,
  `address` VARCHAR(45) NOT NULL,
  `description` VARCHAR(45) NOT NULL,

  PRIMARY KEY (`username`));
  
DROP TABLE IF EXISTS `spring_mvc`.`doctors`;

CREATE TABLE `spring_mvc`.`doctors` (
  `username` VARCHAR(45) NOT NULL,
  `name` VARCHAR(45) NOT NULL,
  `gender` VARCHAR(45) NOT NULL,
  `rank` VARCHAR(45) NOT NULL,
  `field` VARCHAR(45) NOT NULL,
  `description` VARCHAR(45) NOT NULL,

  PRIMARY KEY (`username`));

INSERT INTO `spring_mvc`.`users` VALUES("doctor", "doctor", "doctor");
INSERT INTO `spring_mvc`.`doctors` VALUES("doctor", "Doctor",  "Male", "MD PhD", "Neurology", "Been doctor since while");

DROP TABLE IF EXISTS `spring_mvc`.`shop_objects`;

CREATE TABLE `spring_mvc`.`shop_objects` (
  `id` INTEGER NOT NULL AUTO_INCREMENT,
  `url` VARCHAR(45) NULL,
  `name` VARCHAR(45) NOT NULL,
  `manufacturer` VARCHAR(45) NOT NULL,
  `description` VARCHAR(45) NOT NULL,
  `price` DOUBLE NOT NULL, 
  `type` VARCHAR(45) NOT NULL,
  PRIMARY KEY (`id`));
  
INSERT INTO `spring_mvc`.`shop_objects` (`url`, `name`, `manufacturer`, `description`, `price`, `type`) VALUES("com/images/elthon50mg.jpg", "Elthon 50mg", "Vietnam", "pills", 50, "medicine");
INSERT INTO `spring_mvc`.`shop_objects` (`url`, `name`, `manufacturer`, `description`, `price`, `type`) VALUES("com/images/stethoscope.jpg", "Stethoscope", "Murika", "inedible", 100, "tool");

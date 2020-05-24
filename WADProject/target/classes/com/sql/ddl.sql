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
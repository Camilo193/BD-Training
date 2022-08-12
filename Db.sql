-- MySQL Workbench Forward Engineering

SET @OLD_UNIQUE_CHECKS=@@UNIQUE_CHECKS, UNIQUE_CHECKS=0;
SET @OLD_FOREIGN_KEY_CHECKS=@@FOREIGN_KEY_CHECKS, FOREIGN_KEY_CHECKS=0;
SET @OLD_SQL_MODE=@@SQL_MODE, SQL_MODE='ONLY_FULL_GROUP_BY,STRICT_TRANS_TABLES,NO_ZERO_IN_DATE,NO_ZERO_DATE,ERROR_FOR_DIVISION_BY_ZERO,NO_ENGINE_SUBSTITUTION';

-- -----------------------------------------------------
-- Schema university_db
-- -----------------------------------------------------

-- -----------------------------------------------------
-- Schema university_db
-- -----------------------------------------------------
CREATE SCHEMA IF NOT EXISTS `university_db` DEFAULT CHARACTER SET utf8 ;
USE `university_db` ;

-- -----------------------------------------------------
-- Table `university_db`.`type`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `university_db`.`type` (
  `id` INT NOT NULL,
  `name` VARCHAR(45) CHARACTER SET 'armscii8' NOT NULL,
  PRIMARY KEY (`id`))
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `university_db`.`type_detail`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `university_db`.`type_detail` (
  `id` INT NOT NULL,
  `type_id` INT NOT NULL,
  `description` VARCHAR(200) NOT NULL,
  INDEX `fk_type_detail_type1_idx` (`type_id` ASC) VISIBLE,
  PRIMARY KEY (`id`),
  CONSTRAINT `fk_type_detail_type1`
    FOREIGN KEY (`type_id`)
    REFERENCES `university_db`.`type` (`id`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION)
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `university_db`.`People`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `university_db`.`People` (
  `dni` INT NOT NULL,
  `dniType` INT NOT NULL,
  `firstName` VARCHAR(45) NOT NULL,
  `secondName` VARCHAR(45) NULL,
  `firstLastName` VARCHAR(45) NOT NULL,
  `secondLastName` VARCHAR(45) NOT NULL,
  `address` VARCHAR(45) NOT NULL,
  `email` VARCHAR(45) NOT NULL,
  PRIMARY KEY (`dni`, `dniType`),
  INDEX `fk_People_type_detail1_idx` (`dniType` ASC) VISIBLE,
  UNIQUE INDEX `email_UNIQUE` (`email` ASC) VISIBLE,
  CONSTRAINT `fk_People_type_detail1`
    FOREIGN KEY (`dniType`)
    REFERENCES `university_db`.`type_detail` (`id`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION)
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `university_db`.`Students`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `university_db`.`Students` (
  `dni` INT NOT NULL,
  `dniType` INT NOT NULL,
  INDEX `fk_Students_People1_idx` (`dni` ASC, `dniType` ASC) VISIBLE,
  PRIMARY KEY (`dni`, `dniType`),
  CONSTRAINT `fk_Students_People1`
    FOREIGN KEY (`dni` , `dniType`)
    REFERENCES `university_db`.`People` (`dni` , `dniType`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION)
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `university_db`.`Departments`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `university_db`.`Departments` (
  `id` INT NOT NULL AUTO_INCREMENT,
  `name` VARCHAR(45) NOT NULL,
  `address` VARCHAR(45) NOT NULL,
  PRIMARY KEY (`id`))
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `university_db`.`Teachers`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `university_db`.`Teachers` (
  `dni` INT NOT NULL,
  `dniType` INT NOT NULL,
  `wage` VARCHAR(45) NOT NULL,
  `departmentId` INT NOT NULL,
  INDEX `fk_teacher_department_idx` (`departmentId` ASC) VISIBLE,
  INDEX `fk_Teachers_People1_idx` (`dni` ASC, `dniType` ASC) VISIBLE,
  PRIMARY KEY (`dni`, `dniType`),
  CONSTRAINT `fk_teacher_department`
    FOREIGN KEY (`departmentId`)
    REFERENCES `university_db`.`Departments` (`id`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION,
  CONSTRAINT `fk_Teachers_People1`
    FOREIGN KEY (`dni` , `dniType`)
    REFERENCES `university_db`.`People` (`dni` , `dniType`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION)
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `university_db`.`Subjects`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `university_db`.`Subjects` (
  `id` INT NOT NULL,
  `name` VARCHAR(45) NOT NULL,
  `departmentId` INT NOT NULL,
  PRIMARY KEY (`id`),
  INDEX `fk_subject_department1_idx` (`departmentId` ASC) VISIBLE,
  CONSTRAINT `fk_subject_department1`
    FOREIGN KEY (`departmentId`)
    REFERENCES `university_db`.`Departments` (`id`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION)
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `university_db`.`Careers`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `university_db`.`Careers` (
  `id` INT NOT NULL AUTO_INCREMENT,
  `name` VARCHAR(45) NOT NULL,
  PRIMARY KEY (`id`))
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `university_db`.`Pensums`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `university_db`.`Pensums` (
  `id` INT NOT NULL AUTO_INCREMENT,
  `name` VARCHAR(200) NOT NULL,
  `careerId` INT NOT NULL,
  `date` DATETIME NOT NULL,
  PRIMARY KEY (`id`),
  INDEX `fk_pensum_career1_idx` (`careerId` ASC) VISIBLE,
  CONSTRAINT `fk_pensum_career1`
    FOREIGN KEY (`careerId`)
    REFERENCES `university_db`.`Careers` (`id`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION)
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `university_db`.`PensumDetails`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `university_db`.`PensumDetails` (
  `id` INT NOT NULL AUTO_INCREMENT,
  `subjectId` INT NOT NULL,
  `pensum_id` INT NOT NULL,
  INDEX `fk_subject_has_pensum_subject1_idx` (`subjectId` ASC) VISIBLE,
  INDEX `fk_subject_has_pensum_pensum1_idx` (`pensum_id` ASC) VISIBLE,
  PRIMARY KEY (`id`),
  CONSTRAINT `fk_subject_has_pensum_subject1`
    FOREIGN KEY (`subjectId`)
    REFERENCES `university_db`.`Subjects` (`id`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION,
  CONSTRAINT `fk_subject_has_pensum_pensum1`
    FOREIGN KEY (`pensum_id`)
    REFERENCES `university_db`.`Pensums` (`id`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION)
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `university_db`.`Prerequisites`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `university_db`.`Prerequisites` (
  `id` INT NOT NULL AUTO_INCREMENT,
  `subjectPrerequisite` INT NOT NULL,
  `subject` INT NOT NULL,
  PRIMARY KEY (`id`),
  INDEX `fk_prerequisite_subject1_idx` (`subjectPrerequisite` ASC) VISIBLE,
  INDEX `fk_prerequisite_subject2_idx` (`subject` ASC) VISIBLE,
  CONSTRAINT `fk_prerequisite_subject1`
    FOREIGN KEY (`subjectPrerequisite`)
    REFERENCES `university_db`.`Subjects` (`id`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION,
  CONSTRAINT `fk_prerequisite_subject2`
    FOREIGN KEY (`subject`)
    REFERENCES `university_db`.`Subjects` (`id`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION)
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `university_db`.`Semesters`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `university_db`.`Semesters` (
  `id` INT NOT NULL,
  `name` VARCHAR(45) NOT NULL,
  `start_date` VARCHAR(45) NOT NULL,
  `end_date` VARCHAR(45) NOT NULL,
  PRIMARY KEY (`id`))
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `university_db`.`group`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `university_db`.`group` (
  `id` INT NOT NULL,
  `subjectId` INT NOT NULL,
  `limit` INT NOT NULL,
  `semesterId` INT NOT NULL,
  `TeachersDni` INT NOT NULL,
  `TeachersDniType` INT NOT NULL,
  PRIMARY KEY (`id`),
  INDEX `fk_teacher_has_subject_subject1_idx` (`subjectId` ASC) VISIBLE,
  INDEX `fk_group_semester1_idx` (`semesterId` ASC) VISIBLE,
  INDEX `fk_group_Teachers1_idx` (`TeachersDni` ASC, `TeachersDniType` ASC) VISIBLE,
  CONSTRAINT `fk_teacher_has_subject_subject1`
    FOREIGN KEY (`subjectId`)
    REFERENCES `university_db`.`Subjects` (`id`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION,
  CONSTRAINT `fk_group_semester1`
    FOREIGN KEY (`semesterId`)
    REFERENCES `university_db`.`Semesters` (`id`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION,
  CONSTRAINT `fk_group_Teachers1`
    FOREIGN KEY (`TeachersDni` , `TeachersDniType`)
    REFERENCES `university_db`.`Teachers` (`dni` , `dniType`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION)
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `university_db`.`schedule`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `university_db`.`schedule` (
  `id` INT NOT NULL,
  `groupId` INT NOT NULL,
  `timeType` INT NOT NULL,
  `classroomType` INT NOT NULL,
  `dayType` INT NOT NULL,
  PRIMARY KEY (`id`),
  INDEX `fk_schedule_group1_idx` (`groupId` ASC) VISIBLE,
  INDEX `fk_schedule_type_detail1_idx` (`timeType` ASC) VISIBLE,
  INDEX `fk_schedule_type_detail2_idx` (`classroomType` ASC) VISIBLE,
  INDEX `fk_schedule_type_detail3_idx` (`dayType` ASC) VISIBLE,
  CONSTRAINT `fk_schedule_group1`
    FOREIGN KEY (`groupId`)
    REFERENCES `university_db`.`group` (`id`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION,
  CONSTRAINT `fk_schedule_type_detail1`
    FOREIGN KEY (`timeType`)
    REFERENCES `university_db`.`type_detail` (`id`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION,
  CONSTRAINT `fk_schedule_type_detail2`
    FOREIGN KEY (`classroomType`)
    REFERENCES `university_db`.`type_detail` (`id`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION,
  CONSTRAINT `fk_schedule_type_detail3`
    FOREIGN KEY (`dayType`)
    REFERENCES `university_db`.`type_detail` (`id`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION)
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `university_db`.`StudentDetails`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `university_db`.`StudentDetails` (
  `Students_dni` INT NOT NULL,
  `Students_dniType` INT NOT NULL,
  `Careers_id` INT NOT NULL,
  PRIMARY KEY (`Students_dni`, `Students_dniType`, `Careers_id`),
  INDEX `fk_Students_has_Careers_Careers1_idx` (`Careers_id` ASC) VISIBLE,
  INDEX `fk_Students_has_Careers_Students1_idx` (`Students_dni` ASC, `Students_dniType` ASC) VISIBLE,
  CONSTRAINT `fk_Students_has_Careers_Students1`
    FOREIGN KEY (`Students_dni` , `Students_dniType`)
    REFERENCES `university_db`.`Students` (`dni` , `dniType`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION,
  CONSTRAINT `fk_Students_has_Careers_Careers1`
    FOREIGN KEY (`Careers_id`)
    REFERENCES `university_db`.`Careers` (`id`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION)
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `university_db`.`Enrollments`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `university_db`.`Enrollments` (
  `StudentDetails_Students_dni` INT NOT NULL,
  `StudentDetails_Students_dniType` INT NOT NULL,
  `StudentDetails_Careers_id` INT NOT NULL,
  `semester_id` INT NOT NULL,
  PRIMARY KEY (`StudentDetails_Students_dni`, `StudentDetails_Students_dniType`, `StudentDetails_Careers_id`, `semester_id`),
  INDEX `fk_StudentDetails_has_semester_semester1_idx` (`semester_id` ASC) VISIBLE,
  INDEX `fk_StudentDetails_has_semester_StudentDetails1_idx` (`StudentDetails_Students_dni` ASC, `StudentDetails_Students_dniType` ASC, `StudentDetails_Careers_id` ASC) VISIBLE,
  CONSTRAINT `fk_StudentDetails_has_semester_StudentDetails1`
    FOREIGN KEY (`StudentDetails_Students_dni` , `StudentDetails_Students_dniType` , `StudentDetails_Careers_id`)
    REFERENCES `university_db`.`StudentDetails` (`Students_dni` , `Students_dniType` , `Careers_id`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION,
  CONSTRAINT `fk_StudentDetails_has_semester_semester1`
    FOREIGN KEY (`semester_id`)
    REFERENCES `university_db`.`Semesters` (`id`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION)
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `university_db`.`Grades`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `university_db`.`Grades` (
  `StudentDetails_Students_dni` INT NOT NULL,
  `StudentDetails_Students_dniType` INT NOT NULL,
  `StudentDetails_Careers_id` INT NOT NULL,
  `group_id` INT NOT NULL,
  `grade` INT NOT NULL,
  PRIMARY KEY (`StudentDetails_Students_dni`, `StudentDetails_Students_dniType`, `StudentDetails_Careers_id`, `group_id`),
  INDEX `fk_StudentDetails_has_group_group1_idx` (`group_id` ASC) VISIBLE,
  INDEX `fk_StudentDetails_has_group_StudentDetails1_idx` (`StudentDetails_Students_dni` ASC, `StudentDetails_Students_dniType` ASC, `StudentDetails_Careers_id` ASC) VISIBLE,
  CONSTRAINT `fk_StudentDetails_has_group_StudentDetails1`
    FOREIGN KEY (`StudentDetails_Students_dni` , `StudentDetails_Students_dniType` , `StudentDetails_Careers_id`)
    REFERENCES `university_db`.`StudentDetails` (`Students_dni` , `Students_dniType` , `Careers_id`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION,
  CONSTRAINT `fk_StudentDetails_has_group_group1`
    FOREIGN KEY (`group_id`)
    REFERENCES `university_db`.`group` (`id`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION)
ENGINE = InnoDB;


SET SQL_MODE=@OLD_SQL_MODE;
SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS;
SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS;

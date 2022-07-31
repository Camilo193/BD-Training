-- MySQL Workbench Forward Engineering

SET @OLD_UNIQUE_CHECKS=@@UNIQUE_CHECKS, UNIQUE_CHECKS=0;
SET @OLD_FOREIGN_KEY_CHECKS=@@FOREIGN_KEY_CHECKS, FOREIGN_KEY_CHECKS=0;
SET @OLD_SQL_MODE=@@SQL_MODE, SQL_MODE='ONLY_FULL_GROUP_BY,STRICT_TRANS_TABLES,NO_ZERO_IN_DATE,NO_ZERO_DATE,ERROR_FOR_DIVISION_BY_ZERO,NO_ENGINE_SUBSTITUTION';

-- -----------------------------------------------------
-- Schema universidad
-- -----------------------------------------------------
DROP SCHEMA IF EXISTS `universidad` ;

-- -----------------------------------------------------
-- Schema universidad
-- -----------------------------------------------------
CREATE SCHEMA IF NOT EXISTS `universidad` DEFAULT CHARACTER SET utf8 ;
-- -----------------------------------------------------
-- Schema universidad
-- -----------------------------------------------------
USE `universidad` ;

-- -----------------------------------------------------
-- Table `universidad`.`Alumnos`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `universidad`.`Alumnos` (
  `Cedula` VARCHAR(12) NOT NULL,
  `Nombres` VARCHAR(45) NOT NULL,
  `Apellidos` VARCHAR(45) NOT NULL,
  `Celular` VARCHAR(45) NULL,
  PRIMARY KEY (`Cedula`))
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `universidad`.`Materias`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `universidad`.`Materias` (
  `Codigo` VARCHAR(5) NOT NULL,
  `Nombre` VARCHAR(45) NOT NULL,
  `Creditos` INT NOT NULL,
  `Contenido` VARCHAR(45) NULL,
  PRIMARY KEY (`Codigo`))
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `universidad`.`Carreras`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `universidad`.`Carreras` (
  `Codigo` VARCHAR(8) NOT NULL,
  `Nombre` VARCHAR(45) NOT NULL,
  PRIMARY KEY (`Codigo`))
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `universidad`.`Grupos`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `universidad`.`Grupos` (
  `Codigo` INT NOT NULL AUTO_INCREMENT,
  `Materia` VARCHAR(5) NOT NULL,
  PRIMARY KEY (`Codigo`, `Materia`),
  CONSTRAINT `fk_Horarios_Materias1`
    FOREIGN KEY (`Materia`)
    REFERENCES `universidad`.`Materias` (`Codigo`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION)
ENGINE = InnoDB;

CREATE INDEX `fk_Horarios_Materias1_idx` ON `universidad`.`Grupos` (`Materia` ASC) VISIBLE;


-- -----------------------------------------------------
-- Table `universidad`.`Casilleros`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `universidad`.`Casilleros` (
  `Numero` VARCHAR(5) NOT NULL,
  `Dueño` VARCHAR(12) NOT NULL,
  PRIMARY KEY (`Numero`),
  CONSTRAINT `fk_Casilleros_Alumnos1`
    FOREIGN KEY (`Dueño`)
    REFERENCES `universidad`.`Alumnos` (`Cedula`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION)
ENGINE = InnoDB;

CREATE INDEX `fk_Casilleros_Alumnos1_idx` ON `universidad`.`Casilleros` (`Dueño` ASC) VISIBLE;


-- -----------------------------------------------------
-- Table `universidad`.`Pensums`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `universidad`.`Pensums` (
  `Codigo` VARCHAR(45) NOT NULL,
  `Carrera` VARCHAR(8) NOT NULL,
  `Materia` VARCHAR(5) NOT NULL,
  PRIMARY KEY (`Codigo`, `Carrera`, `Materia`),
  CONSTRAINT `fk_Materias_has_Carreras_Materias1`
    FOREIGN KEY (`Materia`)
    REFERENCES `universidad`.`Materias` (`Codigo`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION,
  CONSTRAINT `fk_Pensum_Carreras1`
    FOREIGN KEY (`Carrera`)
    REFERENCES `universidad`.`Carreras` (`Codigo`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION)
ENGINE = InnoDB;

CREATE INDEX `fk_Materias_has_Carreras_Materias1_idx` ON `universidad`.`Pensums` (`Materia` ASC) VISIBLE;

CREATE INDEX `fk_Pensum_Carreras1_idx` ON `universidad`.`Pensums` (`Carrera` ASC) VISIBLE;


-- -----------------------------------------------------
-- Table `universidad`.`Matriculas`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `universidad`.`Matriculas` (
  `Carrera` VARCHAR(8) NOT NULL,
  `Alumno` VARCHAR(12) NOT NULL,
  `FechaInicio` DATE NOT NULL,
  PRIMARY KEY (`Carrera`, `Alumno`),
  CONSTRAINT `fk_Carreras_has_Alumnos_Carreras1`
    FOREIGN KEY (`Carrera`)
    REFERENCES `universidad`.`Carreras` (`Codigo`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION,
  CONSTRAINT `fk_Carreras_has_Alumnos_Alumnos1`
    FOREIGN KEY (`Alumno`)
    REFERENCES `universidad`.`Alumnos` (`Cedula`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION)
ENGINE = InnoDB;

CREATE INDEX `fk_Carreras_has_Alumnos_Alumnos1_idx` ON `universidad`.`Matriculas` (`Alumno` ASC) VISIBLE;

CREATE INDEX `fk_Carreras_has_Alumnos_Carreras1_idx` ON `universidad`.`Matriculas` (`Carrera` ASC) VISIBLE;


-- -----------------------------------------------------
-- Table `universidad`.`Horarios`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `universidad`.`Horarios` (
  `Codigo` VARCHAR(3) NOT NULL,
  `Grupo` INT NOT NULL,
  `Dia` VARCHAR(7) NOT NULL,
  `HoraInicial` TIME NOT NULL,
  `HoraFinal` TIME NOT NULL,
  `Bloque` VARCHAR(2) NOT NULL,
  `Salon` VARCHAR(3) NOT NULL,
  PRIMARY KEY (`Codigo`, `Grupo`),
  CONSTRAINT `fk_Horario_Grupos1`
    FOREIGN KEY (`Grupo`)
    REFERENCES `universidad`.`Grupos` (`Codigo`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION)
ENGINE = InnoDB;

CREATE INDEX `fk_Horario_Grupos1_idx` ON `universidad`.`Horarios` (`Grupo` ASC) VISIBLE;


-- -----------------------------------------------------
-- Table `universidad`.`Semestres`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `universidad`.`Semestres` (
  `Periodo` VARCHAR(7) NOT NULL,
  `Grupo` INT NOT NULL,
  `Alumno` VARCHAR(12) NOT NULL,
  PRIMARY KEY (`Periodo`, `Grupo`, `Alumno`),
  CONSTRAINT `fk_Grupos_has_Alumnos_Grupos1`
    FOREIGN KEY (`Grupo`)
    REFERENCES `universidad`.`Grupos` (`Codigo`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION,
  CONSTRAINT `fk_Grupos_has_Alumnos_Alumnos1`
    FOREIGN KEY (`Alumno`)
    REFERENCES `universidad`.`Alumnos` (`Cedula`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION)
ENGINE = InnoDB;

CREATE INDEX `fk_Grupos_has_Alumnos_Alumnos1_idx` ON `universidad`.`Semestres` (`Alumno` ASC) VISIBLE;

CREATE INDEX `fk_Grupos_has_Alumnos_Grupos1_idx` ON `universidad`.`Semestres` (`Grupo` ASC) VISIBLE;


SET SQL_MODE=@OLD_SQL_MODE;
SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS;
SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS;
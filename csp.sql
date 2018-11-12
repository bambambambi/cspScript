-- MySQL Script generated by MySQL Workbench
-- Mon Nov 12 13:52:17 2018
-- Model: New Model    Version: 1.0
-- MySQL Workbench Forward Engineering

SET @OLD_UNIQUE_CHECKS=@@UNIQUE_CHECKS, UNIQUE_CHECKS=0;
SET @OLD_FOREIGN_KEY_CHECKS=@@FOREIGN_KEY_CHECKS, FOREIGN_KEY_CHECKS=0;
SET @OLD_SQL_MODE=@@SQL_MODE, SQL_MODE='ONLY_FULL_GROUP_BY,STRICT_TRANS_TABLES,NO_ZERO_IN_DATE,NO_ZERO_DATE,ERROR_FOR_DIVISION_BY_ZERO,NO_ENGINE_SUBSTITUTION';

-- -----------------------------------------------------
-- Schema mydb
-- -----------------------------------------------------

-- -----------------------------------------------------
-- Schema mydb
-- -----------------------------------------------------
CREATE SCHEMA IF NOT EXISTS `mydb` DEFAULT CHARACTER SET utf8 ;
USE `mydb` ;

-- -----------------------------------------------------
-- Table `mydb`.`Students`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `mydb`.`Students` (
  `SID` INT NOT NULL,
  `Name` VARCHAR(45) NULL,
  `Address` VARCHAR(45) NULL,
  `Age` INT NULL,
  `Phone` VARCHAR(45) NULL,
  `Email` VARCHAR(45) NULL,
  PRIMARY KEY (`SID`))
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `mydb`.`Instructors`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `mydb`.`Instructors` (
  `IID` INT NOT NULL,
  `Name` VARCHAR(45) NULL,
  `PhoneNum` VARCHAR(45) NULL,
  `OfficeNum` VARCHAR(45) NULL,
  PRIMARY KEY (`IID`))
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `mydb`.`Courses`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `mydb`.`Courses` (
  `CID` INT NOT NULL,
  `Credit` INT NULL,
  `Name` VARCHAR(45) NULL,
  `LabHrs` INT NULL,
  `LecHrs` INT NULL,
  PRIMARY KEY (`CID`))
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `mydb`.`Programs`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `mydb`.`Programs` (
  `PID` INT NOT NULL,
  `Name` VARCHAR(45) NULL,
  PRIMARY KEY (`PID`))
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `mydb`.`Have`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `mydb`.`Have` (
  `Courses_CID` INT NOT NULL,
  `Programs_PID` INT NOT NULL,
  PRIMARY KEY (`Courses_CID`, `Programs_PID`),
  INDEX `fk_Enrolled_Programs1_idx` (`Programs_PID` ASC) VISIBLE,
  CONSTRAINT `fk_Enrolled_Courses`
    FOREIGN KEY (`Courses_CID`)
    REFERENCES `mydb`.`Courses` (`CID`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION,
  CONSTRAINT `fk_Enrolled_Programs1`
    FOREIGN KEY (`Programs_PID`)
    REFERENCES `mydb`.`Programs` (`PID`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION)
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `mydb`.`Teach`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `mydb`.`Teach` (
  `Instructors_IID` INT NOT NULL,
  `Courses_CID` INT NOT NULL,
  PRIMARY KEY (`Instructors_IID`, `Courses_CID`),
  INDEX `fk_Teach_Courses1_idx` (`Courses_CID` ASC) VISIBLE,
  CONSTRAINT `fk_Teach_Instructors1`
    FOREIGN KEY (`Instructors_IID`)
    REFERENCES `mydb`.`Instructors` (`IID`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION,
  CONSTRAINT `fk_Teach_Courses1`
    FOREIGN KEY (`Courses_CID`)
    REFERENCES `mydb`.`Courses` (`CID`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION)
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `mydb`.`Take`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `mydb`.`Take` (
  `Students_SID` INT NOT NULL,
  `Courses_CID` INT NOT NULL,
  PRIMARY KEY (`Students_SID`, `Courses_CID`),
  INDEX `fk_Take_Courses1_idx` (`Courses_CID` ASC) VISIBLE,
  CONSTRAINT `fk_Take_Students1`
    FOREIGN KEY (`Students_SID`)
    REFERENCES `mydb`.`Students` (`SID`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION,
  CONSTRAINT `fk_Take_Courses1`
    FOREIGN KEY (`Courses_CID`)
    REFERENCES `mydb`.`Courses` (`CID`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION)
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `mydb`.`Enroll`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `mydb`.`Enroll` (
  `Programs_PID` INT NOT NULL,
  `Students_SID` INT NOT NULL,
  PRIMARY KEY (`Programs_PID`, `Students_SID`),
  INDEX `fk_Enroll_Students1_idx` (`Students_SID` ASC) VISIBLE,
  CONSTRAINT `fk_Enroll_Programs1`
    FOREIGN KEY (`Programs_PID`)
    REFERENCES `mydb`.`Programs` (`PID`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION,
  CONSTRAINT `fk_Enroll_Students1`
    FOREIGN KEY (`Students_SID`)
    REFERENCES `mydb`.`Students` (`SID`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION)
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `mydb`.`PreReq`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `mydb`.`PreReq` (
  `Courses_CID` INT NOT NULL,
  `Courses_CID1` INT NOT NULL,
  PRIMARY KEY (`Courses_CID`, `Courses_CID1`),
  INDEX `fk_PreReq_Courses2_idx` (`Courses_CID1` ASC) VISIBLE,
  CONSTRAINT `fk_PreReq_Courses1`
    FOREIGN KEY (`Courses_CID`)
    REFERENCES `mydb`.`Courses` (`CID`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION,
  CONSTRAINT `fk_PreReq_Courses2`
    FOREIGN KEY (`Courses_CID1`)
    REFERENCES `mydb`.`Courses` (`CID`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION)
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `mydb`.`Complete`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `mydb`.`Complete` (
  `Students_SID` INT NOT NULL,
  `Courses_CID` INT NOT NULL,
  `Instructors_IID` INT NOT NULL,
  `Mark` INT NULL,
  `Date` VARCHAR(45) NULL,
  PRIMARY KEY (`Students_SID`, `Courses_CID`, `Instructors_IID`),
  INDEX `fk_Complete_Courses1_idx` (`Courses_CID` ASC) VISIBLE,
  INDEX `fk_Complete_Instructors1_idx` (`Instructors_IID` ASC) VISIBLE,
  CONSTRAINT `fk_Complete_Students1`
    FOREIGN KEY (`Students_SID`)
    REFERENCES `mydb`.`Students` (`SID`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION,
  CONSTRAINT `fk_Complete_Courses1`
    FOREIGN KEY (`Courses_CID`)
    REFERENCES `mydb`.`Courses` (`CID`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION,
  CONSTRAINT `fk_Complete_Instructors1`
    FOREIGN KEY (`Instructors_IID`)
    REFERENCES `mydb`.`Instructors` (`IID`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION)
ENGINE = InnoDB;


SET SQL_MODE=@OLD_SQL_MODE;
SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS;
SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS;

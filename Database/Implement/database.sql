SET @OLD_UNIQUE_CHECKS=@@UNIQUE_CHECKS, UNIQUE_CHECKS=0;
SET @OLD_FOREIGN_KEY_CHECKS=@@FOREIGN_KEY_CHECKS, FOREIGN_KEY_CHECKS=0;
SET @OLD_SQL_MODE=@@SQL_MODE, SQL_MODE='TRADITIONAL,ALLOW_INVALID_DATES';

-- -----------------------------------------------------
-- Schema M_Kid
-- -----------------------------------------------------

-- -----------------------------------------------------
-- Schema M_Kid
-- -----------------------------------------------------
CREATE SCHEMA IF NOT EXISTS `M_Kid` DEFAULT CHARACTER SET utf8 ;
USE `M_Kid` ;

-- -----------------------------------------------------
-- Table `M_Kid`.`Kid`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `M_Kid`.`Kid` (
  `Kid_Name` VARCHAR(50) NOT NULL,
  `Kid_Id` INT NOT NULL AUTO_INCREMENT,
  `Kid_Email` VARCHAR(40) NOT NULL,
  `Kid_Address` VARCHAR(40) NOT NULL,
  PRIMARY KEY (`Kid_Id`),
  UNIQUE INDEX `Kid_Id_UNIQUE` (`Kid_Id` ASC),
  UNIQUE INDEX `Kid_Email_UNIQUE` (`Kid_Email` ASC))
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `M_Kid`.`Material`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `M_Kid`.`Material` (
  `Material_Name` VARCHAR(50) NOT NULL,
  `Material_ID` INT NOT NULL AUTO_INCREMENT,
  `Material_Type` VARCHAR(45) NOT NULL,
  `Course_Name` VARCHAR(45) NOT NULL,
  UNIQUE INDEX `Material_Name_UNIQUE` (`Material_Name` ASC),
  PRIMARY KEY (`Material_ID`),
  UNIQUE INDEX `Material_ID_UNIQUE` (`Material_ID` ASC))
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `M_Kid`.`Kid_has_Material`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `M_Kid`.`Kid_has_Material` (
  `Kid_Kid_Id` INT NOT NULL,
  `Material_Material_ID` INT NOT NULL,
  PRIMARY KEY (`Kid_Kid_Id`, `Material_Material_ID`),
  INDEX `fk_Kid_has_Material_Material1_idx` (`Material_Material_ID` ASC),
  INDEX `fk_Kid_has_Material_Kid_idx` (`Kid_Kid_Id` ASC),
  CONSTRAINT `fk_Kid_has_Material_Kid`
    FOREIGN KEY (`Kid_Kid_Id`)
    REFERENCES `M_Kid`.`Kid` (`Kid_Id`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION,
  CONSTRAINT `fk_Kid_has_Material_Material1`
    FOREIGN KEY (`Material_Material_ID`)
    REFERENCES `M_Kid`.`Material` (`Material_ID`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION)
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `M_Kid`.`Kid_Action`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `M_Kid`.`Kid_Action` (
  `Seen_Video` VARCHAR(50) NOT NULL,
  `Feed_Back` VARCHAR(45) NOT NULL,
  `Downloads` VARCHAR(45) NOT NULL,
  `Parent_Id` INT NOT NULL,
  PRIMARY KEY (`Parent_Id`))
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `M_Kid`.`Parent`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `M_Kid`.`Parent` (
  `Parent_Name` VARCHAR(50) NOT NULL,
  `Parent_Id` INT NOT NULL AUTO_INCREMENT,
  `Parent_Address` VARCHAR(45) NOT NULL,
  `Kid_id` INT NOT NULL,
  `Kid_Action_Parent_Id` INT NOT NULL,
  PRIMARY KEY (`Parent_Id`, `Kid_Action_Parent_Id`),
  INDEX `fk_Parent_Kid_Action1_idx` (`Kid_Action_Parent_Id` ASC),
  CONSTRAINT `fk_Parent_Kid_Action1`
    FOREIGN KEY (`Kid_Action_Parent_Id`)
    REFERENCES `M_Kid`.`Kid_Action` (`Parent_Id`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION)
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `M_Kid`.`Teacher`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `M_Kid`.`Teacher` (
  `Teacher_Name` VARCHAR(50) NOT NULL,
  `Teacher_Id` INT NOT NULL AUTO_INCREMENT,
  `Teacher_Email` VARCHAR(45) NOT NULL,
  PRIMARY KEY (`Teacher_Id`))
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `M_Kid`.`Parent_has_Material`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `M_Kid`.`Parent_has_Material` (
  `Parent_Parent_Id` INT NOT NULL,
  `Material_Material_ID` INT NOT NULL,
  PRIMARY KEY (`Parent_Parent_Id`, `Material_Material_ID`),
  INDEX `fk_Parent_has_Material_Material1_idx` (`Material_Material_ID` ASC),
  INDEX `fk_Parent_has_Material_Parent1_idx` (`Parent_Parent_Id` ASC),
  CONSTRAINT `fk_Parent_has_Material_Parent1`
    FOREIGN KEY (`Parent_Parent_Id`)
    REFERENCES `M_Kid`.`Parent` (`Parent_Id`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION,
  CONSTRAINT `fk_Parent_has_Material_Material1`
    FOREIGN KEY (`Material_Material_ID`)
    REFERENCES `M_Kid`.`Material` (`Material_ID`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION)
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `M_Kid`.`Material_has_Teacher`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `M_Kid`.`Material_has_Teacher` (
  `Material_Material_ID` INT NOT NULL,
  `Teacher_Teacher_Id` INT NOT NULL,
  PRIMARY KEY (`Material_Material_ID`, `Teacher_Teacher_Id`),
  INDEX `fk_Material_has_Teacher_Teacher1_idx` (`Teacher_Teacher_Id` ASC),
  INDEX `fk_Material_has_Teacher_Material1_idx` (`Material_Material_ID` ASC),
  CONSTRAINT `fk_Material_has_Teacher_Material1`
    FOREIGN KEY (`Material_Material_ID`)
    REFERENCES `M_Kid`.`Material` (`Material_ID`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION,
  CONSTRAINT `fk_Material_has_Teacher_Teacher1`
    FOREIGN KEY (`Teacher_Teacher_Id`)
    REFERENCES `M_Kid`.`Teacher` (`Teacher_Id`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION)
ENGINE = InnoDB;


SET SQL_MODE=@OLD_SQL_MODE;
SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS;
SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS;

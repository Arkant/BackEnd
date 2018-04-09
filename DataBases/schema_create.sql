SET @OLD_UNIQUE_CHECKS=@@UNIQUE_CHECKS, UNIQUE_CHECKS=0;
SET @OLD_FOREIGN_KEY_CHECKS=@@FOREIGN_KEY_CHECKS, FOREIGN_KEY_CHECKS=0;
SET @OLD_SQL_MODE=@@SQL_MODE, SQL_MODE='TRADITIONAL,ALLOW_INVALID_DATES';

CREATE SCHEMA IF NOT EXISTS `lab41` DEFAULT CHARACTER SET utf8 ;

CREATE TABLE IF NOT EXISTS `lab41`.`costumers` (
  `costumers_id` INT(11) NOT NULL,
  `passport_id` INT(11) NOT NULL,
  `phones_id` INT(11) NOT NULL,
  `costumer_name` VARCHAR(45) NOT NULL,
  `costumer_address` VARCHAR(45) NOT NULL,
  PRIMARY KEY (`costumers_id`),
  INDEX `passportFK_idx` (`passport_id` ASC),
  INDEX `phonesFK_idx` (`phones_id` ASC),
  CONSTRAINT `passportFK`
    FOREIGN KEY (`passport_id`)
    REFERENCES `lab41`.`passport` (`passport_id`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION,
  CONSTRAINT `phonesFK`
    FOREIGN KEY (`phones_id`)
    REFERENCES `lab41`.`phones` (`phones_id`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION)
ENGINE = InnoDB
DEFAULT CHARACTER SET = utf8;

CREATE TABLE IF NOT EXISTS `lab41`.`order_form` (
  `order_id` INT(11) NOT NULL,
  `costomers_id` INT(11) NOT NULL,
  `watches_id` INT(11) NOT NULL,
  `masters_id` INT(11) NOT NULL,
  `condition_id` INT(11) NOT NULL,
  `services_id` INT(11) NOT NULL,
  `order_date` VARCHAR(45) NOT NULL,
  PRIMARY KEY (`order_id`),
  INDEX `costumersFK_idx` (`costomers_id` ASC),
  INDEX `watchesFK_idx` (`watches_id` ASC),
  INDEX `conditionFK_idx` (`condition_id` ASC),
  INDEX `servicesFK_idx` (`services_id` ASC),
  INDEX `mastersFK_idx` (`masters_id` ASC),
  CONSTRAINT `costumersFK`
    FOREIGN KEY (`costomers_id`)
    REFERENCES `lab41`.`costumers` (`costumers_id`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION,
  CONSTRAINT `watchesFK`
    FOREIGN KEY (`watches_id`)
    REFERENCES `lab41`.`watches` (`watches_id`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION,
  CONSTRAINT `conditionFK`
    FOREIGN KEY (`condition_id`)
    REFERENCES `lab41`.`order_condition` (`condition_id`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION,
  CONSTRAINT `servicesFK`
    FOREIGN KEY (`services_id`)
    REFERENCES `lab41`.`services` (`services_id`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION,
  CONSTRAINT `mastersFK`
    FOREIGN KEY (`masters_id`)
    REFERENCES `lab41`.`masters` (`masters_id`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION)
ENGINE = InnoDB
DEFAULT CHARACTER SET = utf8;

CREATE TABLE IF NOT EXISTS `lab41`.`masters` (
  `masters_id` INT(11) NOT NULL,
  `passport_id` INT(11) NOT NULL,
  `phones_id` INT(11) NOT NULL,
  `masters_name` VARCHAR(45) NOT NULL,
  `masters_address` VARCHAR(45) NOT NULL,
  PRIMARY KEY (`masters_id`),
  INDEX `FKmasters_idx` (`passport_id` ASC),
  INDEX `FKphones_idx` (`phones_id` ASC),
  CONSTRAINT `FKmasters`
    FOREIGN KEY (`passport_id`)
    REFERENCES `lab41`.`passport` (`passport_id`)
    ON DELETE CASCADE
    ON UPDATE NO ACTION,
  CONSTRAINT `FKphones`
    FOREIGN KEY (`phones_id`)
    REFERENCES `lab41`.`phones` (`phones_id`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION)
ENGINE = InnoDB
DEFAULT CHARACTER SET = utf8;

CREATE TABLE IF NOT EXISTS `lab41`.`phones` (
  `phones_id` INT(11) NOT NULL,
  `phones_type_id` INT(11) NOT NULL,
  `phones_number` VARCHAR(45) NOT NULL,
  PRIMARY KEY (`phones_id`),
  INDEX `phonestypeFK_idx` (`phones_type_id` ASC),
  CONSTRAINT `phonestypeFK`
    FOREIGN KEY (`phones_type_id`)
    REFERENCES `lab41`.`phone_types` (`phone_types_id`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION)
ENGINE = InnoDB
DEFAULT CHARACTER SET = utf8;

CREATE TABLE IF NOT EXISTS `lab41`.`phone_types` (
  `phone_types_id` INT(11) NOT NULL,
  `phone_nametype` VARCHAR(45) NOT NULL,
  PRIMARY KEY (`phone_types_id`))
ENGINE = InnoDB
DEFAULT CHARACTER SET = utf8;

CREATE TABLE IF NOT EXISTS `lab41`.`passport` (
  `passport_id` INT(11) NOT NULL,
  `passport_series` VARCHAR(45) NOT NULL,
  `passport_number` VARCHAR(45) NOT NULL,
  `passport_address` VARCHAR(45) NOT NULL,
  `sex` VARCHAR(45) NOT NULL,
  `placeofbirth` VARCHAR(45) NOT NULL,
  PRIMARY KEY (`passport_id`))
ENGINE = InnoDB
DEFAULT CHARACTER SET = utf8;

CREATE TABLE IF NOT EXISTS `lab41`.`services` (
  `services_id` INT(11) NOT NULL,
  `services_name` VARCHAR(45) NOT NULL,
  `services_price` INT(11) NOT NULL,
  PRIMARY KEY (`services_id`))
ENGINE = InnoDB
DEFAULT CHARACTER SET = utf8;

CREATE TABLE IF NOT EXISTS `lab41`.`order_condition` (
  `condition_id` INT(11) NOT NULL,
  `condtioin_name` VARCHAR(45) NOT NULL,
  `condition_date` VARCHAR(45) NOT NULL,
  PRIMARY KEY (`condition_id`))
ENGINE = InnoDB
DEFAULT CHARACTER SET = utf8;

CREATE TABLE IF NOT EXISTS `lab41`.`functions` (
  `functions_id` INT(11) NOT NULL,
  `functions_name` VARCHAR(45) NOT NULL,
  PRIMARY KEY (`functions_id`))
ENGINE = InnoDB
DEFAULT CHARACTER SET = utf8;

CREATE TABLE IF NOT EXISTS `lab41`.`watches` (
  `watches_id` INT(11) NOT NULL,
  `producer` VARCHAR(45) NOT NULL,
  `model` VARCHAR(45) NOT NULL,
  `functions_id` INT(11) NOT NULL,
  `mechanism` VARCHAR(45) NOT NULL,
  PRIMARY KEY (`watches_id`),
  INDEX `FKfunctions_idx` (`functions_id` ASC),
  CONSTRAINT `FKfunctions`
    FOREIGN KEY (`functions_id`)
    REFERENCES `lab41`.`functions` (`functions_id`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION)
ENGINE = InnoDB
DEFAULT CHARACTER SET = utf8;


SET SQL_MODE=@OLD_SQL_MODE;
SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS;
SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS;

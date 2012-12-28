SET @OLD_UNIQUE_CHECKS=@@UNIQUE_CHECKS, UNIQUE_CHECKS=0;
SET @OLD_FOREIGN_KEY_CHECKS=@@FOREIGN_KEY_CHECKS, FOREIGN_KEY_CHECKS=0;
SET @OLD_SQL_MODE=@@SQL_MODE, SQL_MODE='TRADITIONAL,ALLOW_INVALID_DATES';

CREATE SCHEMA IF NOT EXISTS `bogicms` DEFAULT CHARACTER SET utf8 COLLATE utf8_general_ci;
USE `bogicms` ;

-- -----------------------------------------------------
-- Table `bogicms`.`cathegories`
-- -----------------------------------------------------
CREATE  TABLE IF NOT EXISTS `bogicms`.`cathegories` (
  `id` INT NOT NULL AUTO_INCREMENT ,
  `name` VARCHAR(255) NOT NULL ,
  `lft` INT NOT NULL ,
  `rgt` INT NOT NULL ,
  `level` SMALLINT NOT NULL ,
  PRIMARY KEY (`id`) ,
  UNIQUE INDEX `right_UNIQUE` (`rgt` ASC) ,
  UNIQUE INDEX `level_UNIQUE` (`level` ASC) ,
  UNIQUE INDEX `left_UNIQUE` (`lft` ASC) ,
  UNIQUE INDEX `name_UNIQUE` (`name` ASC) )
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `bogicms`.`language`
-- -----------------------------------------------------
CREATE  TABLE IF NOT EXISTS `bogicms`.`language` (
  `language_id` INT NOT NULL AUTO_INCREMENT ,
  `language_code` VARCHAR(45) NOT NULL ,
  `is_active` TINYINT NOT NULL DEFAULT 0 ,
  `is_default` TINYINT NOT NULL DEFAULT 0 ,
  PRIMARY KEY (`language_id`) )
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `bogicms`.`page`
-- -----------------------------------------------------
CREATE  TABLE IF NOT EXISTS `bogicms`.`page` (
  `page_id` INT NOT NULL AUTO_INCREMENT ,
  `page_name` VARCHAR(255) NOT NULL ,
  `language_id` INT NOT NULL ,
  `permalink` VARCHAR(255) NOT NULL ,
  `menu_id` INT NULL ,
  `url` VARCHAR(255) NULL ,
  `is_active` TINYINT NOT NULL DEFAULT 1 ,
  `is_url` TINYINT NOT NULL DEFAULT 0 ,
  PRIMARY KEY (`page_id`) ,
  INDEX `fk_menu_in_language_1_idx` (`menu_id` ASC) ,
  INDEX `language_to_mil_idx` (`language_id` ASC) ,
  UNIQUE INDEX `permalink_UNIQUE` (`permalink` ASC) ,
  CONSTRAINT `menu_id_to_page`
    FOREIGN KEY (`menu_id` )
    REFERENCES `bogicms`.`cathegories` (`id` )
    ON DELETE NO ACTION
    ON UPDATE NO ACTION,
  CONSTRAINT `language_to_page`
    FOREIGN KEY (`language_id` )
    REFERENCES `bogicms`.`language` (`language_id` )
    ON DELETE NO ACTION
    ON UPDATE NO ACTION)
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `bogicms`.`article`
-- -----------------------------------------------------
CREATE  TABLE IF NOT EXISTS `bogicms`.`article` (
  `article_id` INT NOT NULL AUTO_INCREMENT ,
  `menu_in_language_id` INT NOT NULL ,
  `article_short` TEXT NULL ,
  `article_text` TEXT NULL ,
  `article_title` VARCHAR(255) NULL ,
  `article_description` VARCHAR(255) NULL ,
  PRIMARY KEY (`article_id`) )
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `bogicms`.`article_to_page`
-- -----------------------------------------------------
CREATE  TABLE IF NOT EXISTS `bogicms`.`article_to_page` (
  `article_to_menu_id` INT NOT NULL AUTO_INCREMENT ,
  `menu_in_language_id` INT NOT NULL ,
  `article_id` INT NOT NULL ,
  `priority` INT NULL ,
  PRIMARY KEY (`article_to_menu_id`) ,
  INDEX `mil_to_article_idx` (`menu_in_language_id` ASC) ,
  INDEX `fk_article_to_menu_1_idx` (`article_id` ASC) ,
  CONSTRAINT `page_to_atp`
    FOREIGN KEY (`menu_in_language_id` )
    REFERENCES `bogicms`.`page` (`page_id` )
    ON DELETE NO ACTION
    ON UPDATE NO ACTION,
  CONSTRAINT `article_to_atp`
    FOREIGN KEY (`article_id` )
    REFERENCES `bogicms`.`article` (`article_id` )
    ON DELETE NO ACTION
    ON UPDATE NO ACTION)
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `bogicms`.`keywords`
-- -----------------------------------------------------
CREATE  TABLE IF NOT EXISTS `bogicms`.`keywords` (
  `keywords_id` INT NOT NULL AUTO_INCREMENT ,
  `keyword` VARCHAR(45) NOT NULL ,
  PRIMARY KEY (`keywords_id`) )
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `bogicms`.`keywords_to_object`
-- -----------------------------------------------------
CREATE  TABLE IF NOT EXISTS `bogicms`.`keywords_to_object` (
  `keywords_to_article_id` INT NOT NULL AUTO_INCREMENT ,
  `area_id` INT NOT NULL ,
  `object_id` INT NOT NULL ,
  `keywords_id` INT NOT NULL ,
  `priority` INT NULL ,
  PRIMARY KEY (`keywords_to_article_id`) ,
  INDEX `keywords_to_kta_idx` (`keywords_id` ASC) ,
  CONSTRAINT `keywords_to_kta`
    FOREIGN KEY (`keywords_id` )
    REFERENCES `bogicms`.`keywords` (`keywords_id` )
    ON DELETE NO ACTION
    ON UPDATE NO ACTION)
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `bogicms`.`medium`
-- -----------------------------------------------------
CREATE  TABLE IF NOT EXISTS `bogicms`.`medium` (
  `medium_id` INT NOT NULL AUTO_INCREMENT ,
  `mime_type` VARCHAR(45) NOT NULL ,
  `url` VARCHAR(255) NULL ,
  `language_id` INT NULL ,
  `name` VARCHAR(255) NULL ,
  `subtitle` VARCHAR(45) NULL ,
  PRIMARY KEY (`medium_id`) )
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `bogicms`.`media_to_object`
-- -----------------------------------------------------
CREATE  TABLE IF NOT EXISTS `bogicms`.`media_to_object` (
  `media_to_object_id` INT NOT NULL AUTO_INCREMENT ,
  `medium_id` INT NOT NULL ,
  `area_id` INT NOT NULL ,
  `object_id` INT NOT NULL ,
  PRIMARY KEY (`media_to_object_id`) ,
  INDEX `medium_to_mto_idx` (`medium_id` ASC) ,
  CONSTRAINT `medium_to_mto`
    FOREIGN KEY (`medium_id` )
    REFERENCES `bogicms`.`medium` (`medium_id` )
    ON DELETE NO ACTION
    ON UPDATE NO ACTION)
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `bogicms`.`area`
-- -----------------------------------------------------
CREATE  TABLE IF NOT EXISTS `bogicms`.`area` (
  `area_id` INT NOT NULL AUTO_INCREMENT ,
  `area_name` VARCHAR(45) NOT NULL ,
  PRIMARY KEY (`area_id`) )
ENGINE = InnoDB;



SET SQL_MODE=@OLD_SQL_MODE;
SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS;
SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS;

INSERT INTO `cathegories` (`name`, `lft`, `rgt`, `level`) VALUES ('root', 1, 2, 0);
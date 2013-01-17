SET @OLD_UNIQUE_CHECKS=@@UNIQUE_CHECKS, UNIQUE_CHECKS=0;
SET @OLD_FOREIGN_KEY_CHECKS=@@FOREIGN_KEY_CHECKS, FOREIGN_KEY_CHECKS=0;
SET @OLD_SQL_MODE=@@SQL_MODE, SQL_MODE='TRADITIONAL,ALLOW_INVALID_DATES';

CREATE SCHEMA IF NOT EXISTS `bogicms` DEFAULT CHARACTER SET utf8 COLLATE utf8_general_ci;
USE `bogicms` ;

__ _____________________________________________________
__ Table `bogicms`.`cathegories`
__ _____________________________________________________
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


__ _____________________________________________________
__ Table `bogicms`.`language`
__ _____________________________________________________
CREATE  TABLE IF NOT EXISTS `bogicms`.`language` (
  `language_id` INT NOT NULL AUTO_INCREMENT ,
  `language_code` VARCHAR(45) NOT NULL ,
  `is_active` TINYINT NOT NULL DEFAULT 0 ,
  `is_default` TINYINT NOT NULL DEFAULT 0 ,
  PRIMARY KEY (`language_id`) )
ENGINE = InnoDB;


__ _____________________________________________________
__ Table `bogicms`.`page`
__ _____________________________________________________
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


__ _____________________________________________________
__ Table `bogicms`.`article`
__ _____________________________________________________
CREATE  TABLE IF NOT EXISTS `bogicms`.`article` (
  `article_id` INT NOT NULL AUTO_INCREMENT ,
  `menu_in_language_id` INT NOT NULL ,
  `article_short` TEXT NULL ,
  `article_text` TEXT NULL ,
  `article_title` VARCHAR(255) NULL ,
  `article_description` VARCHAR(255) NULL ,
  PRIMARY KEY (`article_id`) )
ENGINE = InnoDB;


__ _____________________________________________________
__ Table `bogicms`.`article_to_page`
__ _____________________________________________________
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


__ _____________________________________________________
__ Table `bogicms`.`keywords`
__ _____________________________________________________
CREATE  TABLE IF NOT EXISTS `bogicms`.`keywords` (
  `keywords_id` INT NOT NULL AUTO_INCREMENT ,
  `keyword` VARCHAR(45) NOT NULL ,
  PRIMARY KEY (`keywords_id`) )
ENGINE = InnoDB;


__ _____________________________________________________
__ Table `bogicms`.`keywords_to_object`
__ _____________________________________________________
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


__ _____________________________________________________
__ Table `bogicms`.`medium`
__ _____________________________________________________
CREATE  TABLE IF NOT EXISTS `bogicms`.`medium` (
  `medium_id` INT NOT NULL AUTO_INCREMENT ,
  `mime_type` VARCHAR(45) NOT NULL ,
  `url` VARCHAR(255) NULL ,
  `language_id` INT NULL ,
  `name` VARCHAR(255) NULL ,
  `subtitle` VARCHAR(45) NULL ,
  PRIMARY KEY (`medium_id`) )
ENGINE = InnoDB;


__ _____________________________________________________
__ Table `bogicms`.`media_to_object`
__ _____________________________________________________
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


__ _____________________________________________________
__ Table `bogicms`.`area`
__ _____________________________________________________
CREATE  TABLE IF NOT EXISTS `bogicms`.`area` (
  `area_id` INT NOT NULL AUTO_INCREMENT ,
  `area_name` VARCHAR(45) NOT NULL ,
  PRIMARY KEY (`area_id`) )
ENGINE = InnoDB;



SET SQL_MODE=@OLD_SQL_MODE;
SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS;
SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS;

INSERT INTO `cathegories` (`name`, `lft`, `rgt`, `level`) VALUES ('root', 1, 2, 0);

INSERT INTO `language` (`language_id`,`language_code`,`is_active`,`is_default`) VALUES (null,'af_ZA',0,0);
INSERT INTO `language` (`language_id`,`language_code`,`is_active`,`is_default`) VALUES (null,'am_ET',0,0);
INSERT INTO `language` (`language_id`,`language_code`,`is_active`,`is_default`) VALUES (null,'ar_AE',0,0);
INSERT INTO `language` (`language_id`,`language_code`,`is_active`,`is_default`) VALUES (null,'ar_BH',0,0);
INSERT INTO `language` (`language_id`,`language_code`,`is_active`,`is_default`) VALUES (null,'ar_DZ',0,0);
INSERT INTO `language` (`language_id`,`language_code`,`is_active`,`is_default`) VALUES (null,'ar_EG',0,0);
INSERT INTO `language` (`language_id`,`language_code`,`is_active`,`is_default`) VALUES (null,'ar_IQ',0,0);
INSERT INTO `language` (`language_id`,`language_code`,`is_active`,`is_default`) VALUES (null,'ar_JO',0,0);
INSERT INTO `language` (`language_id`,`language_code`,`is_active`,`is_default`) VALUES (null,'ar_KW',0,0);
INSERT INTO `language` (`language_id`,`language_code`,`is_active`,`is_default`) VALUES (null,'ar_LB',0,0);
INSERT INTO `language` (`language_id`,`language_code`,`is_active`,`is_default`) VALUES (null,'ar_LY',0,0);
INSERT INTO `language` (`language_id`,`language_code`,`is_active`,`is_default`) VALUES (null,'ar_MA',0,0);
INSERT INTO `language` (`language_id`,`language_code`,`is_active`,`is_default`) VALUES (null,'arn_CL',0,0);
INSERT INTO `language` (`language_id`,`language_code`,`is_active`,`is_default`) VALUES (null,'ar_OM',0,0);
INSERT INTO `language` (`language_id`,`language_code`,`is_active`,`is_default`) VALUES (null,'ar_QA',0,0);
INSERT INTO `language` (`language_id`,`language_code`,`is_active`,`is_default`) VALUES (null,'ar_SA',0,0);
INSERT INTO `language` (`language_id`,`language_code`,`is_active`,`is_default`) VALUES (null,'ar_SY',0,0);
INSERT INTO `language` (`language_id`,`language_code`,`is_active`,`is_default`) VALUES (null,'ar_TN',0,0);
INSERT INTO `language` (`language_id`,`language_code`,`is_active`,`is_default`) VALUES (null,'ar_YE',0,0);
INSERT INTO `language` (`language_id`,`language_code`,`is_active`,`is_default`) VALUES (null,'as_IN',0,0);
INSERT INTO `language` (`language_id`,`language_code`,`is_active`,`is_default`) VALUES (null,'az_Cyrl_AZ',0,0);
INSERT INTO `language` (`language_id`,`language_code`,`is_active`,`is_default`) VALUES (null,'az_Latn_AZ',0,0);
INSERT INTO `language` (`language_id`,`language_code`,`is_active`,`is_default`) VALUES (null,'ba_RU',0,0);
INSERT INTO `language` (`language_id`,`language_code`,`is_active`,`is_default`) VALUES (null,'be_BY',0,0);
INSERT INTO `language` (`language_id`,`language_code`,`is_active`,`is_default`) VALUES (null,'bg_BG',0,0);
INSERT INTO `language` (`language_id`,`language_code`,`is_active`,`is_default`) VALUES (null,'bn_BD',0,0);
INSERT INTO `language` (`language_id`,`language_code`,`is_active`,`is_default`) VALUES (null,'bn_IN',0,0);
INSERT INTO `language` (`language_id`,`language_code`,`is_active`,`is_default`) VALUES (null,'bo_CN',0,0);
INSERT INTO `language` (`language_id`,`language_code`,`is_active`,`is_default`) VALUES (null,'br_FR',0,0);
INSERT INTO `language` (`language_id`,`language_code`,`is_active`,`is_default`) VALUES (null,'bs_Cyrl_BA',0,0);
INSERT INTO `language` (`language_id`,`language_code`,`is_active`,`is_default`) VALUES (null,'bs_Latn_BA',0,0);
INSERT INTO `language` (`language_id`,`language_code`,`is_active`,`is_default`) VALUES (null,'ca_ES',0,0);
INSERT INTO `language` (`language_id`,`language_code`,`is_active`,`is_default`) VALUES (null,'co_FR',0,0);
INSERT INTO `language` (`language_id`,`language_code`,`is_active`,`is_default`) VALUES (null,'cs_CZ',0,0);
INSERT INTO `language` (`language_id`,`language_code`,`is_active`,`is_default`) VALUES (null,'cy_GB',0,0);
INSERT INTO `language` (`language_id`,`language_code`,`is_active`,`is_default`) VALUES (null,'da_DK',0,0);
INSERT INTO `language` (`language_id`,`language_code`,`is_active`,`is_default`) VALUES (null,'de_AT',0,0);
INSERT INTO `language` (`language_id`,`language_code`,`is_active`,`is_default`) VALUES (null,'de_CH',0,0);
INSERT INTO `language` (`language_id`,`language_code`,`is_active`,`is_default`) VALUES (null,'de_DE',0,0);
INSERT INTO `language` (`language_id`,`language_code`,`is_active`,`is_default`) VALUES (null,'de_LI',0,0);
INSERT INTO `language` (`language_id`,`language_code`,`is_active`,`is_default`) VALUES (null,'de_LU',0,0);
INSERT INTO `language` (`language_id`,`language_code`,`is_active`,`is_default`) VALUES (null,'dsb_DE',0,0);
INSERT INTO `language` (`language_id`,`language_code`,`is_active`,`is_default`) VALUES (null,'dv_MV',0,0);
INSERT INTO `language` (`language_id`,`language_code`,`is_active`,`is_default`) VALUES (null,'el_GR',0,0);
INSERT INTO `language` (`language_id`,`language_code`,`is_active`,`is_default`) VALUES (null,'en_029',0,0);
INSERT INTO `language` (`language_id`,`language_code`,`is_active`,`is_default`) VALUES (null,'en_AU',0,0);
INSERT INTO `language` (`language_id`,`language_code`,`is_active`,`is_default`) VALUES (null,'en_BZ',0,0);
INSERT INTO `language` (`language_id`,`language_code`,`is_active`,`is_default`) VALUES (null,'en_CA',0,0);
INSERT INTO `language` (`language_id`,`language_code`,`is_active`,`is_default`) VALUES (null,'en_GB',1,1);
INSERT INTO `language` (`language_id`,`language_code`,`is_active`,`is_default`) VALUES (null,'en_IE',0,0);
INSERT INTO `language` (`language_id`,`language_code`,`is_active`,`is_default`) VALUES (null,'en_IN',0,0);
INSERT INTO `language` (`language_id`,`language_code`,`is_active`,`is_default`) VALUES (null,'en_JM',0,0);
INSERT INTO `language` (`language_id`,`language_code`,`is_active`,`is_default`) VALUES (null,'en_MY',0,0);
INSERT INTO `language` (`language_id`,`language_code`,`is_active`,`is_default`) VALUES (null,'en_NZ',0,0);
INSERT INTO `language` (`language_id`,`language_code`,`is_active`,`is_default`) VALUES (null,'en_PH',0,0);
INSERT INTO `language` (`language_id`,`language_code`,`is_active`,`is_default`) VALUES (null,'en_SG',0,0);
INSERT INTO `language` (`language_id`,`language_code`,`is_active`,`is_default`) VALUES (null,'en_TT',0,0);
INSERT INTO `language` (`language_id`,`language_code`,`is_active`,`is_default`) VALUES (null,'en_US',0,0);
INSERT INTO `language` (`language_id`,`language_code`,`is_active`,`is_default`) VALUES (null,'en_ZA',0,0);
INSERT INTO `language` (`language_id`,`language_code`,`is_active`,`is_default`) VALUES (null,'en_ZW',0,0);
INSERT INTO `language` (`language_id`,`language_code`,`is_active`,`is_default`) VALUES (null,'es_AR',0,0);
INSERT INTO `language` (`language_id`,`language_code`,`is_active`,`is_default`) VALUES (null,'es_BO',0,0);
INSERT INTO `language` (`language_id`,`language_code`,`is_active`,`is_default`) VALUES (null,'es_CL',0,0);
INSERT INTO `language` (`language_id`,`language_code`,`is_active`,`is_default`) VALUES (null,'es_CO',0,0);
INSERT INTO `language` (`language_id`,`language_code`,`is_active`,`is_default`) VALUES (null,'es_CR',0,0);
INSERT INTO `language` (`language_id`,`language_code`,`is_active`,`is_default`) VALUES (null,'es_DO',0,0);
INSERT INTO `language` (`language_id`,`language_code`,`is_active`,`is_default`) VALUES (null,'es_EC',0,0);
INSERT INTO `language` (`language_id`,`language_code`,`is_active`,`is_default`) VALUES (null,'es_ES',0,0);
INSERT INTO `language` (`language_id`,`language_code`,`is_active`,`is_default`) VALUES (null,'es_GT',0,0);
INSERT INTO `language` (`language_id`,`language_code`,`is_active`,`is_default`) VALUES (null,'es_HN',0,0);
INSERT INTO `language` (`language_id`,`language_code`,`is_active`,`is_default`) VALUES (null,'es_MX',0,0);
INSERT INTO `language` (`language_id`,`language_code`,`is_active`,`is_default`) VALUES (null,'es_NI',0,0);
INSERT INTO `language` (`language_id`,`language_code`,`is_active`,`is_default`) VALUES (null,'es_PA',0,0);
INSERT INTO `language` (`language_id`,`language_code`,`is_active`,`is_default`) VALUES (null,'es_PE',0,0);
INSERT INTO `language` (`language_id`,`language_code`,`is_active`,`is_default`) VALUES (null,'es_PR',0,0);
INSERT INTO `language` (`language_id`,`language_code`,`is_active`,`is_default`) VALUES (null,'es_PY',0,0);
INSERT INTO `language` (`language_id`,`language_code`,`is_active`,`is_default`) VALUES (null,'es_SV',0,0);
INSERT INTO `language` (`language_id`,`language_code`,`is_active`,`is_default`) VALUES (null,'es_US',0,0);
INSERT INTO `language` (`language_id`,`language_code`,`is_active`,`is_default`) VALUES (null,'es_UY',0,0);
INSERT INTO `language` (`language_id`,`language_code`,`is_active`,`is_default`) VALUES (null,'es_VE',0,0);
INSERT INTO `language` (`language_id`,`language_code`,`is_active`,`is_default`) VALUES (null,'et_EE',0,0);
INSERT INTO `language` (`language_id`,`language_code`,`is_active`,`is_default`) VALUES (null,'eu_ES',0,0);
INSERT INTO `language` (`language_id`,`language_code`,`is_active`,`is_default`) VALUES (null,'fa_IR',0,0);
INSERT INTO `language` (`language_id`,`language_code`,`is_active`,`is_default`) VALUES (null,'fi_FI',0,0);
INSERT INTO `language` (`language_id`,`language_code`,`is_active`,`is_default`) VALUES (null,'fil_PH',0,0);
INSERT INTO `language` (`language_id`,`language_code`,`is_active`,`is_default`) VALUES (null,'fo_FO',0,0);
INSERT INTO `language` (`language_id`,`language_code`,`is_active`,`is_default`) VALUES (null,'fr_BE',0,0);
INSERT INTO `language` (`language_id`,`language_code`,`is_active`,`is_default`) VALUES (null,'fr_CA',0,0);
INSERT INTO `language` (`language_id`,`language_code`,`is_active`,`is_default`) VALUES (null,'fr_CH',0,0);
INSERT INTO `language` (`language_id`,`language_code`,`is_active`,`is_default`) VALUES (null,'fr_FR',0,0);
INSERT INTO `language` (`language_id`,`language_code`,`is_active`,`is_default`) VALUES (null,'fr_LU',0,0);
INSERT INTO `language` (`language_id`,`language_code`,`is_active`,`is_default`) VALUES (null,'fr_MC',0,0);
INSERT INTO `language` (`language_id`,`language_code`,`is_active`,`is_default`) VALUES (null,'fy_NL',0,0);
INSERT INTO `language` (`language_id`,`language_code`,`is_active`,`is_default`) VALUES (null,'ga_IE',0,0);
INSERT INTO `language` (`language_id`,`language_code`,`is_active`,`is_default`) VALUES (null,'gd_GB',0,0);
INSERT INTO `language` (`language_id`,`language_code`,`is_active`,`is_default`) VALUES (null,'gl_ES',0,0);
INSERT INTO `language` (`language_id`,`language_code`,`is_active`,`is_default`) VALUES (null,'gsw_FR',0,0);
INSERT INTO `language` (`language_id`,`language_code`,`is_active`,`is_default`) VALUES (null,'gu_IN',0,0);
INSERT INTO `language` (`language_id`,`language_code`,`is_active`,`is_default`) VALUES (null,'ha_Latn_NG',0,0);
INSERT INTO `language` (`language_id`,`language_code`,`is_active`,`is_default`) VALUES (null,'he_IL',0,0);
INSERT INTO `language` (`language_id`,`language_code`,`is_active`,`is_default`) VALUES (null,'hi_IN',0,0);
INSERT INTO `language` (`language_id`,`language_code`,`is_active`,`is_default`) VALUES (null,'hr_BA',0,0);
INSERT INTO `language` (`language_id`,`language_code`,`is_active`,`is_default`) VALUES (null,'hr_HR',0,0);
INSERT INTO `language` (`language_id`,`language_code`,`is_active`,`is_default`) VALUES (null,'hsb_DE',0,0);
INSERT INTO `language` (`language_id`,`language_code`,`is_active`,`is_default`) VALUES (null,'hu_HU',0,0);
INSERT INTO `language` (`language_id`,`language_code`,`is_active`,`is_default`) VALUES (null,'hy_AM',0,0);
INSERT INTO `language` (`language_id`,`language_code`,`is_active`,`is_default`) VALUES (null,'id_ID',0,0);
INSERT INTO `language` (`language_id`,`language_code`,`is_active`,`is_default`) VALUES (null,'ig_NG',0,0);
INSERT INTO `language` (`language_id`,`language_code`,`is_active`,`is_default`) VALUES (null,'ii_CN',0,0);
INSERT INTO `language` (`language_id`,`language_code`,`is_active`,`is_default`) VALUES (null,'is_IS',0,0);
INSERT INTO `language` (`language_id`,`language_code`,`is_active`,`is_default`) VALUES (null,'it_CH',0,0);
INSERT INTO `language` (`language_id`,`language_code`,`is_active`,`is_default`) VALUES (null,'it_IT',0,0);
INSERT INTO `language` (`language_id`,`language_code`,`is_active`,`is_default`) VALUES (null,'iu_Cans_CA',0,0);
INSERT INTO `language` (`language_id`,`language_code`,`is_active`,`is_default`) VALUES (null,'iu_Latn_CA',0,0);
INSERT INTO `language` (`language_id`,`language_code`,`is_active`,`is_default`) VALUES (null,'ja_JP',0,0);
INSERT INTO `language` (`language_id`,`language_code`,`is_active`,`is_default`) VALUES (null,'ka_GE',0,0);
INSERT INTO `language` (`language_id`,`language_code`,`is_active`,`is_default`) VALUES (null,'kk_KZ',0,0);
INSERT INTO `language` (`language_id`,`language_code`,`is_active`,`is_default`) VALUES (null,'kl_GL',0,0);
INSERT INTO `language` (`language_id`,`language_code`,`is_active`,`is_default`) VALUES (null,'km_KH',0,0);
INSERT INTO `language` (`language_id`,`language_code`,`is_active`,`is_default`) VALUES (null,'kn_IN',0,0);
INSERT INTO `language` (`language_id`,`language_code`,`is_active`,`is_default`) VALUES (null,'kok_IN',0,0);
INSERT INTO `language` (`language_id`,`language_code`,`is_active`,`is_default`) VALUES (null,'ko_KR',0,0);
INSERT INTO `language` (`language_id`,`language_code`,`is_active`,`is_default`) VALUES (null,'ky_KG',0,0);
INSERT INTO `language` (`language_id`,`language_code`,`is_active`,`is_default`) VALUES (null,'lb_LU',0,0);
INSERT INTO `language` (`language_id`,`language_code`,`is_active`,`is_default`) VALUES (null,'lo_LA',0,0);
INSERT INTO `language` (`language_id`,`language_code`,`is_active`,`is_default`) VALUES (null,'lt_LT',0,0);
INSERT INTO `language` (`language_id`,`language_code`,`is_active`,`is_default`) VALUES (null,'lv_LV',0,0);
INSERT INTO `language` (`language_id`,`language_code`,`is_active`,`is_default`) VALUES (null,'mi_NZ',0,0);
INSERT INTO `language` (`language_id`,`language_code`,`is_active`,`is_default`) VALUES (null,'mk_MK',0,0);
INSERT INTO `language` (`language_id`,`language_code`,`is_active`,`is_default`) VALUES (null,'ml_IN',0,0);
INSERT INTO `language` (`language_id`,`language_code`,`is_active`,`is_default`) VALUES (null,'mn_MN',0,0);
INSERT INTO `language` (`language_id`,`language_code`,`is_active`,`is_default`) VALUES (null,'mn_Mong_CN',0,0);
INSERT INTO `language` (`language_id`,`language_code`,`is_active`,`is_default`) VALUES (null,'moh_CA',0,0);
INSERT INTO `language` (`language_id`,`language_code`,`is_active`,`is_default`) VALUES (null,'mr_IN',0,0);
INSERT INTO `language` (`language_id`,`language_code`,`is_active`,`is_default`) VALUES (null,'ms_BN',0,0);
INSERT INTO `language` (`language_id`,`language_code`,`is_active`,`is_default`) VALUES (null,'ms_MY',0,0);
INSERT INTO `language` (`language_id`,`language_code`,`is_active`,`is_default`) VALUES (null,'mt_MT',0,0);
INSERT INTO `language` (`language_id`,`language_code`,`is_active`,`is_default`) VALUES (null,'nb_NO',0,0);
INSERT INTO `language` (`language_id`,`language_code`,`is_active`,`is_default`) VALUES (null,'ne_NP',0,0);
INSERT INTO `language` (`language_id`,`language_code`,`is_active`,`is_default`) VALUES (null,'nl_BE',0,0);
INSERT INTO `language` (`language_id`,`language_code`,`is_active`,`is_default`) VALUES (null,'nl_NL',0,0);
INSERT INTO `language` (`language_id`,`language_code`,`is_active`,`is_default`) VALUES (null,'nn_NO',0,0);
INSERT INTO `language` (`language_id`,`language_code`,`is_active`,`is_default`) VALUES (null,'nso_ZA',0,0);
INSERT INTO `language` (`language_id`,`language_code`,`is_active`,`is_default`) VALUES (null,'oc_FR',0,0);
INSERT INTO `language` (`language_id`,`language_code`,`is_active`,`is_default`) VALUES (null,'or_IN',0,0);
INSERT INTO `language` (`language_id`,`language_code`,`is_active`,`is_default`) VALUES (null,'pa_IN',0,0);
INSERT INTO `language` (`language_id`,`language_code`,`is_active`,`is_default`) VALUES (null,'pl_PL',0,0);
INSERT INTO `language` (`language_id`,`language_code`,`is_active`,`is_default`) VALUES (null,'prs_AF',0,0);
INSERT INTO `language` (`language_id`,`language_code`,`is_active`,`is_default`) VALUES (null,'ps_AF',0,0);
INSERT INTO `language` (`language_id`,`language_code`,`is_active`,`is_default`) VALUES (null,'pt_BR',0,0);
INSERT INTO `language` (`language_id`,`language_code`,`is_active`,`is_default`) VALUES (null,'pt_PT',0,0);
INSERT INTO `language` (`language_id`,`language_code`,`is_active`,`is_default`) VALUES (null,'qut_GT',0,0);
INSERT INTO `language` (`language_id`,`language_code`,`is_active`,`is_default`) VALUES (null,'quz_BO',0,0);
INSERT INTO `language` (`language_id`,`language_code`,`is_active`,`is_default`) VALUES (null,'quz_EC',0,0);
INSERT INTO `language` (`language_id`,`language_code`,`is_active`,`is_default`) VALUES (null,'quz_PE',0,0);
INSERT INTO `language` (`language_id`,`language_code`,`is_active`,`is_default`) VALUES (null,'rm_CH',0,0);
INSERT INTO `language` (`language_id`,`language_code`,`is_active`,`is_default`) VALUES (null,'ro_RO',0,0);
INSERT INTO `language` (`language_id`,`language_code`,`is_active`,`is_default`) VALUES (null,'ru_RU',0,0);
INSERT INTO `language` (`language_id`,`language_code`,`is_active`,`is_default`) VALUES (null,'rw_RW',0,0);
INSERT INTO `language` (`language_id`,`language_code`,`is_active`,`is_default`) VALUES (null,'sah_RU',0,0);
INSERT INTO `language` (`language_id`,`language_code`,`is_active`,`is_default`) VALUES (null,'sa_IN',0,0);
INSERT INTO `language` (`language_id`,`language_code`,`is_active`,`is_default`) VALUES (null,'se_FI',0,0);
INSERT INTO `language` (`language_id`,`language_code`,`is_active`,`is_default`) VALUES (null,'se_NO',0,0);
INSERT INTO `language` (`language_id`,`language_code`,`is_active`,`is_default`) VALUES (null,'se_SE',0,0);
INSERT INTO `language` (`language_id`,`language_code`,`is_active`,`is_default`) VALUES (null,'si_LK',0,0);
INSERT INTO `language` (`language_id`,`language_code`,`is_active`,`is_default`) VALUES (null,'sk_SK',0,0);
INSERT INTO `language` (`language_id`,`language_code`,`is_active`,`is_default`) VALUES (null,'sl_SI',0,0);
INSERT INTO `language` (`language_id`,`language_code`,`is_active`,`is_default`) VALUES (null,'sma_NO',0,0);
INSERT INTO `language` (`language_id`,`language_code`,`is_active`,`is_default`) VALUES (null,'sma_SE',0,0);
INSERT INTO `language` (`language_id`,`language_code`,`is_active`,`is_default`) VALUES (null,'smj_NO',0,0);
INSERT INTO `language` (`language_id`,`language_code`,`is_active`,`is_default`) VALUES (null,'smj_SE',0,0);
INSERT INTO `language` (`language_id`,`language_code`,`is_active`,`is_default`) VALUES (null,'smn_FI',0,0);
INSERT INTO `language` (`language_id`,`language_code`,`is_active`,`is_default`) VALUES (null,'sms_FI',0,0);
INSERT INTO `language` (`language_id`,`language_code`,`is_active`,`is_default`) VALUES (null,'sq_AL',0,0);
INSERT INTO `language` (`language_id`,`language_code`,`is_active`,`is_default`) VALUES (null,'sr_Cyrl_BA',0,0);
INSERT INTO `language` (`language_id`,`language_code`,`is_active`,`is_default`) VALUES (null,'sr_Cyrl_CS',0,0);
INSERT INTO `language` (`language_id`,`language_code`,`is_active`,`is_default`) VALUES (null,'sr_Cyrl_ME',0,0);
INSERT INTO `language` (`language_id`,`language_code`,`is_active`,`is_default`) VALUES (null,'sr_Cyrl_RS',0,0);
INSERT INTO `language` (`language_id`,`language_code`,`is_active`,`is_default`) VALUES (null,'sr_Latn_BA',0,0);
INSERT INTO `language` (`language_id`,`language_code`,`is_active`,`is_default`) VALUES (null,'sr_Latn_CS',0,0);
INSERT INTO `language` (`language_id`,`language_code`,`is_active`,`is_default`) VALUES (null,'sr_Latn_ME',0,0);
INSERT INTO `language` (`language_id`,`language_code`,`is_active`,`is_default`) VALUES (null,'sr_Latn_RS',0,0);
INSERT INTO `language` (`language_id`,`language_code`,`is_active`,`is_default`) VALUES (null,'sv_FI',0,0);
INSERT INTO `language` (`language_id`,`language_code`,`is_active`,`is_default`) VALUES (null,'sv_SE',0,0);
INSERT INTO `language` (`language_id`,`language_code`,`is_active`,`is_default`) VALUES (null,'sw_KE',0,0);
INSERT INTO `language` (`language_id`,`language_code`,`is_active`,`is_default`) VALUES (null,'syr_SY',0,0);
INSERT INTO `language` (`language_id`,`language_code`,`is_active`,`is_default`) VALUES (null,'ta_IN',0,0);
INSERT INTO `language` (`language_id`,`language_code`,`is_active`,`is_default`) VALUES (null,'te_IN',0,0);
INSERT INTO `language` (`language_id`,`language_code`,`is_active`,`is_default`) VALUES (null,'tg_Cyrl_TJ',0,0);
INSERT INTO `language` (`language_id`,`language_code`,`is_active`,`is_default`) VALUES (null,'th_TH',0,0);
INSERT INTO `language` (`language_id`,`language_code`,`is_active`,`is_default`) VALUES (null,'tk_TM',0,0);
INSERT INTO `language` (`language_id`,`language_code`,`is_active`,`is_default`) VALUES (null,'tn_ZA',0,0);
INSERT INTO `language` (`language_id`,`language_code`,`is_active`,`is_default`) VALUES (null,'tr_TR',0,0);
INSERT INTO `language` (`language_id`,`language_code`,`is_active`,`is_default`) VALUES (null,'tt_RU',0,0);
INSERT INTO `language` (`language_id`,`language_code`,`is_active`,`is_default`) VALUES (null,'tzm_Latn_DZ',0,0);
INSERT INTO `language` (`language_id`,`language_code`,`is_active`,`is_default`) VALUES (null,'ug_CN',0,0);
INSERT INTO `language` (`language_id`,`language_code`,`is_active`,`is_default`) VALUES (null,'uk_UA',0,0);
INSERT INTO `language` (`language_id`,`language_code`,`is_active`,`is_default`) VALUES (null,'ur_PK',0,0);
INSERT INTO `language` (`language_id`,`language_code`,`is_active`,`is_default`) VALUES (null,'uz_Cyrl_UZ',0,0);
INSERT INTO `language` (`language_id`,`language_code`,`is_active`,`is_default`) VALUES (null,'uz_Latn_UZ',0,0);
INSERT INTO `language` (`language_id`,`language_code`,`is_active`,`is_default`) VALUES (null,'vi_VN',0,0);
INSERT INTO `language` (`language_id`,`language_code`,`is_active`,`is_default`) VALUES (null,'wo_SN',0,0);
INSERT INTO `language` (`language_id`,`language_code`,`is_active`,`is_default`) VALUES (null,'xh_ZA',0,0);
INSERT INTO `language` (`language_id`,`language_code`,`is_active`,`is_default`) VALUES (null,'yo_NG',0,0);
INSERT INTO `language` (`language_id`,`language_code`,`is_active`,`is_default`) VALUES (null,'zh_CN',0,0);
INSERT INTO `language` (`language_id`,`language_code`,`is_active`,`is_default`) VALUES (null,'zh_HK',0,0);
INSERT INTO `language` (`language_id`,`language_code`,`is_active`,`is_default`) VALUES (null,'zh_MO',0,0);
INSERT INTO `language` (`language_id`,`language_code`,`is_active`,`is_default`) VALUES (null,'zh_SG',0,0);
INSERT INTO `language` (`language_id`,`language_code`,`is_active`,`is_default`) VALUES (null,'zh_TW',0,0);
INSERT INTO `language` (`language_id`,`language_code`,`is_active`,`is_default`) VALUES (null,'zu_ZA',0,0);

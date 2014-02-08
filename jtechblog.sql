SET @OLD_UNIQUE_CHECKS=@@UNIQUE_CHECKS, UNIQUE_CHECKS=0;
SET @OLD_FOREIGN_KEY_CHECKS=@@FOREIGN_KEY_CHECKS, FOREIGN_KEY_CHECKS=0;
SET @OLD_SQL_MODE=@@SQL_MODE, SQL_MODE='TRADITIONAL';

DROP SCHEMA IF EXISTS `jtechblog` ;
CREATE SCHEMA IF NOT EXISTS `jtechblog` DEFAULT CHARACTER SET utf8 COLLATE utf8_general_ci ;
USE `jtechblog` ;

-- -----------------------------------------------------
-- Table `jtechblog`.`sections`
-- -----------------------------------------------------
DROP TABLE IF EXISTS `jtechblog`.`sections` ;

CREATE  TABLE IF NOT EXISTS `jtechblog`.`sections` (
  `id` INT NOT NULL AUTO_INCREMENT ,
  `sections_id` INT NOT NULL ,
  `name` VARCHAR(45) NULL ,
  `url` VARCHAR(45) NULL ,
  PRIMARY KEY (`id`, `sections_id`) ,
  INDEX `fk_sections_sections` (`sections_id` ASC) ,
  CONSTRAINT `fk_sections_sections`
    FOREIGN KEY (`sections_id` )
    REFERENCES `jtechblog`.`sections` (`id` )
    ON DELETE NO ACTION
    ON UPDATE NO ACTION)
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `jtechblog`.`blogs`
-- -----------------------------------------------------
DROP TABLE IF EXISTS `jtechblog`.`blogs` ;

CREATE  TABLE IF NOT EXISTS `jtechblog`.`blogs` (
  `id` INT NOT NULL AUTO_INCREMENT ,
  `name` VARCHAR(45) NOT NULL ,
  `title` VARCHAR(255) NOT NULL ,
  `epigraph` TEXT NULL ,
  PRIMARY KEY (`id`) )
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `jtechblog`.`posts`
-- -----------------------------------------------------
DROP TABLE IF EXISTS `jtechblog`.`posts` ;

CREATE  TABLE IF NOT EXISTS `jtechblog`.`posts` (
  `id` INT NOT NULL AUTO_INCREMENT ,
  `blogs_id` INT NOT NULL ,
  `date` DATETIME NOT NULL ,
  `title` VARCHAR(255) NOT NULL ,
  `text` TEXT NOT NULL ,
  PRIMARY KEY (`id`, `blogs_id`) ,
  INDEX `fk_posts_blogs` (`blogs_id` ASC) ,
  CONSTRAINT `fk_posts_blogs1`
    FOREIGN KEY (`blogs_id` )
    REFERENCES `jtechblog`.`blogs` (`id` )
    ON DELETE NO ACTION
    ON UPDATE NO ACTION)
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `jtechblog`.`comments`
-- -----------------------------------------------------
DROP TABLE IF EXISTS `jtechblog`.`comments` ;

CREATE  TABLE IF NOT EXISTS `jtechblog`.`comments` (
  `id` INT NOT NULL ,
  `username` VARCHAR(45) NULL ,
  `posts_id` INT NOT NULL ,
  PRIMARY KEY (`id`) ,
  INDEX `fk_comments_posts` (`posts_id` ASC) ,
  CONSTRAINT `fk_comments_posts1`
    FOREIGN KEY (`posts_id` )
    REFERENCES `jtechblog`.`posts` (`id` )
    ON DELETE NO ACTION
    ON UPDATE NO ACTION)
ENGINE = InnoDB;



SET SQL_MODE=@OLD_SQL_MODE;
SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS;
SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS;

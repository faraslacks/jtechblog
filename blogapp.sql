SET @OLD_UNIQUE_CHECKS=@@UNIQUE_CHECKS, UNIQUE_CHECKS=0;
SET @OLD_FOREIGN_KEY_CHECKS=@@FOREIGN_KEY_CHECKS, FOREIGN_KEY_CHECKS=0;
SET @OLD_SQL_MODE=@@SQL_MODE, SQL_MODE='TRADITIONAL,ALLOW_INVALID_DATES';

DROP SCHEMA IF EXISTS `blogapp` ;
CREATE SCHEMA IF NOT EXISTS `blogapp` DEFAULT CHARACTER SET utf8 COLLATE utf8_general_ci ;
USE `blogapp` ;

-- -----------------------------------------------------
-- Table `blogapp`.`sections`
-- -----------------------------------------------------
DROP TABLE IF EXISTS `blogapp`.`sections` ;

CREATE  TABLE IF NOT EXISTS `blogapp`.`sections` (
  `id` INT NOT NULL AUTO_INCREMENT ,
  `sections_id` INT NOT NULL COMMENT 'Parent section id\n' ,
  `page_title` VARCHAR(255) NOT NULL ,
  `url` VARCHAR(255) NOT NULL ,
  `active` TINYINT(1) NOT NULL ,
  `view` VARCHAR(45) NOT NULL DEFAULT 'index' ,
  `language` VARCHAR(45) NOT NULL ,
  PRIMARY KEY (`id`, `sections_id`) ,
  INDEX `fk_sections_sections` (`sections_id` ASC) ,
  CONSTRAINT `fk_sections_sections`
    FOREIGN KEY (`sections_id` )
    REFERENCES `blogapp`.`sections` (`id` )
    ON DELETE CASCADE
    ON UPDATE CASCADE)
ENGINE = InnoDB
DEFAULT CHARACTER SET = utf8
COLLATE = utf8_general_ci;


-- -----------------------------------------------------
-- Table `blogapp`.`tags`
-- -----------------------------------------------------
DROP TABLE IF EXISTS `blogapp`.`tags` ;

CREATE  TABLE IF NOT EXISTS `blogapp`.`tags` (
  `id` INT NOT NULL AUTO_INCREMENT ,
  `title` VARCHAR(45) NOT NULL ,
  PRIMARY KEY (`id`) )
ENGINE = InnoDB
DEFAULT CHARACTER SET = utf8
COLLATE = utf8_general_ci;


-- -----------------------------------------------------
-- Table `blogapp`.`posts`
-- -----------------------------------------------------
DROP TABLE IF EXISTS `blogapp`.`posts` ;

CREATE  TABLE IF NOT EXISTS `blogapp`.`posts` (
  `id` INT NOT NULL AUTO_INCREMENT ,
  `text` TEXT NOT NULL ,
  `publication_date` DATETIME NOT NULL ,
  `title` VARCHAR(255) NOT NULL ,
  `sections_id` INT NOT NULL DEFAULT 1 ,
  PRIMARY KEY (`id`, `sections_id`) ,
  INDEX `fk_posts_sections1_idx` (`sections_id` ASC) ,
  CONSTRAINT `fk_posts_sections1`
    FOREIGN KEY (`sections_id` )
    REFERENCES `blogapp`.`sections` (`id` )
    ON DELETE NO ACTION
    ON UPDATE NO ACTION)
ENGINE = InnoDB
DEFAULT CHARACTER SET = utf8
COLLATE = utf8_general_ci;


-- -----------------------------------------------------
-- Table `blogapp`.`posts_has_tags`
-- -----------------------------------------------------
DROP TABLE IF EXISTS `blogapp`.`posts_has_tags` ;

CREATE  TABLE IF NOT EXISTS `blogapp`.`posts_has_tags` (
  `tags_id` INT NOT NULL ,
  `posts_id` INT NOT NULL ,
  PRIMARY KEY (`tags_id`, `posts_id`) ,
  INDEX `fk_tags_has_posts_posts` (`posts_id` ASC) ,
  INDEX `fk_tags_has_posts_tags` (`tags_id` ASC) ,
  CONSTRAINT `fk_tags_has_posts_tags`
    FOREIGN KEY (`tags_id` )
    REFERENCES `blogapp`.`tags` (`id` )
    ON DELETE NO ACTION
    ON UPDATE NO ACTION,
  CONSTRAINT `fk_tags_has_posts_posts`
    FOREIGN KEY (`posts_id` )
    REFERENCES `blogapp`.`posts` (`id` )
    ON DELETE NO ACTION
    ON UPDATE NO ACTION)
ENGINE = InnoDB
DEFAULT CHARACTER SET = utf8
COLLATE = utf8_general_ci;


-- -----------------------------------------------------
-- Table `blogapp`.`keywords`
-- -----------------------------------------------------
DROP TABLE IF EXISTS `blogapp`.`keywords` ;

CREATE  TABLE IF NOT EXISTS `blogapp`.`keywords` (
  `id` INT NOT NULL AUTO_INCREMENT ,
  `keyword` VARCHAR(45) NOT NULL ,
  PRIMARY KEY (`id`) )
ENGINE = InnoDB
DEFAULT CHARACTER SET = utf8
COLLATE = utf8_general_ci;


-- -----------------------------------------------------
-- Table `blogapp`.`sections_has_keywords`
-- -----------------------------------------------------
DROP TABLE IF EXISTS `blogapp`.`sections_has_keywords` ;

CREATE  TABLE IF NOT EXISTS `blogapp`.`sections_has_keywords` (
  `sections_id` INT NOT NULL ,
  `keywords_id` INT NOT NULL ,
  PRIMARY KEY (`sections_id`, `keywords_id`) ,
  INDEX `fk_sections_has_keywords_keywords` (`keywords_id` ASC) ,
  INDEX `fk_sections_has_keywords_sections` (`sections_id` ASC) ,
  CONSTRAINT `fk_sections_has_keywords_sections`
    FOREIGN KEY (`sections_id` )
    REFERENCES `blogapp`.`sections` (`id` )
    ON DELETE NO ACTION
    ON UPDATE NO ACTION,
  CONSTRAINT `fk_sections_has_keywords_keywords`
    FOREIGN KEY (`keywords_id` )
    REFERENCES `blogapp`.`keywords` (`id` )
    ON DELETE NO ACTION
    ON UPDATE NO ACTION)
ENGINE = InnoDB
DEFAULT CHARACTER SET = utf8
COLLATE = utf8_general_ci;

USE `blogapp` ;


SET SQL_MODE=@OLD_SQL_MODE;
SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS;
SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS;

-- -----------------------------------------------------
-- Data for table `blogapp`.`sections`
-- -----------------------------------------------------
START TRANSACTION;
USE `blogapp`;
INSERT INTO `blogapp`.`sections` (`id`, `sections_id`, `page_title`, `url`, `active`, `view`, `language`) VALUES (1, 1, 'Root', '/', 0, 'index', '');
INSERT INTO `blogapp`.`sections` (`id`, `sections_id`, `page_title`, `url`, `active`, `view`, `language`) VALUES (2, 1, 'Блог о математике и программировании', '/ru', 1, 'index', 'ru');
INSERT INTO `blogapp`.`sections` (`id`, `sections_id`, `page_title`, `url`, `active`, `view`, `language`) VALUES (3, 1, 'Maths and programming blog', '/en', 1, 'index', 'en');
INSERT INTO `blogapp`.`sections` (`id`, `sections_id`, `page_title`, `url`, `active`, `view`, `language`) VALUES (4, 2, 'Блог о математике', '/maths', 1, 'index', 'ru');
INSERT INTO `blogapp`.`sections` (`id`, `sections_id`, `page_title`, `url`, `active`, `view`, `language`) VALUES (5, 2, 'Блог о программировании', '/programming', 1, 'index', 'ru');
INSERT INTO `blogapp`.`sections` (`id`, `sections_id`, `page_title`, `url`, `active`, `view`, `language`) VALUES (6, 3, 'Maths blog', '/maths', 1, 'index', 'en');
INSERT INTO `blogapp`.`sections` (`id`, `sections_id`, `page_title`, `url`, `active`, `view`, `language`) VALUES (7, 3, 'Programming blog', '/programming', 1, 'index', 'en');
INSERT INTO `blogapp`.`sections` (`id`, `sections_id`, `page_title`, `url`, `active`, `view`, `language`) VALUES (8, 2, 'Сервисы', '/services', 1, 'services', 'ru');
INSERT INTO `blogapp`.`sections` (`id`, `sections_id`, `page_title`, `url`, `active`, `view`, `language`) VALUES (9, 3, 'Services', '/services', 1, 'services', 'en');

COMMIT;

-- -----------------------------------------------------
-- Data for table `blogapp`.`tags`
-- -----------------------------------------------------
START TRANSACTION;
USE `blogapp`;
INSERT INTO `blogapp`.`tags` (`id`, `title`) VALUES (1, 'maths');
INSERT INTO `blogapp`.`tags` (`id`, `title`) VALUES (2, 'programming');
INSERT INTO `blogapp`.`tags` (`id`, `title`) VALUES (3, 'derivative');
INSERT INTO `blogapp`.`tags` (`id`, `title`) VALUES (4, 'java');

COMMIT;

-- -----------------------------------------------------
-- Data for table `blogapp`.`keywords`
-- -----------------------------------------------------
START TRANSACTION;
USE `blogapp`;
INSERT INTO `blogapp`.`keywords` (`id`, `keyword`) VALUES (1, 'биномиальное распределение');
INSERT INTO `blogapp`.`keywords` (`id`, `keyword`) VALUES (2, 'вероятность');
INSERT INTO `blogapp`.`keywords` (`id`, `keyword`) VALUES (3, 'распределение вероятностей');
INSERT INTO `blogapp`.`keywords` (`id`, `keyword`) VALUES (4, 'математика');
INSERT INTO `blogapp`.`keywords` (`id`, `keyword`) VALUES (5, 'программирование');
INSERT INTO `blogapp`.`keywords` (`id`, `keyword`) VALUES (6, 'блог');

COMMIT;

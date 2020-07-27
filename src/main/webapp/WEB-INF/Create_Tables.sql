-- MySQL의 주석 -- .
-- create or replace 는 oracle명령어라서 기존에 있던 테이블을 날리고 생성해야 함.
-- 테이블이 많을 경우에는 MySQL를 실행해서 아예 drop database cafe 로 날리고 create database cafe해서 새로 시작해도 됨.
-- sequence나 cafe_name 등등 몇몇의 수정 필요.

-- -----------------------------------------------------
-- Schema mydb_caferoad
-- -----------------------------------------------------

-- -----------------------------------------------------
-- Table `member`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `member` (
  `id` VARCHAR(16) NOT NULL,
  `password` VARCHAR(20) NOT NULL,
  `email` VARCHAR(30) NOT NULL,
  `name` VARCHAR(10) NOT NULL,
  `nickname` VARCHAR(10) NOT NULL,
  `gu` VARCHAR(5) NULL,
  `tel` VARCHAR(45) NULL,
  `create_time` TIMESTAMP NULL DEFAULT CURRENT_TIMESTAMP,
  `authority` VARCHAR(10) NOT NULL,
  PRIMARY KEY (`id`))engine=innodb default charset=utf8;


-- -----------------------------------------------------
-- Table `added_cafe`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `added_cafe` (
  `cafe_id` INT NOT NULL,
  `owner_id` VARCHAR(16) NOT NULL,
  `cafe_name` VARCHAR(45) NOT NULL,
  `gu` VARCHAR(5) NOT NULL,
  `address` VARCHAR(45) NOT NULL,
  `event` TINYINT(1) NULL,
  `homepage` VARCHAR(45) NULL,
  `intro` VARCHAR(200) NULL,
  `create_time` TIMESTAMP NULL DEFAULT CURRENT_TIMESTAMP,
  `concent` TINYINT(1) NULL,
  `pet` TINYINT(1) NULL,
  `wifi` TINYINT(1) NULL,
  `parking_zone` TINYINT(1) NULL,
  `smoking_room` TINYINT(1) NULL,
  `toilet` TINYINT(1) NULL,
  `img_main` VARCHAR(45) NULL,
  `img01` VARCHAR(45) NULL,
  `img02` VARCHAR(45) NULL,
  `img03` VARCHAR(45) NULL,
  `img04` VARCHAR(45) NULL,
  `img05` VARCHAR(45) NULL,
  `img06` VARCHAR(45) NULL,
  `img07` VARCHAR(45) NULL,
  `img08` VARCHAR(45) NULL,
  `img09` VARCHAR(45) NULL,
  PRIMARY KEY (`cafe_id`),
  INDEX `fk_added_cafe_member1_idx` (`owner_id` ASC),
  CONSTRAINT `fk_added_cafe_member1`
    FOREIGN KEY (`owner_id`)
    REFERENCES `member` (`id`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION)engine=innodb default charset=utf8;


-- -----------------------------------------------------
-- Table `favorite`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `favorite` (
  `user_id` VARCHAR(16) NOT NULL,
  `cafe_id` INT NOT NULL,
  PRIMARY KEY (`user_id`, `cafe_id`),
  INDEX `fk_favorite_added_cafe1_idx` (`cafe_id` ASC),
  CONSTRAINT `fk_favorite_added_cafe1`
    FOREIGN KEY (`cafe_id`)
    REFERENCES `added_cafe` (`cafe_id`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION,
  CONSTRAINT `fk_favorite_member1`
    FOREIGN KEY (`user_id`)
    REFERENCES `member` (`id`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION)engine=innodb default charset=utf8;


-- -----------------------------------------------------
-- Table `waiting_cafe`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `waiting_cafe` (
  `cafe_id` INT NOT NULL auto_increment,
  `owner_id` VARCHAR(16) NOT NULL,
  `cafe_name` VARCHAR(45) NOT NULL,
  `gu` VARCHAR(5) NOT NULL,
  `address` VARCHAR(45) NOT NULL,
  `event` TINYINT(1) NULL,
  `homepage` VARCHAR(45) NULL,
  `intro` VARCHAR(200) NULL,
  `create_time` TIMESTAMP NULL DEFAULT CURRENT_TIMESTAMP,
  `concent` TINYINT(1) NULL,
  `pet` TINYINT(1) NULL,
  `wifi` TINYINT(1) NULL,
  `parking_zone` TINYINT(1) NULL,
  `smoking_room` TINYINT(1) NULL,
  `toilet` TINYINT(1) NULL,
  `img_main` VARCHAR(45) NULL,
  `img01` VARCHAR(45) NULL,
  `img02` VARCHAR(45) NULL,
  `img03` VARCHAR(45) NULL,
  `img04` VARCHAR(45) NULL,
  `img05` VARCHAR(45) NULL,
  `img06` VARCHAR(45) NULL,
  `img07` VARCHAR(45) NULL,
  `img08` VARCHAR(45) NULL,
  `img09` VARCHAR(45) NULL,
  PRIMARY KEY (`cafe_id`),
  INDEX `fk_waiting_cafe_member1_idx` (`owner_id` ASC),
  CONSTRAINT `fk_waiting_cafe_member1`
    FOREIGN KEY (`owner_id`)
    REFERENCES `member` (`id`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION)engine=innodb default charset=utf8;



-- -----------------------------------------------------
-- Table `review`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `review` (
  `review_id` INT NOT NULL auto_increment,
  `review_name` VARCHAR(100) NOT NULL,
  `user_id` VARCHAR(16) NOT NULL,
  `cafe_id` INT NOT NULL,
  `password` VARCHAR(20) NOT NULL,
  `create_time` TIMESTAMP NULL DEFAULT CURRENT_TIMESTAMP,
  `content` VARCHAR(2000) NULL,
  `stars` DECIMAL(3,2) NULL,
  `star_taste` DECIMAL(3,2) NULL,
  `star_mood` DECIMAL(3,2) NULL,
  `star_service` DECIMAL(3,2) NULL,
  `star_clean` DECIMAL(3,2) NULL,
  PRIMARY KEY (`review_id`),
  INDEX `fk_review_added_cafe1_idx` (`cafe_id` ASC),
  INDEX `fk_review_member1_idx` (`user_id` ASC),
  CONSTRAINT `fk_review_added_cafe1`
    FOREIGN KEY (`cafe_id`)
    REFERENCES `added_cafe` (`cafe_id`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION,
  CONSTRAINT `fk_review_member1`
    FOREIGN KEY (`user_id`)
    REFERENCES `member` (`id`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION)engine=innodb default charset=utf8;


-- -----------------------------------------------------
-- Table `like`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `like` (
  `review_id` INT NOT NULL,
  `user_id` VARCHAR(16) NOT NULL,
  PRIMARY KEY (`review_id`),
  INDEX `fk_like_member1_idx` (`user_id` ASC),
  CONSTRAINT `fk_like_review1`
    FOREIGN KEY (`review_id`)
    REFERENCES `review` (`review_id`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION,
  CONSTRAINT `fk_like_member1`
    FOREIGN KEY (`user_id`)
    REFERENCES `member` (`id`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION)engine=innodb default charset=utf8;


-- -----------------------------------------------------
-- Table `article`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `article` (
  `article_id` INT NOT NULL auto_increment,
  `article_name` VARCHAR(100) NOT NULL,
  `password` VARCHAR(20) NOT NULL,
  `create_time` TIMESTAMP NULL DEFAULT CURRENT_TIMESTAMP,
  `admin_id` VARCHAR(16) NOT NULL,
  `content` VARCHAR(20000) NOT NULL,
  PRIMARY KEY (`article_id`),
  INDEX `fk_article_member1_idx` (`admin_id` ASC),
  CONSTRAINT `fk_article_member1`
    FOREIGN KEY (`admin_id`)
    REFERENCES `member` (`id`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION)engine=innodb default charset=utf8;


-- -----------------------------------------------------
-- Table `notice`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `notice` (
  `notice_id` INT NOT NULL auto_increment,
  `notice_name` VARCHAR(100) NOT NULL,
  `password` VARCHAR(20) NOT NULL,
  `create_time` TIMESTAMP NULL DEFAULT CURRENT_TIMESTAMP,
  `admin_id` VARCHAR(16) NOT NULL,
  `content` VARCHAR(3000) NOT NULL,
  PRIMARY KEY (`notice_id`),
  INDEX `fk_notice_member1_idx` (`admin_id` ASC),
  CONSTRAINT `fk_notice_member1`
    FOREIGN KEY (`admin_id`)
    REFERENCES `member` (`id`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION)engine=innodb default charset=utf8;


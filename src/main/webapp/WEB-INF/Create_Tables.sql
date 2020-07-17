-- MySQL의 주석 -- .
-- create or replace 는 oracle명령어라서 기존에 있던 테이블을 날리고 생성해야 함.
-- 테이블이 많을 경우에는 MySQL를 실행해서 아예 drop database cafe 로 날리고 create database cafe해서 새로 시작해도 됨.
-- sequence나 cafe_name 등등 몇몇의 수정 필요.

-- -----------------------------------------------------
-- Table `gu`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `gu` (
  `gu` VARCHAR(5) NOT NULL,
  PRIMARY KEY (`gu`))engine=innodb default charset=utf8;


-- -----------------------------------------------------
-- Table `member`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `member` (
  `id` VARCHAR(16) NOT NULL,
  `password` VARCHAR(20) NOT NULL,
  `email` VARCHAR(30) NULL,
  `create_time` TIMESTAMP NULL DEFAULT CURRENT_TIMESTAMP,
  `tel` VARCHAR(45) NULL,
  `authority` VARCHAR(10) NOT NULL,
  PRIMARY KEY (`id`))engine=innodb default charset=utf8;


-- -----------------------------------------------------
-- Table `added_cafe`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `added_cafe` (
  `cafe_id` VARCHAR(30) NOT NULL,
  `owner_id` VARCHAR(16) NOT NULL,
  `create_time` TIMESTAMP NULL DEFAULT CURRENT_TIMESTAMP,
  `gu` VARCHAR(5) NOT NULL,
  `address` VARCHAR(45) NOT NULL,
  `sns` VARCHAR(45) NULL,
  `event` TINYINT(1) NULL,
  `homepage` VARCHAR(45) NULL,
  `intro` VARCHAR(200) NULL,
  PRIMARY KEY (`cafe_id`, `owner_id`),
  INDEX `fk_added_cafe_gu1_idx` (`gu` ASC),
  INDEX `fk_added_cafe_member1_idx` (`owner_id` ASC),
  CONSTRAINT `fk_added_cafe_gu1`
    FOREIGN KEY (`gu`)
    REFERENCES `gu` (`gu`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION,
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
  `cafe_id` VARCHAR(30) NOT NULL,
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
  `cafe_id` VARCHAR(30) NOT NULL,
  `owner_id` VARCHAR(16) NOT NULL,
  `create_time` TIMESTAMP NULL DEFAULT CURRENT_TIMESTAMP,
  `gu` VARCHAR(5) NOT NULL,
  `address` VARCHAR(45) NOT NULL,
  `sns` VARCHAR(45) NULL,
  `event` TINYINT(1) NULL,
  `homepage` VARCHAR(45) NULL,
  `intro` VARCHAR(200) NULL,
  PRIMARY KEY (`cafe_id`, `owner_id`),
  INDEX `fk_added_cafe_gu1_idx` (`gu` ASC),
  INDEX `fk_waiting_cafe_member1_idx` (`owner_id` ASC),
  CONSTRAINT `fk_added_cafe_gu10`
    FOREIGN KEY (`gu`)
    REFERENCES `gu` (`gu`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION,
  CONSTRAINT `fk_waiting_cafe_member1`
    FOREIGN KEY (`owner_id`)
    REFERENCES `member` (`id`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION)engine=innodb default charset=utf8;


-- -----------------------------------------------------
-- Table `waiting_cafe_option`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `waiting_cafe_option` (
  `cafe_id` VARCHAR(30) NOT NULL,
  `concent` TINYINT(1) NULL,
  `pet` TINYINT(1) NULL,
  `seat` INT NULL,
  `wifi` TINYINT(1) NULL,
  `local_money` TINYINT(1) NULL,
  `parking_zone` INT NULL,
  `sdutyroom` INT NULL,
  `toilet` VARCHAR(10) NULL,
  INDEX `fk_waiting_cafe_option_waiting_cafe1_idx` (`cafe_id` ASC),
  PRIMARY KEY (`cafe_id`),
  CONSTRAINT `fk_waiting_cafe_option_waiting_cafe1`
    FOREIGN KEY (`cafe_id`)
    REFERENCES `waiting_cafe` (`cafe_id`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION)engine=innodb default charset=utf8;


-- -----------------------------------------------------
-- Table `added_cafe_option`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `added_cafe_option` (
  `cafe_id` VARCHAR(30) NOT NULL,
  `concent` TINYINT(1) NULL,
  `pet` TINYINT(1) NULL,
  `seat` INT NULL,
  `wifi` TINYINT(1) NULL,
  `local_money` TINYINT(1) NULL,
  `parking_zone` INT NULL,
  `sdutyroom` INT NULL,
  `toilet` VARCHAR(10) NULL,
  PRIMARY KEY (`cafe_id`),
  CONSTRAINT `fk_added_cafe_option_added_cafe1`
    FOREIGN KEY (`cafe_id`)
    REFERENCES `added_cafe` (`cafe_id`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION)engine=innodb default charset=utf8;


-- -----------------------------------------------------
-- Table `review`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `review` (
  `review_id` VARCHAR(16) NOT NULL,
  `user_id` VARCHAR(16) NOT NULL,
  `cafe_id` VARCHAR(30) NOT NULL,
  `password` VARCHAR(20) NOT NULL,
  `create_time` TIMESTAMP NULL DEFAULT CURRENT_TIMESTAMP,
  `content` VARCHAR(1000) NULL,
  `stars` DECIMAL(2,2) NULL,
  `star_taste` DECIMAL(2,2) NULL,
  `star_mood` DECIMAL(2,2) NULL,
  `star_service` DECIMAL(2,2) NULL,
  `star_clean` DECIMAL(2,2) NULL,
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
  `review_id` VARCHAR(16) NOT NULL,
  `user_id` VARCHAR(16) NOT NULL,
  `like` TINYINT(1) NOT NULL,
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
  `article_id` VARCHAR(16) NOT NULL,
  `password` VARCHAR(20) NOT NULL,
  `create_time` TIMESTAMP NULL DEFAULT CURRENT_TIMESTAMP,
  `admin_id` VARCHAR(16) NOT NULL,
  `content` VARCHAR(3000) NOT NULL,
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
  `notice_id` VARCHAR(16) NOT NULL,
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


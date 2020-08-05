-- MySQL Workbench Forward Engineering

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
-- Table `cafe`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `cafe` (
  `cafe_id` INT NOT NULL auto_increment,
  `owner_id` VARCHAR(16) NOT NULL,
  `cafe_name` VARCHAR(45) NOT NULL,
  `gu` VARCHAR(5) NOT NULL,
  `address` VARCHAR(45) NOT NULL,
   `cafe_tel` VARCHAR(45) NULL,
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
  `operating_time` VARCHAR(45) NULL,
  `lat` VARCHAR(45) NULL,
  `lng` VARCHAR(45) NULL,
  `approval` TINYINT(1) NOT NULL DEFAULT 0,
  PRIMARY KEY (`cafe_id`),
  INDEX `fk_added_cafe_member1_idx` (`owner_id` ASC),
  CONSTRAINT `fk_added_cafe_member1`
    FOREIGN KEY (`owner_id`)
    REFERENCES `member` (`id`)
    ON DELETE CASCADE
    ON UPDATE CASCADE)engine=innodb default charset=utf8;


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
    REFERENCES `cafe` (`cafe_id`)
    ON DELETE CASCADE
    ON UPDATE CASCADE,
  CONSTRAINT `fk_favorite_member1`
    FOREIGN KEY (`user_id`)
    REFERENCES `member` (`id`)
    ON DELETE CASCADE
    ON UPDATE CASCADE)engine=innodb default charset=utf8;


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
    REFERENCES `cafe` (`cafe_id`)
    ON DELETE CASCADE
    ON UPDATE CASCADE,
  CONSTRAINT `fk_review_member1`
    FOREIGN KEY (`user_id`)
    REFERENCES `member` (`id`)
    ON DELETE CASCADE
    ON UPDATE CASCADE)engine=innodb default charset=utf8;


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
    ON DELETE CASCADE
    ON UPDATE CASCADE,
  CONSTRAINT `fk_like_member1`
    FOREIGN KEY (`user_id`)
    REFERENCES `member` (`id`)
    ON DELETE CASCADE
    ON UPDATE CASCADE)engine=innodb default charset=utf8;


-- -----------------------------------------------------
-- Table `article`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `article` (
  `article_id` INT NOT NULL auto_increment,
  `article_name` VARCHAR(100) NOT NULL,
  `create_time` TIMESTAMP NULL DEFAULT CURRENT_TIMESTAMP,
  `content` VARCHAR(20000) NOT NULL,
  `cafe01` VARCHAR(45) NULL,
  `cafe02` VARCHAR(45) NULL,
  `cafe03` VARCHAR(45) NULL,
  `cafe04` VARCHAR(45) NULL,
  `cafe05` VARCHAR(45) NULL,
  `cafe06` VARCHAR(45) NULL,
  `cafe07` VARCHAR(45) NULL,
  `cafe08` VARCHAR(45) NULL,
  `cafe09` VARCHAR(45) NULL,
  `cafe10` VARCHAR(45) NULL,
  PRIMARY KEY (`article_id`))engine=innodb default charset=utf8;

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
    ON DELETE CASCADE
    ON UPDATE CASCADE)engine=innodb default charset=utf8;


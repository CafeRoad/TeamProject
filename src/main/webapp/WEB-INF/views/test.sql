CREATE TABLE IF NOT EXISTS `user` (
  `user_id` VARCHAR(16) NOT NULL,
  `password` VARCHAR(32) NOT NULL,
  `email` VARCHAR(255) NULL,
  `gender` VARCHAR(45) NULL,
  `nickname` VARCHAR(45) NULL,
  `local` VARCHAR(45) NULL,
  `birth` VARCHAR(45) NULL,
  `interesting` VARCHAR(45) NULL,
  `create_time` TIMESTAMP NULL DEFAULT CURRENT_TIMESTAMP,
  PRIMARY KEY (`user_id`))engine=innodb default charset=utf8;

CREATE TABLE IF NOT EXISTS `owner` (
  `owner_id` VARCHAR(16) NOT NULL,
  `password` VARCHAR(20) NOT NULL,
  `email` VARCHAR(30) NOT NULL,
  `tel` VARCHAR(20) NOT NULL,
  `create_time` TIMESTAMP NULL DEFAULT CURRENT_TIMESTAMP,
  PRIMARY KEY (`owner_id`))engine=innodb default charset=utf8;

insert into user values("totoro","1234","sun_juho@naver.com", "M","토토로", "부천시","19950308","디저트",now());

insert into owner values("owner001","1357","owner@naver.com","010-4190-5489",now());

select * from user;
select * from owner;
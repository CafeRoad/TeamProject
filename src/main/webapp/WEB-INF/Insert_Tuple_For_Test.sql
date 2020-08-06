-- 테이블당 두개 정도의 튜플 인서트문.
  
insert into member values("totoro","1234","sun_juho@naver.com", "토토로","또또로","유후인", "010-4190-5489", now(), "ADMIN");
insert into member values("hong","1234","hong@naver.com", "홍길동", "홍번쩍", "조선", "010-7890-1234", now(),"OWNER");
insert into member values("nobita","toraemonn","nobita@naver.com", "노진구", "노징징", "도쿄", "010-1234-5678", now(), "USER");
insert into member values("test11","1234","nobita@naver.com","테스터","테슽ㅅ","서울시","010-1234-5678", now(), "OWNER");
insert into member values("test22","aa1234","nobita@naver.com","테스터","실험체","서울시","010-1234-5678", now(), "USER");

  

select * from notice;

update member set password="doraemonn" where id="nobita";

select * from cafe;

delete from member where id like '?%';


delete from favorite;
delete from review;

update cafe set img_main = "main.jpg", img01 = "01.jpg", img02 = "02.jpg", img03 = "03.jpg", img04 = "04.jpg", img05 = "05.jpg", img06 = "06.jpg";

select * from cafe limit 0, 10;
	
select * from cafe where cafe_name like '%이디%';
select * from cafe where cafe_name like '%용%' or gu like '%용%' ;

select * from review;

select * from (select * from review where user_id = 'test11') a, (select cafe_id, cafe_name from added_cafe) b where a.cafe_id = b.cafe_id order by create_time;

select * from cafe where cafe_name like concat('%',#{search},'%')
select * from cafe where cafe_name like concat('%','이','%')
select * from cafe where cafe_name like '%디%'

select * from (select * from cafe where cafe_id = 5) a left outer join (select cafe_id, format(avg(stars),2) as avg_star from review group by cafe_id) b on a.cafe_id = b.cafe_id;

insert into article (article_name, create_time, cafe) values ("article01",now(),1);
insert into article (article_name, create_time, cafe) values ("article01",now(),4);
insert into article (article_name, create_time, cafe) values ("article01",now(),7);
insert into article (article_name, create_time, cafe) values ("article01",now(),8);
insert into article (article_name, create_time, cafe) values ("article01",now(),11);
insert into article (article_name, create_time, cafe) values ("article01",now(),16);
insert into article (article_name, create_time, cafe) values ("article01",now(),19);
insert into article (article_name, create_time, cafe) values ("article01",now(),22);
insert into article (article_name, create_time, cafe) values ("article01",now(),25);
select * from article;

select * from cafe where cafe_id in (select cafe from article where article_name = "article01")
select * from (select * from review where cafe_id = #{cafe_id}) a, (select cafe_id, cafe_name from cafe) b, (select id, nickname from member) c where a.cafe_id = b.cafe_id and a.user_id = c.id order by create_time
select * from (select * from review where cafe_id = 5) a, (select cafe_id, cafe_name from cafe) b, (select id, nickname from member) c where a.cafe_id = b.cafe_id and a.user_id = c.id order by create_time;



select * from (select * from cafe where approval = 1) a left outer join (select cafe_id, format(avg(stars),2) as avg_star from review group by cafe_id) b on a.cafe_id = b.cafe_id where a.cafe_id in (select cafe from article where article_name = #{article_name})
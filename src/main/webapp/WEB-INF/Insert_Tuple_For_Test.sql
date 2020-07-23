-- 테이블당 두개 정도의 튜플 인서트문.
  
insert into gu values("강서구"); 
insert into gu values("강동구"); 
  
select * from gu;
  
insert into member values("totoro","1234","sun_juho@naver.com", now(),"010-4190-5489", "ADMIN");
insert into member values("hong","1234","hong@naver.com", now(),"010-7890-1234","OWNER");
insert into member values("nobita","toraemonn","nobita@naver.com", now(),"010-1234-5678", "USER");
insert into member values("test11","1234","nobita@naver.com", now(),"010-1234-5678", "OWNER");
insert into member values("test22","1234","test22@naver.com", now(),"010-1234-5678", "USER");
insert into member values("test33","1234","nobita@naver.com", now(),"010-1234-5678", "OWNER");


select * from member;

update member set password="doraemonn" where id="nobita";

select * from added_cafe;

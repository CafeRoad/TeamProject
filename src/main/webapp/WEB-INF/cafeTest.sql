create table board(
bno int not null primary key,
writer varchar(50) not null,
subject varchar(100) not null,
content varchar(500) not null,
regdate datetime default now(),
viewcnt int
);

desc board

create table member(
seq int not null primary key,
userid varchar(50) not null,
userpw varchar(50) not null,
username varchar(12) not null,
regdate datetime default now()
);

desc member

insert into member (seq, userid, userpw, username) values (1, "cafe1", "1234", "kagome");
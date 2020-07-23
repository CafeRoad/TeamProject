CREATE TABLE MP_BOARD(
    BNO INT NOT NULL,
    TITLE VARCHAR(100)     NOT NULL,
    CONTENT VARCHAR(2000)  NOT NULL,
    WRITER VARCHAR(100)    NOT NULL,
    regdate datetime default now(),
    PRIMARY KEY(BNO)
);

INSERT INTO MP_BOARD(BNO, TITLE, CONTENT, WRITER)
     VALUES (1, 'title', 'content', 'MELONPEACH');
     
SELECT * FROM MP_BOARD;

delete from mp_board

drop table mp_board
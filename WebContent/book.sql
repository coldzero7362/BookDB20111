create table book_tbl(
	bcode number(5) not null,
	btitle varchar2(30),
	bwriter varchar2(30),
	bpub number(4),
	bprice number(10) not null,
	bdate DATE,
	CONSTRAINT PK_book_TBL PRIMARY KEY(bcode)
);

select * from BOOK_TBL;

INSERT INTO BOOK_TBL VALUES (10100, '자바킹', '강길동', '1001', 12000,'2020-11-02');
INSERT INTO BOOK_TBL VALUES (10101, '알고리즘', '남길동', '1002', 18000,'2020-05-05');
INSERT INTO BOOK_TBL VALUES (10102, '스프링두', '서길동', '1003', 23000,'2019-08-03');
INSERT INTO BOOK_TBL VALUES (10103, '파이썬', '홍길동', '1004', 9000,'2019-10-11');

drop table book_tbl;
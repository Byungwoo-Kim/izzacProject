create table Sales_Member(
	email varchar2(25) not null,
	pw varchar2(18) not null,
	phone number,
	category varchar2(10) not null,
	environ varchar2(25),
	signUpDate varchar2(20) not null,
	payDate varchar2(20) not null,
	CONSTRAINT PK_Sales_Member PRIMARY KEY(email)
);

create table Sales_Files(
	email varchar2(25),
	files varchar2(50) not null,
	up_Date varchar2(20) not null,
	FOREIGN KEY(email) REFERENCES Sales_Member(email)
);

create table Sales_Pre(
	email varchar2(25),
	pDate varchar2(20) not null,
	preData varchar2(1000) not null,
	FOREIGN KEY(email) REFERENCES Sales_Member(email)
);

create table Sales_Anal(
	email varchar2(25) not null,
	aDate varchar2(20) not null,
	analData1 varchar2(1000) not null,
	analData2 varchar2(1000) not null,
	analData3 varchar2(1000) not null,
	analData4 varchar2(1000) not null,
	analData5 varchar2(1000) not null,
	analAccu varchar2(50) not null,
	FOREIGN KEY(email) REFERENCES Sales_Member(email)
);

create table Sales_Board(
	num number not null,
	email varchar2(25) not null,
	wDate varchar2(20) not null,
	category varchar2(10) not null,
	title varchar2(25) not null,
	content varchar2(1000) not null,
	FOREIGN KEY(email) REFERENCES Sales_Member(email)
);

create sequence board_num
start with 1
increment by 1;
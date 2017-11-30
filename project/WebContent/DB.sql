create table Sales_Member(
	email varchar2(25) not null,
	pw varchar2(18) not null,
	phone number,
	category varchar2(10) not null,
	area varchar2(10) not null,
	environ varchar2(60) DEFAULT '계절/요일/온도/습도/날씨/강수량',
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

CREATE TABLE Sales_Message (
  mid number NOT NULL primary key,
  email varchar2(25) NOT NULL,
  msg varchar2(100) NOT NULL,
  favcount number DEFAULT '0',
  replycount number DEFAULT '0',
  mdate varchar2(20) NOT NULL,
  FOREIGN KEY(email) REFERENCES Sales_member(email)
);

create sequence Sales_message_num
start with 1
increment by 1;

CREATE TABLE Sales_Reply (
  rid number NOT NULL primary key,
  mid number NOT NULL,
  email varchar2(25) NOT NULL,
  rdate varchar2(20) NOT NULL,
  rmsg varchar2(50) NOT NULL,
  FOREIGN KEY (mid) REFERENCES Sales_Message (mid)
);

create sequence reply_num
start with 1
increment by 1;
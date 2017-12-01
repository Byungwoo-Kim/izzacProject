/* 회원 */
create table Sales_Member(
	email varchar2(25) not null,
	pw varchar2(18) not null,
	phone number,
	category varchar2(10) not null,
	area varchar2(10) not null,
	environ number DEFAULT 0,
	signUpDate varchar2(20) not null,
	payDate varchar2(20) not null,
	freeDay number DEFAULT 0,
	CONSTRAINT PK_Sales_Member PRIMARY KEY(email)
);

insert into SALES_MEMBER values('test@test', 'test', '01011112222', '요식업', '광주', 0, to_char(sysdate, 'YYYY-MM-DD'), to_char(sysdate + 7, 'YYYY-MM-DD'), 0);

/* 파일 */
create table Sales_Files(
	email varchar2(25),
	files varchar2(50) not null,
	up_Date varchar2(20) not null,
	FOREIGN KEY(email) REFERENCES Sales_Member(email)
);

/* 예측데이터 */
create table Sales_Pre(
	email varchar2(25),
	pDate varchar2(20) not null,
	preData0 varchar2(1000) not null,
	preData1 varchar2(1000) not null,
	preData2 varchar2(1000) not null,
	preData3 varchar2(1000) not null,
	preData4 varchar2(1000) not null,
	preData5 varchar2(1000) not null,
	preData6 varchar2(1000) not null,
	preData7 varchar2(1000) not null,
	preAccu varchar2(50) not null,
	FOREIGN KEY(email) REFERENCES Sales_Member(email)
);

/* 실제 매출 */
create table Sales_Anal(
	email varchar2(25) not null,
	aDate varchar2(20) not null,
	analData varchar2(1000) not null,
	FOREIGN KEY(email) REFERENCES Sales_Member(email)
);

insert into Sales_Anal values('test@test', '2017-10-1', '아메리카노(ice),100/아메리카노(hot),51/카페모카,35/에이드,21/라떼,11/헤이즐넛,8/에스프레소,12/카라멜마끼아또,15');
insert into Sales_Anal values('test@test', '2017-10-2', '아메리카노(ice),112/아메리카노(hot),53/카페모카,32/에이드,23/라떼,13/헤이즐넛,9/에스프레소,13/카라멜마끼아또,16');
insert into Sales_Anal values('test@test', '2017-10-3', '아메리카노(ice),131/아메리카노(hot),34/카페모카,34/에이드,26/라떼,15/헤이즐넛,7/에스프레소,5/카라멜마끼아또,17');
insert into Sales_Anal values('test@test', '2017-10-4', '아메리카노(ice),116/아메리카노(hot),45/카페모카,31/에이드,16/라떼,14/헤이즐넛,4/에스프레소,15/카라멜마끼아또,18');
insert into Sales_Anal values('test@test', '2017-10-5', '아메리카노(ice),109/아메리카노(hot),64/카페모카,28/에이드,14/라떼,9/헤이즐넛,5/에스프레소,10/카라멜마끼아또,11');

/* 게시글 */
CREATE TABLE Sales_Message (
  mid number NOT NULL primary key,
  email varchar2(25) NOT NULL,
  msg varchar2(100) NOT NULL,
  favcount number DEFAULT '0',
  replycount number DEFAULT '0',
  mdate varchar2(20) NOT NULL,
  FOREIGN KEY(email) REFERENCES Sales_member(email)
);

/* 게시글 번호 시퀀스 */
create sequence Sales_message_num
start with 1
increment by 1;

/* 댓글 */
CREATE TABLE Sales_Reply (
  rid number NOT NULL primary key,
  mid number NOT NULL,
  email varchar2(25) NOT NULL,
  rdate varchar2(20) NOT NULL,
  rmsg varchar2(50) NOT NULL,
  FOREIGN KEY (mid) REFERENCES Sales_Message (mid)
);

/* 댓글 번호 시퀀스 */
create sequence reply_num
start with 1
increment by 1;
/* ȸ�� */
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

insert into SALES_MEMBER values('test@test', 'test', '01011112222', '��ľ�', '����', 0, to_char(sysdate, 'YYYY-MM-DD'), to_char(sysdate + 7, 'YYYY-MM-DD'), 0);

/* ���� */
create table Sales_Files(
	email varchar2(25),
	files varchar2(50) not null,
	up_Date varchar2(20) not null,
	FOREIGN KEY(email) REFERENCES Sales_Member(email)
);

/* ���������� */
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

/* ���� ���� */
create table Sales_Anal(
	email varchar2(25) not null,
	aDate varchar2(20) not null,
	analData varchar2(1000) not null,
	FOREIGN KEY(email) REFERENCES Sales_Member(email)
);

insert into Sales_Anal values('test@test', '2017-10-1', '�Ƹ޸�ī��(ice),100/�Ƹ޸�ī��(hot),51/ī���ī,35/���̵�,21/��,11/�������,8/����������,12/ī��Ḷ���ƶ�,15');
insert into Sales_Anal values('test@test', '2017-10-2', '�Ƹ޸�ī��(ice),112/�Ƹ޸�ī��(hot),53/ī���ī,32/���̵�,23/��,13/�������,9/����������,13/ī��Ḷ���ƶ�,16');
insert into Sales_Anal values('test@test', '2017-10-3', '�Ƹ޸�ī��(ice),131/�Ƹ޸�ī��(hot),34/ī���ī,34/���̵�,26/��,15/�������,7/����������,5/ī��Ḷ���ƶ�,17');
insert into Sales_Anal values('test@test', '2017-10-4', '�Ƹ޸�ī��(ice),116/�Ƹ޸�ī��(hot),45/ī���ī,31/���̵�,16/��,14/�������,4/����������,15/ī��Ḷ���ƶ�,18');
insert into Sales_Anal values('test@test', '2017-10-5', '�Ƹ޸�ī��(ice),109/�Ƹ޸�ī��(hot),64/ī���ī,28/���̵�,14/��,9/�������,5/����������,10/ī��Ḷ���ƶ�,11');

/* �Խñ� */
CREATE TABLE Sales_Message (
  mid number NOT NULL primary key,
  email varchar2(25) NOT NULL,
  msg varchar2(100) NOT NULL,
  favcount number DEFAULT '0',
  replycount number DEFAULT '0',
  mdate varchar2(20) NOT NULL,
  FOREIGN KEY(email) REFERENCES Sales_member(email)
);

/* �Խñ� ��ȣ ������ */
create sequence Sales_message_num
start with 1
increment by 1;

/* ��� */
CREATE TABLE Sales_Reply (
  rid number NOT NULL primary key,
  mid number NOT NULL,
  email varchar2(25) NOT NULL,
  rdate varchar2(20) NOT NULL,
  rmsg varchar2(50) NOT NULL,
  FOREIGN KEY (mid) REFERENCES Sales_Message (mid)
);

/* ��� ��ȣ ������ */
create sequence reply_num
start with 1
increment by 1;
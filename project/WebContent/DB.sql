create table Sales_Member(
	email varchar2(25) not null,
	pw varchar2(18) not null,
	phone number,
	category varchar2(10) not null,
	signUpDate date not null,
	payDate date not null,
	CONSTRAINT PK_Sales_Member PRIMARY KEY(email)
);

create table Sales_Files(
	email varchar2(25),
	files varchar2(50) not null,
	up_Date date not null,
	FOREIGN KEY(email) REFERENCES Sales_Member(email)
);

create table Sales_Pre(`	
	email varchar2(25),
	pDate date not null,
	preData varchar2(80) not null,
	FOREIGN KEY(email) REFERENCES Sales_Member(email)
);

create table Sales_Anal(
	email varchar2(25) not null,
	aDate date not null,
	analData varchar2(80) not null,
	FOREIGN KEY(email) REFERENCES Sales_Member(email)
);
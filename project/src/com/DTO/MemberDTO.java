package com.DTO;

public class MemberDTO {
	private String email;
	private String pw;
	private int phone;
	private String category;
	private String environ;
	private String signUpDate;
	private String payDate;
	
	public MemberDTO(String email, String pw, int phone, String category, String environ, String signUpDate, String payDate) {
		super();
		this.email = email;
		this.pw = pw;
		this.phone = phone;
		this.category = category;
		this.environ = environ;
		this.signUpDate = signUpDate;
		this.payDate =payDate;
	}
	
	public MemberDTO(String email, String pw, int phone, String category) {
		super();
		this.email = email;
		this.pw = pw;
		this.phone = phone;
		this.category = category;
	}

	public String getEmail() {
		return email;
	}

	public void setEmail(String email) {
		this.email = email;
	}

	public String getPw() {
		return pw;
	}

	public void setPw(String pw) {
		this.pw = pw;
	}

	public int getPhone() {
		return phone;
	}

	public void setPhone(int phone) {
		this.phone = phone;
	}
	
	public String getEnviron() {
		return environ;
	}

	public void setEnviron(String environ) {
		this.environ = environ;
	}

	public String getCategory() {
		return category;
	}

	public void setCategory(String category) {
		this.category = category;
	}

	public String getSignUpDate() {
		return signUpDate;
	}

	public void setSignUpDate(String signUpDate) {
		this.signUpDate = signUpDate;
	}
	
	public String getPayDate() {
		return payDate;
	}

	public void setPayDate(String payDate) {
		this.payDate = payDate;
	}
}

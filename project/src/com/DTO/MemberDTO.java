package com.DTO;

public class MemberDTO {
	private String email;
	private String pw;
	private String phone;
	private String category;
	private String area;
	private String environ;
	private String signUpDate;
	private String payDate;
	
	public MemberDTO(String email, String pw, String phone, String category, String area, String environ, String signUpDate, String payDate) {
		super();
		this.email = email;
		this.pw = pw;
		this.phone = phone;
		this.category = category;
		this.area = area;
		this.environ = environ;
		this.signUpDate = signUpDate;
		this.payDate =payDate;
	}
	
	public MemberDTO(String email, String pw, String phone, String category, String area) {
		super();
		this.email = email;
		this.pw = pw;
		this.phone = phone;
		this.category = category;
		this.area = area;
	}

	public String getEmail() {
		return email;
	}

	public String getPw() {
		return pw;
	}

	public String getPhone() {
		return phone;
	}
	
	public String getEnviron() {
		return environ;
	}

	public String getCategory() {
		return category;
	}

	public String getSignUpDate() {
		return signUpDate;
	}
	
	public String getPayDate() {
		return payDate;
	}

	public String getArea() {
		return area;
	}
}

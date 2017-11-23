package com.DTO;

public class MemberDTO {
	private String email;
	private String pw;
	private int phone;
	private String category;
	private String signUpDate;
	
	public MemberDTO(String email, String pw, int phone, String category, String signUpDate) {
		super();
		this.email = email;
		this.pw = pw;
		this.phone = phone;
		this.category = category;
		this.signUpDate = signUpDate;
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
}

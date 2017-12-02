package com.DTO;

public class SupportDTO {
	String email;
	String phoneNum;
	String title;
	String context;
	public SupportDTO(String email, String phoneNum, String title, String context) {
		this.email = email;
		this.phoneNum = phoneNum;
		this.title = title;
		this.context = context;
	}
	public String getEmail() {
		return email;
	}
	public String getPhoneNum() {
		return phoneNum;
	}
	public String getTitle() {
		return title;
	}
	public String getContext() {
		return context;
	}
	
	
}

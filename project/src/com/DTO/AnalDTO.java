package com.DTO;

public class AnalDTO {
	private String email;
	private String aDate;
	private String analData;
	
	public AnalDTO(String email, String aDate, String analData) {
		super();
		this.email = email;
		this.aDate = aDate;
		this.analData = analData;
	}

	public String getEmail() {
		return email;
	}
	
	public String getaDate() {
		return aDate;
	}

	public String getAnalData() {
		return analData;
	}
}

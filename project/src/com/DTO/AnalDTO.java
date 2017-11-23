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

	public void setEmail(String email) {
		this.email = email;
	}

	public String getaDate() {
		return aDate;
	}

	public void setaDate(String aDate) {
		this.aDate = aDate;
	}

	public String getAnalData() {
		return analData;
	}

	public void setAnalData(String analData) {
		this.analData = analData;
	}
}

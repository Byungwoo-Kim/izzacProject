package com.DTO;

public class AnalDTO {
	private String email;
	private String aDate;
	private String analData;
	private String AnalMoney;
	
	public AnalDTO(String email, String aDate, String analData, String AnalMoney) {
		super();
		this.email = email;
		this.aDate = aDate;
		this.analData = analData;
		this.AnalMoney = AnalMoney;
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

	public String getAnalMoney() {
		return AnalMoney;
	}
	
}

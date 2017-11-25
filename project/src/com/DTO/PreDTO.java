package com.DTO;

public class PreDTO {
	private String email;
	private String pDate;
	private String preData;
	
	public PreDTO(String email, String pDate, String preData) {
		super();
		this.email = email;
		this.pDate = pDate;
		this.preData = preData;
	}
	
	public PreDTO(String pDate, String preData) {
		super();
		this.pDate = pDate;
		this.preData = preData;
	}

	public String getEmail() {
		return email;
	}

	public void setEmail(String email) {
		this.email = email;
	}

	public String getpDate() {
		return pDate;
	}

	public void setpDate(String pDate) {
		this.pDate = pDate;
	}

	public String getPreData() {
		return preData;
	}

	public void setPreData(String preData) {
		this.preData = preData;
	}
}

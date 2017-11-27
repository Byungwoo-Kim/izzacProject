package com.DTO;

public class AnalDTO {
	private String email;
	private String aDate;
	private String analData1;
	private String analData2;
	private String analData3;
	private String analData4;
	private String analData5;
	private String analAccu;
	
	public AnalDTO(String email, String aDate, String analData1, String analData2, String analData3, String analData4,
			String analData5, String analAccu) {
		super();
		this.email = email;
		this.aDate = aDate;
		this.analData1 = analData1;
		this.analData2 = analData2;
		this.analData3 = analData3;
		this.analData4 = analData4;
		this.analData5 = analData5;
		this.analAccu = analAccu;
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

	public String getAnalData1() {
		return analData1;
	}

	public void setAnalData1(String analData1) {
		this.analData1 = analData1;
	}

	public String getAnalData2() {
		return analData2;
	}

	public void setAnalData2(String analData2) {
		this.analData2 = analData2;
	}

	public String getAnalData3() {
		return analData3;
	}

	public void setAnalData3(String analData3) {
		this.analData3 = analData3;
	}

	public String getAnalData4() {
		return analData4;
	}

	public void setAnalData4(String analData4) {
		this.analData4 = analData4;
	}

	public String getAnalData5() {
		return analData5;
	}

	public void setAnalData5(String analData5) {
		this.analData5 = analData5;
	}

	public String getAnalAccu() {
		return analAccu;
	}

	public void setAnalAccu(String analAccu) {
		this.analAccu = analAccu;
	}
}

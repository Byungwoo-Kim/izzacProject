package com.DTO;

public class PreDTO {
	private String email;
	private String pDate;
	private String preData0;
	private String preData1;
	private String preData2;
	private String preData3;
	private String preData4;
	private String preData5;
	private String preData6;
	private String preData7;
	private String preAccu;
	
	public PreDTO(String email, String pDate, String preData0, String preData1, String preData2, String preData3, String preData4, String preData5, String preData6, String preData7, String preAccu) {
		super();
		this.email = email;
		this.pDate = pDate;
		this.preData0 = preData0;
		this.preData1 = preData1;
		this.preData2 = preData2;
		this.preData3 = preData3;
		this.preData4 = preData4;
		this.preData5 = preData5;
		this.preData6 = preData6;
		this.preData7 = preData7;
		this.preAccu = preAccu;
	}

	public String getEmail() {
		return email;
	}

	public String getpDate() {
		return pDate;
	}

	public String getPreData0() {
		return preData0;
	}

	public String getPreData1() {
		return preData1;
	}

	public String getPreData2() {
		return preData2;
	}

	public String getPreData3() {
		return preData3;
	}

	public String getPreData4() {
		return preData4;
	}

	public String getPreData5() {
		return preData5;
	}

	public String getPreData6() {
		return preData6;
	}


	public String getPreData7() {
		return preData7;
	}


	public String getPreAccu() {
		return preAccu;
	}
}

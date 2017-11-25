package com.DTO;

public class FileDTO {
	private String email;
	private String files;
	private String up_Date;
	
	public FileDTO(String email, String files, String up_Date) {
		super();
		this.email = email;
		this.files = files;
		this.up_Date = up_Date;
	}

	public String getEmail() {
		return email;
	}


	public void setEmail(String email) {
		this.email = email;
	}


	public String getFiles() {
		return files;
	}


	public void setFiles(String files) {
		this.files = files;
	}


	public String getUp_Date() {
		return up_Date;
	}


	public void setUp_Date(String up_Date) {
		this.up_Date = up_Date;
	}
}

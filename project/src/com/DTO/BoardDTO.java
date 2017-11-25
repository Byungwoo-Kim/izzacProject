package com.DTO;

public class BoardDTO {
	private int num;
	private String email;
	private String wDate;
	private String category;
	private String title;
	private String content;

	public BoardDTO(int num, String email, String wDate, String category, String title, String content) {
		super();
		this.num = num;
		this.email = email;
		this.wDate = wDate;
		this.category = category;
		this.title = title;
		this.content = content;
	}

	public BoardDTO(int num, String email, String wDate, String category, String title) {
		super();
		this.num = num;
		this.email = email;
		this.wDate = wDate;
		this.category = category;
		this.title = title;
	}

	public int getNum() {
		return num;
	}

	public void setNum(int num) {
		this.num = num;
	}

	public String getEmail() {
		return email;
	}

	public void setEmail(String email) {
		this.email = email;
	}

	public String getwDate() {
		return wDate;
	}

	public void setwDate(String wDate) {
		this.wDate = wDate;
	}

	public String getCategory() {
		return category;
	}

	public void setCategory(String category) {
		this.category = category;
	}

	public String getContent() {
		return content;
	}

	public void setContent(String content) {
		this.content = content;
	}

	public String getTitle() {
		return title;
	}

	public void setTitle(String title) {
		this.title = title;
	}
}

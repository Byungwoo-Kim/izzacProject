package com.DTO;


/**
 * File : Reply.java
 * Desc : ��� Data Object Ŭ����
 * @author Ȳ����(dinfree@dinfree.com)
 */
public class ReplyDTO {
	// ������ id
	private int mid;
	
	// ��� ������ id
	private int rid;
	
	// ��� �ۼ���
	private String email;
	
	// ��� ����
	private String rmsg;
	
	// ��� �ۼ�����
	private String date;

	public int getRid() {
		return rid;
	}

	public void setRid(int rid) {
		this.rid = rid;
	}

	public String getEmail() {
		return email;
	}

	public void setEmail(String email) {
		this.email = email;
	}

	public String getDate() {
		return date;
	}

	public void setDate(String date) {
		this.date = date;
	}

	public int getMid() {
		return mid;
	}

	public void setMid(int mid) {
		this.mid = mid;
	}

	public String getRmsg() {
		return rmsg;
	}

	public void setRmsg(String rmsg) {
		this.rmsg = rmsg;
	}
	
	
	
}
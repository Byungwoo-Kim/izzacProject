package com.DTO;

/**
 * File : Message.java
 * Desc : SNS �Խñ� Data Object Ŭ����
 * @author Ȳ����(dinfree@dinfree.com)
 *
 */
public class MessageDTO {
	// �Խñ� ������ id
	private int mid;
	
	// �Խñ� �ۼ���
	private String email;
	
	// �Խñ� ����
	private String msg;
	
	// �Խñ� �ۼ���, �ð�
	private String mdate;
	
	// ���ƿ� ȸ��
	private int favcount;
	
	// ��� ����
	private int replycount;
	
	public int getMid() {
		return mid;
	}

	public void setMid(int mid) {
		this.mid = mid;
	}

	public String getMsg() {
		return msg;
	}

	public void setMsg(String msg) {
		this.msg = msg;
	}

	public String getDate() {
		return mdate;
	}

	public void setDate(String mdate) {
		this.mdate = mdate;
	}

	public int getFavcount() {
		return favcount;
	}

	public void setFavcount(int favcount) {
		this.favcount = favcount;
	}

	public int getReplycount() {
		return replycount;
	}

	public void setReplycount(int replycount) {
		this.replycount = replycount;
	}

	public String getEmail() {
		return email;
	}

	public void setEmail(String email) {
		this.email = email;
	}
	
}
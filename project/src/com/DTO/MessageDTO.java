package com.DTO;

/**
 * File : Message.java
 * Desc : SNS 게시글 Data Object 클래스
 * @author 황희정(dinfree@dinfree.com)
 *
 */
public class MessageDTO {
	// 게시글 시퀀스 id
	private int mid;
	
	// 게시글 작성자
	private String email;
	
	// 게시글 내용
	private String msg;
	
	// 게시글 작성일, 시간
	private String mdate;
	
	// 좋아요 회수
	private int favcount;
	
	// 댓글 갯수
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
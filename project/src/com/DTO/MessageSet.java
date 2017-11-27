package com.DTO;

import java.util.ArrayList;

/**
 * File : MessageSet.java
 * Desc : SNS 게시글 과 댓글을 묶어 sns_main.jsp 로 보내기 위한 DTO(Data Transfer Object) 클래스
 * @author 황희정(dinfree@dinfree.com)
 */
public class MessageSet {
	// 메시지
	private MessageDTO message;
	
	// 해당 메시지에 대한 댓글 목록
	private ArrayList<ReplyDTO> rlist = new ArrayList<ReplyDTO>();
	
	public MessageDTO getMessage() {
		return message;
	}
	public void setMessage(MessageDTO message) {
		this.message = message;
	}
	public ArrayList<ReplyDTO> getRlist() {
		return rlist;
	}
	public void setRlist(ArrayList<ReplyDTO> rlist) {
		this.rlist = rlist;
	}
}

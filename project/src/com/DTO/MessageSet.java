package com.DTO;

import java.util.ArrayList;

/**
 * File : MessageSet.java
 * Desc : SNS �Խñ� �� ����� ���� sns_main.jsp �� ������ ���� DTO(Data Transfer Object) Ŭ����
 * @author Ȳ����(dinfree@dinfree.com)
 */
public class MessageSet {
	// �޽���
	private MessageDTO message;
	
	// �ش� �޽����� ���� ��� ���
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

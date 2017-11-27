package com.DAO;

import java.io.InputStream;
import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.util.Properties;

import com.DTO.MemberDTO;

public class MemberDAO {
	Connection conn = null;
	PreparedStatement pst = null;
	ResultSet rs = null;

	//connection
	public void getConn() throws Exception {
		InputStream in = (this.getClass().getResourceAsStream("../../../../DB.properties"));

		Properties p = new Properties();

		p.load(in);

		String url = p.getProperty("dburl");
		String dbid = p.getProperty("dbid");
		String dbpw = p.getProperty("dbpw");

		Class.forName(p.getProperty("dbclass"));
		conn = DriverManager.getConnection(url, dbid, dbpw);
	}
	
	//close
	public void close() throws Exception {
		if(rs!=null) rs.close();
		if(pst != null) pst.close();
		if(conn != null) conn.close();
	}

	// ȸ���߰�
	public int MemberJoin(String email, String pw, int phone, String category, String environ) throws Exception {
		getConn();

		pst = conn.prepareStatement(
				"insert into Sales_Member(email, pw, phone, category, environ, signUpDate, payDate) values(?, ?, ?, ?, ?, TO_CHAR(sysdate, 'YYYY-MM-DD'), TO_CHAR(sysdate + 14, 'YYYY-MM-DD'))");
		pst.setString(1, email);
		pst.setString(2, pw);
		pst.setInt(3, phone);
		pst.setString(4, category);
		pst.setString(5, environ);

		int cnt = pst.executeUpdate();
		
		close();

		return cnt;
	}

	// �α����� ���� ȸ�� ��ȸ
	public boolean MemberLogin(String email, String pw) throws Exception {
		getConn();

		pst = conn.prepareStatement("select * from Sales_Member where email = ?");
		pst.setString(1, email);

		rs = pst.executeQuery();

		boolean result;

		if (rs.next()) {
			String getpw = rs.getString(2);
			if (pw.equals(getpw)) {
				result = true;
			} else {
				result = false;
			}
		} else {
			result = false;
		}
		
		close();

		return result;
	}

	// ȸ������ ������ ���� ���� ��ȸ
	public MemberDTO ForMemberUpdate(String email, String pw) throws Exception {
		getConn();

		pst = conn.prepareStatement("select * from Sales_Member where email = ? and pw = ?");
		pst.setString(1, email);
		pst.setString(2, pw);

		rs = pst.executeQuery();

		MemberDTO dto = null;

		if (rs.next()) {
			int phone = rs.getInt(3);
			String category = rs.getString(4);
			String environ = rs.getString(5);
			String singUpDate = rs.getString(6);
			String payDate = rs.getString(7);
			dto = new MemberDTO(email, pw, phone, category, environ, singUpDate, payDate);
		}
		
		close();

		return dto;
	}
	
	//ȸ������ ����
	public int MemberUpdate(String email, String pw, int phone, String category, String environ) throws Exception {
		getConn();

		pst = conn.prepareStatement("update Sales_Member set pw=?, phone=?, category=?, environ=? where email=?");
		pst.setString(1, pw);
		pst.setInt(2, phone);
		pst.setString(3, category);
		pst.setString(4, environ);
		pst.setString(5, email);

		int cnt = pst.executeUpdate();
		
		close();

		return cnt;
	}
	
	//ȸ������ �������ڼ���
	public int MemberPayDateUpdate(String email, String pw, String payDate) throws Exception {
		getConn();

		pst = conn.prepareStatement("update Sales_Member set payDate where email=? and pw=?");
		pst.setString(1, payDate);
		pst.setString(2, email);
		pst.setString(3, pw);

		int cnt = pst.executeUpdate();
		
		close();

		return cnt;
	}
}

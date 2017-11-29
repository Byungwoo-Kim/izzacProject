package com.DAO;

import java.io.InputStream;
import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.Properties;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;

import com.DTO.MemberDTO;
import com.Util.DBManager;

public class MemberDAO {
	Connection conn = null;
	PreparedStatement pst = null;
	ResultSet rs = null;
	
	Logger logger = LoggerFactory.getLogger(MemberDAO.class);
	
	//close
	public void close() throws Exception {
		if(rs!=null) rs.close();
		if(pst != null) pst.close();
		if(conn != null) conn.close();
	}

	// 회원추가
	public boolean addMember(MemberDTO member) throws Exception {
		conn = DBManager.getConnection();
		String sql = "insert into Sales_Member(email, pw, phone, category, signUpDate, payDate) values(?, ?, ?, ?, to_char(sysdate, 'YYYY-MM-DD'), to_char(sysdate + 7, 'YYYY-MM-DD'))";
		try {
			pst = conn.prepareStatement(sql);
			pst.setString(1, member.getEmail());
			pst.setString(2, member.getPw());
			pst.setInt(3, member.getPhone());
			pst.setString(4, member.getCategory());
			pst.executeUpdate();
		} catch (SQLException e) {
			e.printStackTrace();
			System.out.println("Error : " + e.getMessage());
			logger.info("Error Code : {}",e.getErrorCode());
			return false;
		}
		finally {
			try {
				close();
			} catch (SQLException e) {
				e.printStackTrace();
			}
		}
		return true;
	}
	
	/**
	 * 회원 로그인
	 * @param uid
	 * @param passwd
	 * @return
	 * @throws Exception 
	 */
	public boolean login(String email, String pw) throws Exception {
		conn = DBManager.getConnection();
		String sql = "select email, pw from Sales_Member where email = ?";
		boolean result = false;
		
		try {
			pst = conn.prepareStatement(sql);
			pst.setString(1, email);
			rs = pst.executeQuery();
			rs.next();
			if(rs.getString("pw").equals(pw))
				result=true;
		} catch (SQLException e) {
			e.printStackTrace();
			return false;
		}
		finally {
			try {
				close();
			} catch (SQLException e) {
				e.printStackTrace();
			}
		}
		return result;
	}

	// 회원정보 수정을 위한 정보 조회
	public MemberDTO ForMemberUpdate(String email, String pw) throws Exception {
		conn = DBManager.getConnection();

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
	
	//회원정보 수정
	public int MemberUpdate(String email, String pw, int phone, String category, String environ) throws Exception {
		conn = DBManager.getConnection();

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
	
	//회원정보 만료일자수정
	public int MemberPayDateUpdate(String email, String payDate) throws Exception {
		conn = DBManager.getConnection();

		pst = conn.prepareStatement("update Sales_Member set payDate = to_char(to_date(payDate, 'YYYY-MM-DD') + ?, 'YYYY-MM-DD') where email=?");
		pst.setString(1, payDate);
		pst.setString(2, email);
		
		int cnt = pst.executeUpdate();
		
		close();

		return cnt;
	}
}

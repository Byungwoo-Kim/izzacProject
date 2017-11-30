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

	// close
	public void close() throws Exception {
		if (rs != null)
			rs.close();
		if (pst != null)
			pst.close();
		if (conn != null)
			conn.close();
	}

	// 회원추가
	public boolean addMember(MemberDTO member) throws Exception {
		conn = DBManager.getConnection();
		String sql = "insert into Sales_Member(email, pw, phone, category, area, signUpDate, payDate) values(?, ?, ?, ?, ?, to_char(sysdate, 'YYYY-MM-DD'), to_char(sysdate + 7, 'YYYY-MM-DD'))";
		try {
			pst = conn.prepareStatement(sql);
			pst.setString(1, member.getEmail());
			pst.setString(2, member.getPw());
			pst.setInt(3, member.getPhone());
			pst.setString(4, member.getCategory());
			pst.setString(5, member.getArea());
			pst.executeUpdate();
		} catch (SQLException e) {
			e.printStackTrace();
			System.out.println("Error : " + e.getMessage());
			logger.info("Error Code : {}", e.getErrorCode());
			return false;
		} finally {
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
	 * 
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
			if (rs.getString("pw").equals(pw))
				result = true;
		} catch (SQLException e) {
			e.printStackTrace();
			return false;
		} finally {
			try {
				close();
			} catch (SQLException e) {
				e.printStackTrace();
			}
		}
		return result;
	}

	// 이메일 중복체크
	public boolean emailCheck(String email) throws Exception {
		conn = DBManager.getConnection();
		String sql = "select * from Sales_Member where email = ?";
		boolean result = true;

		pst = conn.prepareStatement(sql);
		pst.setString(1, email);

		rs = pst.executeQuery();

		if (rs.next()) {
			result = false;
		}

		return result;
	}

	// 회원 수정 전 비밀번호 체크
	public boolean CheckPw(String email, String pw) throws Exception {
		conn = DBManager.getConnection();
		String sql = "select pw from Sales_Member where email = ?";
		boolean result = false;

		pst = conn.prepareStatement(sql);
		pst.setString(1, email);

		rs = pst.executeQuery();

		if (rs.next()) {
			String getPW = rs.getString(1);
			if (pw.equals(getPW)) {
				result = true;
			}
		}

		return result;
	}

	// 회원정보 수정을 위한 정보 조회
	public MemberDTO ForMemberUpdate(String email) throws Exception {
		conn = DBManager.getConnection();

		pst = conn.prepareStatement("select * from Sales_Member where email = ?");
		pst.setString(1, email);

		rs = pst.executeQuery();

		MemberDTO dto = null;

		if (rs.next()) {
			String pw = rs.getString(2);
			int phone = rs.getInt(3);
			String category = rs.getString(4);
			String area = rs.getString(5);
			String environ = rs.getString(6);
			String singUpDate = rs.getString(7);
			String payDate = rs.getString(8);
			dto = new MemberDTO(email, pw, phone, category, area, environ, singUpDate, payDate);
		}

		close();

		return dto;
	}

	// 회원정보 수정
	public int MemberUpdate(String email, String pw, int phone, String category, String area, String environ)
			throws Exception {
		conn = DBManager.getConnection();

		pst = conn
				.prepareStatement("update Sales_Member set pw=?, phone=?, category=?, area=?, environ=? where email=?");
		pst.setString(1, pw);
		pst.setInt(2, phone);
		pst.setString(3, category);
		pst.setString(4, area);
		pst.setString(5, environ);
		pst.setString(6, email);

		int cnt = pst.executeUpdate();

		close();

		return cnt;
	}

	// 회원정보 만료일자수정
	public int MemberPayDateUpdate(String email, int payDate) throws Exception {
		conn = DBManager.getConnection();

		pst = conn.prepareStatement(
				"update Sales_Member set payDate = to_char(to_date(payDate, 'YYYY-MM-DD') + ?, 'YYYY-MM-DD') where email=?");
		pst.setInt(1, payDate);
		pst.setString(2, email);

		int cnt = pst.executeUpdate();

		close();

		return cnt;
	}

	// 무료 체험판 여부
	public boolean FreeDaySelect(String email) throws Exception {
		conn = DBManager.getConnection();

		pst = conn.prepareStatement("select freeDay from Sales_Member where email = ?");
		pst.setString(1, email);

		rs = pst.executeQuery();

		int FreeDay = 0;
		boolean isDay = false;

		if (rs.next()) {
			FreeDay = rs.getInt(1);
		}

		if (FreeDay == 0) {
			pst = conn.prepareStatement("update Sales_Member set freeDay = 1 where email=?");
			pst.setString(1, email);

			int cnt = pst.executeUpdate();

			if (cnt > 0) {
				isDay = true;
			} else {
				isDay = false;
			}
		} else {
			isDay = false;
		}

		close();

		return isDay;
	}
}

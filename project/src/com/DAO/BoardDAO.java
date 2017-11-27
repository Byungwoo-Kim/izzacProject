package com.DAO;

import java.io.InputStream;
import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.util.ArrayList;
import java.util.Properties;

import com.DTO.BoardDTO;
import com.DTO.MemberDTO;

public class BoardDAO {
	Connection conn = null;
	PreparedStatement pst = null;
	ResultSet rs = null;

	// connection
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

	// close
	public void close() throws Exception {
		if (rs != null)
			rs.close();
		if (pst != null)
			pst.close();
		if (conn != null)
			conn.close();
	}

	// 게시글 등록
	public int BoardInsert(String email, String category, String title, String content) throws Exception {
		getConn();

		pst = conn.prepareStatement(
				"insert into Sales_Board values(board_num.nextval, ?, to_char(sysdate, 'YYYY-MM-DD'), ?, ?, ?");
		pst.setString(1, email);
		pst.setString(2, category);
		pst.setString(3, title);
		pst.setString(4, content);

		int cnt = pst.executeUpdate();

		close();

		return cnt;
	}

	// 게시글 수정을 위한 정보 조회
	public BoardDTO ForBoardUpdate(int num, String email) throws Exception {
		getConn();

		pst = conn.prepareStatement("select * from Sales_Board where num = ? and email = ?");
		pst.setInt(1, num);
		pst.setString(2, email);

		rs = pst.executeQuery();

		BoardDTO dto = null;

		if (rs.next()) {
			int getNum = rs.getInt(1);
			String getEmail = rs.getString(2);
			String wDate = rs.getString(3);
			String category = rs.getString(4);
			String title = rs.getString(5);
			String content = rs.getString(6);
			dto = new BoardDTO(getNum, getEmail, wDate, category, title, content);
		}

		close();

		return dto;
	}

	// 게시글 수정
	public int BoardUpdate(int num, String email, String category, String title, String content) throws Exception {
		getConn();

		pst = conn.prepareStatement("update Sales_Board set category=?, title=?, content=? where num=? and email=?");
		pst.setString(1, category);
		pst.setString(2, title);
		pst.setString(3, content);
		pst.setInt(4, num);
		pst.setString(5, email);

		int cnt = pst.executeUpdate();

		close();

		return cnt;
	}

	// 선택한 게시글 조회
	public BoardDTO PostSelect(int num) throws Exception {
		getConn();

		pst = conn.prepareStatement("select * from Sales_Board where num = ?");
		pst.setInt(1, num);

		rs = pst.executeQuery();

		BoardDTO dto = null;

		if (rs.next()) {
			int getNum = rs.getInt(1);
			String getEmail = rs.getString(2);
			String wDate = rs.getString(3);
			String category = rs.getString(4);
			String title = rs.getString(5);
			String content = rs.getString(6);
			dto = new BoardDTO(getNum, getEmail, wDate, category, title, content);
		}

		close();

		return dto;
	}

	// 전체 게시글 조회(번호, 카테고리, 제목, 글쓴이, 날짜)
	public ArrayList<BoardDTO> AllPostSelect() throws Exception {
		getConn();

		pst = conn.prepareStatement("select * from Sales_Board");

		rs = pst.executeQuery();

		ArrayList<BoardDTO> list = new ArrayList<BoardDTO>();

		while (rs.next()) {
			int num = rs.getInt(1);
			String email = rs.getString(2);
			String wDate = rs.getString(3);
			String category = rs.getString(4);
			String title = rs.getString(5);
			list.add(new BoardDTO(num, email, wDate, category, title));
		}

		close();

		return list;
	}
}

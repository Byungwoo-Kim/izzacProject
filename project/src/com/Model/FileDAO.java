package com.Model;

import java.io.InputStream;
import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;
import java.util.Properties;

public class FileDAO {
	private Connection con;
	private PreparedStatement pst;
	private ResultSet rs;
	private int cnt;
	private static FileDAO instance = new FileDAO();

	public static FileDAO getInstance() {
		System.out.println("getInstance");
		return instance;
	}

	public void getConnection() throws Exception {
		System.out.println(2.1);
		InputStream in = (this.getClass().getResourceAsStream("../../../../DB.properties"));
		Properties p = new Properties();
		p.load(in);

		String url = p.getProperty("dburl");
		String id = p.getProperty("dbid");
		String pw = p.getProperty("dbpw");

		Class.forName(p.getProperty("dbclass"));
		con = DriverManager.getConnection(url, id, pw);
		System.out.println("db접속완료");
	}

	public void close() throws Exception {
		if (rs != null)
			rs.close();
		if (pst != null)
			pst.close();
		if (con != null)
			con.close();
	}

	public int uploadFile(String writer, String title, String file) throws Exception {
		getConnection();

		// sql작성
		pst = con.prepareStatement(
				"insert into fileboard values(file_num.nextval, ?, ?, ?, to_char(sysdate, 'YYYY-MM-DD'))");
		pst.setString(1, writer);
		pst.setString(2, title);
		pst.setString(3, file);

		cnt = pst.executeUpdate();

		close();

		return cnt;
	}

	public ArrayList<FileVO> selectAll() throws Exception {
		getConnection();

		ArrayList<FileVO> tmplist = new ArrayList<FileVO>();
		// 모든 검색 sql 작성
		pst = con.prepareStatement("select * from fileboard2");
		System.out.println("3.1");
		rs = pst.executeQuery();
		System.out.println("3.2");
		while (rs.next()) {
			String file = rs.getString(1);
			System.out.println("3.3");
			tmplist.add(new FileVO(file));
			System.out.println("3.4");
		}

		close();

		return tmplist;
	}


	public int uploadExcel(String file) throws Exception {
		getConnection();	
		pst = con.prepareStatement("insert into fileboard2 values(?)");
		pst.setString(1, file);

		cnt = pst.executeUpdate();

		close();

		return cnt;
	}
}
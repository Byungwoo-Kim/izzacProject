package com.DAO;

import java.io.InputStream;
import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.util.ArrayList;
import java.util.Properties;

import com.DTO.AnalDTO;
import com.DTO.FileDTO;
import com.DTO.PreDTO;

public class DataDAO {
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

	// 파일추가
	public int FileInsert(String email, String files) throws Exception {
		getConn();

		pst = conn.prepareStatement("insert into Sales_File values(?, ?, to_char(sysdate, 'YYYY-MM-DD')");
		pst.setString(1, email);
		pst.setString(2, files);

		int cnt = pst.executeUpdate();

		close();

		return cnt;
	}
	
	// 로그인한 회원의 파일 조회
	public ArrayList<FileDTO> SelectFile(String email) throws Exception {
		getConn();

		pst = conn.prepareStatement("select * from Sales_File where email = ?");
		pst.setString(1, email);

		rs = pst.executeQuery();

		ArrayList<FileDTO> list = new ArrayList<FileDTO>();

		while (rs.next()) {
			String getEmail = rs.getString(1);
			String files = rs.getString(2);
			String up_Date = rs.getString(3);
			list.add(new FileDTO(getEmail, files, up_Date));
		}
		
		close();

		return list;
	}
	
	// 로그인한 회원의 오늘의 매출 예상 조회
	public String SelectTodayPre(String email) throws Exception {
		getConn();

		pst = conn.prepareStatement("select preData from Sales_Pre where email = ? and pDate = to_char(sysdate, 'YYYY-MM-DD'");
		pst.setString(1, email);

		rs = pst.executeQuery();

		String preData = "";
		
		if (rs.next()) {
			preData = rs.getString(1);
		}
		
		close();

		return preData;
	}
	
	// 로그인한 회원의 지난 매출 예측값 조회
	public ArrayList<PreDTO> SelectPre(String email) throws Exception {
		getConn();

		pst = conn.prepareStatement("select pDate, preData from Sales_Pre where email = ?");
		pst.setString(1, email);

		rs = pst.executeQuery();
		
		ArrayList<PreDTO> list = new ArrayList<PreDTO>();

		while (rs.next()) {
			String pDate = rs.getString(1);
			String preData = rs.getString(2);
			list.add(new PreDTO(pDate, preData));
		}
		
		close();

		return list;
	}
	
	//로그인 한 회원의 실제 매출 분석 데이터 조회
	public ArrayList<AnalDTO> SelectAnal(String email) throws Exception {
		getConn();

		pst = conn.prepareStatement("select * Sales_Anal where email = ?");
		pst.setString(1, email);

		rs = pst.executeQuery();
		
		ArrayList<AnalDTO> list = new ArrayList<AnalDTO>();

		while (rs.next()) {
			String aDate = rs.getString(2);
			String analData1 = rs.getString(3);
			String analData2 = rs.getString(4);
			String analData3 = rs.getString(4);
			String analData4 = rs.getString(5);
			String analData5 = rs.getString(6);
			String analAccu = rs.getString(7);
			list.add(new AnalDTO(email, aDate, analData1, analData2, analData3, analData4, analData5, analAccu));
		}
		
		close();

		return list;
	}
}

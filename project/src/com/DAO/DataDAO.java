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

	// �����߰�
	public int FileInsert(String email, String files) throws Exception {
		getConn();

		pst = conn.prepareStatement("insert into Sales_Files values(?, ?, to_char(sysdate, 'YYYY-MM-DD'))");
		pst.setString(1, email);
		pst.setString(2, files);

		int cnt = pst.executeUpdate();

		close();

		return cnt;
	}
	
	// �α����� ȸ���� ���� ��ȸ
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
	
	// �α����� ȸ���� ������ ���� ���� ��ȸ
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
	
	// �α����� ȸ���� ���� ���� ������ ��ȸ
	public ArrayList<PreDTO> SelectPre(String email) throws Exception {
		getConn();

		pst = conn.prepareStatement("select * from Sales_Pre where email = ?");
		pst.setString(1, email);

		rs = pst.executeQuery();
		
		ArrayList<PreDTO> list = new ArrayList<PreDTO>();

		while (rs.next()) {
			String pDate = rs.getString(2);
			String preData0 = rs.getString(3);
			String preData1 = rs.getString(4);
			String preData2 = rs.getString(5);
			String preData3 = rs.getString(6);
			String preData4 = rs.getString(7);
			String preData5 = rs.getString(8);
			String preData6 = rs.getString(9);
			String preData7 = rs.getString(10);
			String preAccu = rs.getString(11);
			list.add(new PreDTO(email, pDate, preData0, preData1, preData2, preData3, preData4, preData5, preData6, preData7, preAccu));
		}
		
		close();

		return list;
	}
	
	//�α��� �� ȸ���� ���� ���� �м� ������ ��ȸ
	public ArrayList<AnalDTO> SelectAnal(String email) throws Exception {
		getConn();

		pst = conn.prepareStatement("select * from Sales_Anal where email = ?");
		pst.setString(1, email);

		rs = pst.executeQuery();
		
		ArrayList<AnalDTO> list = new ArrayList<AnalDTO>();

		while (rs.next()) {
			String aDate = rs.getString(2);
			String analData = rs.getString(3);
			list.add(new AnalDTO(email, aDate, analData));
		}
		
		close();

		return list;
	}
}

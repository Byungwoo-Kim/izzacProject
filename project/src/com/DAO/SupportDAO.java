package com.DAO;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;

import com.DTO.SupportDTO;
import com.Util.DBManager;

public class SupportDAO {
	Connection conn = null;
	PreparedStatement pst = null;
	ResultSet rs = null;
	
	Logger logger = LoggerFactory.getLogger(SupportDAO.class);


	// close
	public void close() throws Exception {
		if (rs != null)
			rs.close();
		if (pst != null)
			pst.close();
		if (conn != null)
			conn.close();
	}

	public boolean addSupport(SupportDTO support) throws Exception {
		conn = DBManager.getConnection();
		String sql = "insert into Sales_Support values(?, ?, ?, ?)";
		try {
			pst = conn.prepareStatement(sql);
			pst.setString(1, support.getEmail());
			pst.setString(2, support.getPhoneNum());
			pst.setString(3, support.getTitle());
			pst.setString(4, support.getContext());
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
	
	
}

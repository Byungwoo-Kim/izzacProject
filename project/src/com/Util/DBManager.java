package com.Util;

import java.io.InputStream;
import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.PreparedStatement;
import java.sql.Statement;
import java.util.Properties;

import javax.naming.Context;
import javax.naming.InitialContext;
import javax.sql.DataSource;

/**
 * File : DBManager.java
 * Desc : 데이터베이스 연결 처리 클래스
 * @author 황희정(dinfree@dinfree.com)
 * 
 */
public class DBManager {
	// 데이터베이스 관련 객체 선언
	Statement stmt = null;
	PreparedStatement pstmt = null;
	
	/**
	 * JNDI 를 이용해 Connection 객체 리턴
	 * @return
	 */
	public static Connection getConnection() throws Exception {
		String url = "jdbc:oracle:thin:@127.0.0.1:1521:xe";
		String dbid = "system";
		String dbpw = "1234";

		Class.forName("oracle.jdbc.driver.OracleDriver");
		Connection conn = DriverManager.getConnection(url, dbid, dbpw);
		
		return conn;
	}
}
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
 * Desc : �����ͺ��̽� ���� ó�� Ŭ����
 * @author Ȳ����(dinfree@dinfree.com)
 * 
 */
public class DBManager {
	// �����ͺ��̽� ���� ��ü ����
	Statement stmt = null;
	PreparedStatement pstmt = null;
	
	/**
	 * JNDI �� �̿��� Connection ��ü ����
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
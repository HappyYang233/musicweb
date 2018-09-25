package com.cc.util;

import java.io.IOException;
import java.io.InputStream;
import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.SQLException;
import java.util.Properties;
public class MyJdbcUtil {
	public Connection getConnect() throws ClassNotFoundException, SQLException
	{
		Connection conn =null;
		InputStream in= null;
		try {
			in = this.getClass().getResourceAsStream("/jdbc.properties");
			Properties prop = new Properties();
			prop.load(in);
			String driver =prop.getProperty("driver");
			String url = prop.getProperty("url");
			String username = prop.getProperty("userName");
			String password = prop.getProperty("password");
			Class.forName(driver);
			conn =DriverManager.getConnection(url, username, password);
			
			
		} catch (IOException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}finally {
			try {
				in.close();
			} catch (IOException e) {
				// TODO Auto-generated catch block
				e.printStackTrace();
			}
		}
		return conn;
		
	}

}

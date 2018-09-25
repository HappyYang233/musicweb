package com.cc.dao;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;

import com.cc.javabean.User;
import com.cc.util.MyJdbcUtil;

public class UserEditDao {
	
	//根据id修改用户信息
	public int updateUserById(User user) {
		int rows = 0;
		MyJdbcUtil ju = new MyJdbcUtil();
		Connection conn = null;
		PreparedStatement pstmt = null;
		
		String sql = "update login set name=?,password=?,email=?"+" where id=?";
		try {
			conn = ju.getConnect();
			pstmt = conn.prepareStatement(sql);
			pstmt.setString(1, user.getName());
			pstmt.setString(2, user.getPassword());
			pstmt.setString(3, user.getEmail());
			pstmt.setInt(4, user.getId());
			rows = pstmt.executeUpdate();
			
		} catch (Exception e) {
			// TODO: handle exception
			System.out.println("用户资料更新出错");
			e.printStackTrace();
		}finally {
			try {
				pstmt.close();
				conn.close();
				
			} catch (Exception e2) {
				// TODO: handle exception
				e2.printStackTrace();
			}
		}
		
		return rows;
		
	}

}

package com.cc.dao;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;

import com.cc.javabean.User;
import com.cc.util.MyJdbcUtil;

public class RegisterDao {
	public int insertUser(User user) throws ClassNotFoundException{
  	  int rows=0;
  	  MyJdbcUtil ju=new MyJdbcUtil();
  	  Connection conn=null;
  	  PreparedStatement pstmt=null;
  	  
  	 try{
  		String sql="insert into login (name,password,email) values (?,?,?)";
  		  conn=ju.getConnect();
  		  
  		  pstmt=conn.prepareStatement(sql);
  		  pstmt.setString(1, user.getName());
  		  pstmt.setString(2, user.getPassword());
  		  pstmt.setString(3, user.getEmail());
  		  rows=pstmt.executeUpdate();
  		  
  	  }
  	  catch(SQLException e){
  		  e.printStackTrace();
  	  }
  	  finally{
  		  try {
				pstmt.close();
				conn.close();
			} catch (SQLException e) {
				// TODO Auto-generated catch block
				e.printStackTrace();
			}
  		 
  	  }
  	  return rows;
    }
}

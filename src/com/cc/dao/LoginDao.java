package com.cc.dao;

import java.sql.Connection;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.sql.Statement;

import com.cc.javabean.User;
import com.cc.util.MyJdbcUtil;

public class LoginDao {
	 public User Login(String userName,String Password){
   	  Statement stmt=null;
   	  ResultSet rs=null;
   	  Connection conn=null;
   	  MyJdbcUtil ju=new MyJdbcUtil();
   	  User user=new User();
   	  try {
   		  
   	  conn=ju.getConnect();
   	  stmt=conn.createStatement();
   	  String sql="select * from login where name='"+userName+"' and password='"+Password+"'";
   	 
			rs=stmt.executeQuery(sql);
			while(rs.next()){
				user.setId(rs.getInt("id"));
				user.setName(rs.getString("name"));
				user.setPassword(rs.getString("password"));
				user.setId(rs.getInt("id"));
			}
		} catch (Exception e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
   	 finally{
   		  try{
   			 rs.close();
   			  stmt.close();
   			  conn.close();
   		  }
   		  catch(SQLException e){
   			  e.printStackTrace();
   		  }
   	  }
   	  return user;
     }
}

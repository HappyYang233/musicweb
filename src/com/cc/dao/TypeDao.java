package com.cc.dao;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;
import java.util.List;

import com.cc.util.MyJdbcUtil;

public class TypeDao {
	public List<String> querytype(int id)
	{
		List<String> list = new ArrayList<String>();
		MyJdbcUtil ju = new MyJdbcUtil();
		Connection con = null;
		PreparedStatement ptmt = null;
		ResultSet rs= null;
		String sql = "select distinct type from link where id=?";
		try {
			con = ju.getConnect();
			ptmt=con.prepareStatement(sql);
			ptmt.setInt(1, id);
			rs=ptmt.executeQuery();
			while(rs.next())
			{
				String string =rs.getString("Type");
				list.add(string);
			}
		} catch (ClassNotFoundException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
		
		return list;
	}
}

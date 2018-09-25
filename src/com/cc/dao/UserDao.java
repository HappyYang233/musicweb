package com.cc.dao;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;
import java.util.List;

import com.cc.javabean.Music;
import com.cc.javabean.User;
import com.cc.util.MyJdbcUtil;

public class UserDao {
	public static int count=0;
	public List<Music> queryByUserid(int id,int page)
	{
		List<Music> list = new ArrayList<Music>();
		MyJdbcUtil ju = new MyJdbcUtil();
		Connection con = null;
		PreparedStatement ptmt = null;
		ResultSet rs= null;
		
		String sql = "select * from link where id =? limit ?,10 ";
		try {
			con = ju.getConnect();
			ptmt = con.prepareStatement(sql);
			ptmt.setInt(1, id);
			ptmt.setInt(2, (page-1)*10);
			rs =ptmt.executeQuery();
			while(rs.next())
			{
				count++;
				Music music = new Music();
				music.setMusic(rs.getString("music"));
				list.add(music);
			}
		} catch (ClassNotFoundException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}finally {
			try {
				rs.close();
				ptmt.close();
				con.close();
			} catch (SQLException e) {
				// TODO Auto-generated catch block
				e.printStackTrace();
			}
		}
		
		return list;
		
	}
	public int delMusic(String music,int id,String type)//id是用户的id
	{
		MyJdbcUtil ju = new MyJdbcUtil();
		Connection con = null;
		PreparedStatement ptmt = null;
		int rows= 0;
		String sql = "delete from link where id=? and music=? and type=?";
		try {
			con = ju.getConnect();
			ptmt = con.prepareStatement(sql);
			ptmt.setInt(1,id);
			ptmt.setString(2,music);
			ptmt.setString(3,type);
			rows =ptmt.executeUpdate();
		} catch (ClassNotFoundException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}finally {
			try {
				
				ptmt.close();
				con.close();
			} catch (SQLException e) {
				// TODO Auto-generated catch block
				e.printStackTrace();
			}
		}
		return rows;
	}
	public User queryUseriforById(int id)
	{
		MyJdbcUtil ju = new MyJdbcUtil();
		Connection con = null;
		User user = new User();
		PreparedStatement ptmt = null;
		ResultSet  rs = null;
		String sql ="select *from login where id=?";
			
					try {
						con = ju.getConnect();
						ptmt = con.prepareStatement(sql);
						ptmt.setInt(1, id);
						rs=ptmt.executeQuery();
						while(rs.next())
						{
						
							user.setId(rs.getInt("id"));
							user.setName(rs.getString("name"));
							user.setEmail(rs.getString("eamil"));
							user.setPassword(rs.getString("password"));
						}
					} catch (ClassNotFoundException e) {
						// TODO Auto-generated catch block
						e.printStackTrace();
					} catch (SQLException e) {
						// TODO Auto-generated catch block
						e.printStackTrace();
					}
					return user;
			
	}
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
	public List<Music> queryByIdType(int id,String type)
	{
		List<Music> list = new ArrayList<Music>();
		MyJdbcUtil ju = new MyJdbcUtil();
		Connection con = null;
		PreparedStatement ptmt = null;
		ResultSet rs= null;
		String sql = "select distinct* from link where id=? and type=? ";
		try {
			con = ju.getConnect();
			ptmt=con.prepareStatement(sql);
			ptmt.setInt(1, id);
			ptmt.setString(2, type);
			rs=ptmt.executeQuery();
			while(rs.next())
			{
				Music music = new Music();
				 music.setMusic(rs.getString("music"));
				 music.setSrc(rs.getString("src"));
				list.add(music);
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
	














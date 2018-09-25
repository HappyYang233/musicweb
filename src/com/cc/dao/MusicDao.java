package com.cc.dao;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;
import java.util.List;

import com.cc.javabean.Music;
import com.cc.util.MyJdbcUtil;

public class MusicDao {
	public List<Music> queryByPage(int page)
	{
		List<Music> list = new ArrayList<Music>();
		MyJdbcUtil ju = new MyJdbcUtil();
		Connection con = null;
		PreparedStatement ptmt = null;
		ResultSet rs= null;
		String sql = "select * from allmusic limit ?,10 ";
		try {
			con = ju.getConnect();
			ptmt = con.prepareStatement(sql);
			ptmt.setInt(1, (page-1)*10);
			rs =ptmt.executeQuery();
			while(rs.next())
			{
				Music music = new Music();
				music.setId(rs.getInt("id"));
				music.setMusic(rs.getString("music"));
				music.setSrc(rs.getString("src"));
				music.setSinger(rs.getString("singer"));
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
	
	public int addMusic(String music,int id)
	{
		MyJdbcUtil ju = new MyJdbcUtil();
		Connection con = null;
		PreparedStatement ptmt = null;
		int rows= 0;
		String sql = "insert into link(id,music) values(?,?)";
		
		try {
			con = ju.getConnect();
			ptmt = con.prepareStatement(sql);
			ptmt.setInt(1, id);
			ptmt.setString(2, music);
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
	public int queryCount()
	{
		int count =0;
		MyJdbcUtil ju = new MyJdbcUtil();
		Connection con = null;
		PreparedStatement ptmt = null;
		ResultSet rs= null;
		String sql = "select count(*) from allmusic";
		try {
			con = ju.getConnect();
			ptmt = con.prepareStatement(sql);
			rs =ptmt.executeQuery();
			while(rs.next())
			{
				count = rs.getInt("count(*)");
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
		return count;
	}
	public int insert(String music,String type,int id,String src)
	{
		MyJdbcUtil ju = new MyJdbcUtil();
		Connection con = null;
		PreparedStatement ptmt = null;
		int rows= 0;
		String sql ="insert into link(id,music,type,src) values(?,?,?,?)";
		try {
			con= ju.getConnect();
			ptmt=con.prepareStatement(sql);
			ptmt.setInt(1, id);
			ptmt.setString(2, music);
			ptmt.setString(3, type);
			ptmt.setString(4, src);
			
			rows =ptmt.executeUpdate();
		} catch (ClassNotFoundException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
		return rows;
	}
	public int createType(int id,String type)
	
	{
		MyJdbcUtil ju = new MyJdbcUtil();
		Connection con = null;
		PreparedStatement ptmt = null;
		int rows= 0;
		String sql ="insert into link(id,type) values(?,?)";
		try {
			con= ju.getConnect();
			ptmt=con.prepareStatement(sql);
			ptmt.setInt(1, id);
			ptmt.setString(2, type);
			rows =ptmt.executeUpdate();
		} catch (ClassNotFoundException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
		return rows;
		
		
	}
	
	//SEARCH
	public List<Music> queryByMusicName(String musicname)
	{
		List<Music> list = new ArrayList<Music>();
		MyJdbcUtil ju = new MyJdbcUtil();
		Connection con = null;
		PreparedStatement ptmt = null;
		ResultSet rs= null;
		
		String sql = "select * from allmusic where music=?";
		try {
			con = ju.getConnect();
			ptmt = con.prepareStatement(sql);
			ptmt.setString(1, musicname);
			rs =ptmt.executeQuery();
			
			
				while(rs.next())
				{
					Music music = new Music();
					music.setId(rs.getInt("id"));
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


	
	
	
	
	
	
	
	
	
}

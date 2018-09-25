package com.cc.service;

import java.util.List;

import com.cc.dao.UserDao;
import com.cc.javabean.Music;
import com.cc.javabean.User;

public class UserService {
		UserDao ud = new UserDao();
	public List<Music> queryByUserid(int id,int page)
	{
		return ud.queryByUserid(id, page);
	}
	public int delMusic(String music,int id,String type)//这里的id是用户的id
	{
		return ud.delMusic(music,id,type);
	}
	public User queryUseriforById(int id)
	{
		return ud.queryUseriforById(id);
	}
	public List<String> querytype(int id)
	{
		return ud.querytype(id);
	}
	public List<Music> queryByIdType(int id,String type){
		return ud.queryByIdType(id, type);
	}
}

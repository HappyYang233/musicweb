package com.cc.service;

import java.util.List;

import com.cc.dao.MusicDao;
import com.cc.javabean.Music;

public class MusicService {
	MusicDao md = new MusicDao();
	
	public List<Music> queryByPage(int page)
	{
		return  md.queryByPage(page);
	}
	public int addMusic(String music,int id)
	{
		return md.addMusic(music, id);
	}
	public int queryCount()
	{
		return md.queryCount();
	}
	public int insert(String music,String type,int id,String src)
	{
		return md.insert(music, type, id,src);
	}
	public int createType(int id,String type)
	{
		return md.createType(id, type);
	}
	public List<Music> queryByMusicName(String musicname){
		return md.queryByMusicName(musicname);
	}

}

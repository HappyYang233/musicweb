package com.cc.service;

import java.util.List;

import com.cc.dao.TypeDao;

public class TypeService {
	TypeDao td= new TypeDao();
	public List<String> querytype(int id){
		
		return td.querytype(id);
		
	}
	
}

package com.cc.service;

import com.cc.dao.RegisterDao;
import com.cc.javabean.User;

public class RegisteService {
	public int insertUser(User user) throws ClassNotFoundException{
   RegisterDao rd=new  RegisterDao();
   	 return rd.insertUser(user);
    }
}

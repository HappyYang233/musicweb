package com.cc.service;

import com.cc.dao.LoginDao;
import com.cc.dao.RegisterDao;
import com.cc.javabean.User;

public class LoginService {
    public User Login(String userName,String password){
    	LoginDao ld=new LoginDao();
    	return ld.Login(userName, password);
    }
    public int insertUser(User user) throws ClassNotFoundException{
   	 RegisterDao rd=new RegisterDao();
   	 return rd.insertUser(user);
    }
    
}

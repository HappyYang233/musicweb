package com.cc.service;

import com.cc.dao.UserEditDao;
import com.cc.javabean.User;
	
public class UserEditService {
	
	UserEditDao ud = new UserEditDao();
	
	//根据id修改用户信息
	public int updateUserById(User user) {
		
		return ud.updateUserById( user);
	}
}

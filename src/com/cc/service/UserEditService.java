package com.cc.service;

import com.cc.dao.UserEditDao;
import com.cc.javabean.User;
	
public class UserEditService {
	
	UserEditDao ud = new UserEditDao();
	
	//����id�޸��û���Ϣ
	public int updateUserById(User user) {
		
		return ud.updateUserById( user);
	}
}

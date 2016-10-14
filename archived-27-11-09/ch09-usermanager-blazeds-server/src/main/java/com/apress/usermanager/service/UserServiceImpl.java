package com.apress.usermanager.service;

import java.io.IOException;
import java.util.List;

import com.apress.usermanager.dao.UserDao;
import com.apress.usermanager.dao.xml.UserDaoImpl;
import com.apress.usermanager.model.User;

public class UserServiceImpl implements UserService {

	private UserDao userDao;

	public UserServiceImpl(){
		userDao = new UserDaoImpl("users.xml");
	}

	public UserServiceImpl(UserDao userDao){
		setUserDao(userDao);
	}

	public List<User> getUsers(){
		return userDao.getUsers();
	}

	public List<User> addUser(User user) throws IOException{
		return userDao.addUser(user);
	}

	public void setUserDao(UserDao userDao) {
		this.userDao = userDao;
	}

}

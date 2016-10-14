package com.apress.usermanager.service;

import java.util.List;
import org.springframework.security.context.SecurityContextHolder;
import com.apress.usermanager.dao.UserDao;
import com.apress.usermanager.model.User;
import flex.messaging.FlexContext;

public class UserServiceImpl implements UserService {

	private UserDao userDao;


	public List<User> getUsers(){
		return userDao.findAll();
	}

	public List<User> addUser(User user){
		userDao.merge(user);
		return getUsers();
	}

	public User updateUser(User user){
		return (User)userDao.merge(user);
	}

	public void setUserDao(UserDao userDao) {
		this.userDao = userDao;
	}

	public void removeUserByEmail(String email) {
		this.userDao.removeUserByEmail(email);
	}

	public User getUserByUsername(String username) {
		return userDao.findByUsername(username);
	}

	public void doLogout() {
		String username = "unknown";
		try {
			username = SecurityContextHolder.getContext().getAuthentication().getName();
			FlexContext.setUserPrincipal(null);
			FlexContext.getHttpRequest().getSession().invalidate();
			FlexContext.getFlexSession().invalidate();
			SecurityContextHolder.clearContext();
		} catch (RuntimeException e) {
			//dosomething like logging
		}
	}


}

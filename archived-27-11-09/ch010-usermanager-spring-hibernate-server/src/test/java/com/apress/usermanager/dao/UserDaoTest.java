package com.apress.usermanager.dao;

import java.util.List;
import com.apress.usermanager.model.User;
import com.apress.usermanager.dao.BaseSpringTestCase;


public class UserDaoTest extends BaseSpringTestCase {

	private UserDao userDao;

	private final String EMAIL_ADDED_USER = "dustin.robert@apress.com";

	private final String USERNAME = "dustin34";

	public void testGetUsers(){
		userDao.removeUserByEmail(EMAIL_ADDED_USER);
		List<User> users = userDao.findAll();
		assertNotNull(users);
		assertEquals(4, users.size());
	}

	public void testAddUser(){
		List<User> users = null;
		User user = new User();
		user.setCommonName("Dustin");
		user.setLastName("Robert");
		user.setEmail(EMAIL_ADDED_USER);
		user.setUsername(USERNAME);
		user.setPassword("43jh8978");
		userDao.merge(user);
		users = userDao.findAll();
		assertEquals(5, users.size());
	}

	public void testGetUserByUsername(){
		User user = userDao.findByUsername(USERNAME);
		assertNotNull(user);
		assertEquals(user.getUsername(), USERNAME);
	}

	public void testRemoveUserByEmail(String email){
		userDao.removeUserByEmail(email);
		List<User> users = userDao.findAll();
		assertNotNull(users);
		assertEquals(4, users.size());
		User user = userDao.findByUsername(USERNAME);
		assertNull(user);
	}

	public void setUserDao(UserDao userDao) {
		this.userDao = userDao;
	}

}

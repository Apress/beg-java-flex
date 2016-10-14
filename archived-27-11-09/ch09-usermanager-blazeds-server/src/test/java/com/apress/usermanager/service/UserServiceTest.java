package com.apress.usermanager.service;

import java.io.IOException;
import java.util.List;
import com.apress.usermanager.dao.xml.UserDaoImpl;
import com.apress.usermanager.model.User;

import junit.framework.TestCase;

public class UserServiceTest extends TestCase {

	private UserDaoImpl userDao;

	private UserService userService;

	private final String EMAIL_ADDED_USER = "dustin.robert@apress.com";

	protected void setUp() throws Exception {
		super.setUp();
		userDao = new UserDaoImpl("users_test.xml");
		userDao.removeUserByEmail(EMAIL_ADDED_USER);
		userService = new UserServiceImpl(userDao);
	}

	public void testGetUsers(){
		List<User> users = userService.getUsers();
		assertNotNull(users);
		assertEquals(4, users.size());
	}

	public void testAddUser(){
		List<User> users = null;
		User user = new User();
		user.setCommonName("Dustin");
		user.setLastName("Robert");
		user.setEmail(EMAIL_ADDED_USER);
		user.setUsername("dustin34");
		user.setPassword("43jh8978");
		try {
			users = userService.addUser(user);
		} catch (IOException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
		assertEquals(5, users.size());
	}

}

package com.apress.usermanager.service;

import java.util.List;

import com.apress.usermanager.dao.BaseSpringTestCase;
import com.apress.usermanager.model.User;
import com.apress.usermanager.service.UserService;


public class UserServiceTest extends BaseSpringTestCase {

	private UserService userService;

	private final String EMAIL_ADDED_USER = "dustin.robert@apress.com";

	private final String USERNAME = "dustin34";


	public void testGetUsers(){
		userService.removeUserByEmail(EMAIL_ADDED_USER);
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
		user.setUsername(USERNAME);
		user.setPassword("43jh8978");
		users = userService.addUser(user);
		assertEquals(5, users.size());
	}

	public void testGetUserByUsername(){
		User user = userService.getUserByUsername(USERNAME);
		assertNotNull(user);
		assertEquals(user.getUsername(), USERNAME);
	}

	public void testRemoveUserByEmail(String email){
		userService.removeUserByEmail(email);
		List<User> users = userService.getUsers();
		assertNotNull(users);
		assertEquals(4, users.size());
		User user = userService.getUserByUsername(USERNAME);
		assertNull(user);
	}



	public void setUserService(UserService userService) {
		this.userService = userService;
	}

}

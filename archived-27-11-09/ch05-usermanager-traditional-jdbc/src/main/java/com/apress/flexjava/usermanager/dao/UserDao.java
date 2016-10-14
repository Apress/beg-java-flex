package com.apress.flexjava.usermanager.dao;

import java.util.List;

import com.apress.flexjava.usermanager.model.User;

public interface UserDao {
	
	List<User> findAll();
	
}

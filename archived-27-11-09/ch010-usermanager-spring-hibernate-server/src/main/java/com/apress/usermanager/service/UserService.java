package com.apress.usermanager.service;

import java.util.List;
import com.apress.usermanager.model.User;

public interface UserService {

	List<User> getUsers();

	List<User> addUser(User user);

	void removeUserByEmail(String email);

	User getUserByUsername(String username);

	void doLogout();

}

package com.apress.usermanager.dao;

import java.io.IOException;
import java.util.List;
import com.apress.usermanager.model.User;

public interface UserDao {

	List<User> getUsers();

	List<User> addUser(User user) throws IOException;

	void removeUserByEmail(String email);

}

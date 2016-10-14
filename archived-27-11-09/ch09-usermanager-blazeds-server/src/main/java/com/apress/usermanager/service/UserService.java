package com.apress.usermanager.service;

import java.io.IOException;
import java.util.List;
import com.apress.usermanager.model.User;

public interface UserService {

	List<User> getUsers();

	List<User> addUser(User user) throws IOException;

}

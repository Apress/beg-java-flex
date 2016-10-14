package com.apress.usermanager.dao;

import com.apress.usermanager.model.User;

public interface UserDao extends GenericDao<User, Long> {

	void removeUserByEmail(String email);

	User findByUsername(String username);

}

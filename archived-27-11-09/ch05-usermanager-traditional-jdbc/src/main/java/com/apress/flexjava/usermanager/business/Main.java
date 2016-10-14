package com.apress.flexjava.usermanager.business;

import java.util.List;
import com.apress.flexjava.usermanager.dao.UserDao;
import com.apress.flexjava.usermanager.dao.jdbc.UserDaoTraditionalJdbcImpl;
import com.apress.flexjava.usermanager.model.User;

public class Main {

	private static final String JDBC_DRIVE_CLASS_NAME = "com.mysql.jdbc.Driver";
	private static final String JDBC_URL = "jdbc:mysql://localhost:3306/ch06usermanager_test";
	private static final String JDBC_USERNAME = "root";
	private static final String JDBC_PASSWORD = "";

	public static void main(String[] args) {
		UserDao userDao  = new UserDaoTraditionalJdbcImpl(JDBC_DRIVE_CLASS_NAME, JDBC_URL, JDBC_USERNAME, JDBC_PASSWORD);
		List<User> users = userDao.findAll();
		for (User user : users){
			System.out.println(user.getForename() + " " + user.getSurname() );
		}
	}
}

package com.apress.flexjava.usermanager.dao.jdbc;

import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;
import java.util.List;
import com.apress.flexjava.usermanager.dao.UserDao;
import com.apress.flexjava.usermanager.model.User;

public class UserDaoTraditionalJdbcImpl implements UserDao {

	private String driverClassName;
	private String url;
	private String username;
	private String password;

	public UserDaoTraditionalJdbcImpl(String driverClassName, String url,
			String username, String password) {
		this.driverClassName = driverClassName;
		this.url = url;
		this.username = username;
		this.password = password;
	}

	public List<User> findAll() {
		List<User> usersList = new ArrayList<User>();
		String sql = "SELECT * FROM users";
		Connection conn = null;
		try {
			Class.forName(driverClassName);
			conn = DriverManager.getConnection(url, username, password);
			PreparedStatement ps = conn.prepareStatement(sql);
			ResultSet rs = ps.executeQuery();
			while (rs.next()) {
				int userId = rs.getInt("user_id");
				String forename = rs.getString("forename");
				String surname = rs.getString("surname");
				usersList.add(new User(userId, forename, surname));
			}
			rs.close();
			ps.close();
		} catch (SQLException e) {
			throw new RuntimeException(e);
		} catch (ClassNotFoundException e) {
			e.printStackTrace();
		} finally {
			if (conn != null) {
				try {
					conn.close();
				} catch (SQLException e) {
				}
			}
		}

		return usersList;
	}

}

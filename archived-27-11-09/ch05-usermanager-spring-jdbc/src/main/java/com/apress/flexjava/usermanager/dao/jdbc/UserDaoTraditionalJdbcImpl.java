package com.apress.flexjava.usermanager.dao.jdbc;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;
import java.util.List;
import javax.sql.DataSource;
import com.apress.flexjava.usermanager.dao.UserDao;
import com.apress.flexjava.usermanager.model.User;

public class UserDaoTraditionalJdbcImpl implements UserDao {

	private DataSource dataSource;

	public List<User> findAll() {
		List<User> usersList = new ArrayList<User>();
		String sql = "SELECT * FROM users";
		Connection conn = null;
		try{
			conn = dataSource.getConnection();
			PreparedStatement ps = conn.prepareStatement(sql);
			ResultSet rs = ps.executeQuery();
			while(rs.next()){
				int userId      = rs.getInt("user_id");
				String forename = rs.getString("forename");
				String surname  = rs.getString("surname");
				usersList.add(new User(userId, forename, surname));
			}
			rs.close();
			ps.close();
		} catch (SQLException e) {
			throw new RuntimeException(e);
		} finally {
			if(conn != null){
				try{
					conn.close();
				} catch (SQLException e) {}
			}
		}

		return usersList;
	}

	public void setDataSource(DataSource dataSource) {
		this.dataSource = dataSource;
	}

}

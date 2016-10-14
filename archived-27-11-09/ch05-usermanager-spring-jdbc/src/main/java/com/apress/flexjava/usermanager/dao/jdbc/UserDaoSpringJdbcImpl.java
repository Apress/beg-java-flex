package com.apress.flexjava.usermanager.dao.jdbc;

import java.util.List;

import javax.sql.DataSource;

import org.springframework.jdbc.core.simple.ParameterizedBeanPropertyRowMapper;
import org.springframework.jdbc.core.simple.SimpleJdbcDaoSupport;
import com.apress.flexjava.usermanager.dao.UserDao;
import com.apress.flexjava.usermanager.model.User;

public class UserDaoSpringJdbcImpl extends SimpleJdbcDaoSupport implements UserDao {
	public List<User> findAll() {
		String sql="SELECT * FROM users";
		return getSimpleJdbcTemplate().query(sql,ParameterizedBeanPropertyRowMapper.newInstance(User.class));
	}
}

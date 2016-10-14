package com.apress.usermanager.dao.hibernate;

import org.hibernate.Query;
import com.apress.usermanager.dao.UserDao;
import com.apress.usermanager.model.User;


public class UserDaoImpl extends BaseHibernateDao<User, Long> implements UserDao {

	public UserDaoImpl() {
		super(User.class);
	}

	public void removeUserByEmail(String email) {
		Query query = getSession().getNamedQuery(User.DELETE_BY_EMAIL)
        .setString("email", email);
		query.executeUpdate();
	}

	public User findByUsername(String username) {
		return  (User)getSession().getNamedQuery(User.FIND_BY_USERNAME)
        .setString("username", username).uniqueResult();
	}

}

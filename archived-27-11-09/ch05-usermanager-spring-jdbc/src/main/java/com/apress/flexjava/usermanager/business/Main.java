package com.apress.flexjava.usermanager.business;
import java.util.List;
import org.springframework.context.ApplicationContext;
import org.springframework.context.support.ClassPathXmlApplicationContext;
import com.apress.flexjava.usermanager.dao.UserDao;
import com.apress.flexjava.usermanager.model.User;




public class Main {

	public static void main(String[] args) {
		ApplicationContext context = new ClassPathXmlApplicationContext("applicationContext.xml");

		UserDao userDao  = (UserDao)context.getBean("userDao");
		List<User> users = userDao.findAll();
		for (User user : users){
			System.out.println(user.getForename() + " " + user.getSurname() );
		}

	}
}

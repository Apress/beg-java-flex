package com.apress.flexjava.hellofilippo.testannotations;

import org.springframework.context.ApplicationContext;
import org.springframework.context.support.ClassPathXmlApplicationContext;


public class Main {
	public static void main(String[] args) {
		ApplicationContext context = 
			new ClassPathXmlApplicationContext("ApplicationForAnnotationsConfiguration.xml");
		
		HelloFilippoForAnnotationsConfiguration helloFilippo = 
			(HelloFilippoForAnnotationsConfiguration) context.getBean("helloFilippoForAnnotationsConfiguration");
		
		helloFilippo.hello();
	}
}

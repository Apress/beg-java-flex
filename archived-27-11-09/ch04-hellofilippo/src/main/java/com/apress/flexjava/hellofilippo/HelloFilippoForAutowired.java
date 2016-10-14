package com.apress.flexjava.hellofilippo;

import javax.annotation.Resource;

import org.springframework.beans.factory.annotation.Autowired;

public class HelloFilippoForAutowired {
	
	private Message message;
	
	public void hello() {
		System.out.println("Hello Filippo!" + message.getText());
	}
	@Autowired
	@Resource(name="message")
	public void setMessage(Message message) {
		this.message = message;
	}
	
}

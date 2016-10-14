package com.apress.flexjava.hellofilippo;

import org.springframework.beans.factory.annotation.Autowired;
import javax.annotation.Resource;

public class HelloFilippoForProperties {

	private Message message;

	public void hello() {
		System.out.println("Hello Filippo!" + message.getText());
	}
	@Autowired
	@Resource(name="messageForPropertiesBean")
	public void setMessage(Message message) {
		this.message = message;
	}

}

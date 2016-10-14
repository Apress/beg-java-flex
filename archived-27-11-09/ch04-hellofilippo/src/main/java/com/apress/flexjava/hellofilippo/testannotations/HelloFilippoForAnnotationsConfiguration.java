package com.apress.flexjava.hellofilippo.testannotations;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Component;

@Component
public class HelloFilippoForAnnotationsConfiguration {
	
	private MessageForAnnotationConfiguration message;
	
	public void hello() {
		System.out.println("Hello Filippo!" + message.getText());
	}
	
	@Autowired
	public void setMessage(MessageForAnnotationConfiguration message) {
		this.message = message;
	}
	
}

package com.apress.flexjava.hellofilippo;

import java.util.Properties;

public class HelloFilippoForCollectionPropertiesInjection {
	
	private Properties messages;
	
	public void hello() {
		System.out.println("Hello Filippo!");
		messages.list(System.out);
	}

	public void setMessages(Properties messages) {
		this.messages = messages;
	}
}

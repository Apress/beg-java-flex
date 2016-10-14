package com.apress.flexjava.hellofilippo;

import java.util.List;

public class HelloFilippoForCollectionInjection {
	
	private List<String> messages;
	
	public void hello() {
		System.out.println("Hello Filippo!");
		for(String message : messages){
			System.out.println(message);
		}
	}

	public void setMessages(List<String> messages) {
		this.messages = messages;
	}
	
}

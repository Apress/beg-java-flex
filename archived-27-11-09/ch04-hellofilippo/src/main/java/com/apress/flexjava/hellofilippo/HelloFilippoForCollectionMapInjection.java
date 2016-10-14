package com.apress.flexjava.hellofilippo;

import java.util.Map;

public class HelloFilippoForCollectionMapInjection {
	
	private Map<String,String> messages;
	
	public void hello() {
		System.out.println("Hello Filippo!");
		for(Map.Entry<String, String> message : messages.entrySet()){
			System.out.println(message);
		}
	}

	public void setMessages(Map<String, String> messages) {
		this.messages = messages;
	}
}

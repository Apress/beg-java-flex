package com.apress.flexjava.hellofilippo;

import javax.annotation.PostConstruct;

public class HelloFilippoForPreConstruct {
	
	private String message;
	
	public void hello() {
		System.out.println("Hello Filippo!" + message);
	}
	
	@PostConstruct
	private void setHardCodedMessage() {
		this.message = "Wow! It is amazing!";
	}	
}

package com.apress.flexjava.hellofilippo;

public class HelloFilippoForInitMethod {
	
	private String message;
	
	public void hello() {
		System.out.println("Hello Filippo!" + message);
	}
	
	private void setHardCodedMessage() {
		this.message = "This is very cool!";
	}	
}

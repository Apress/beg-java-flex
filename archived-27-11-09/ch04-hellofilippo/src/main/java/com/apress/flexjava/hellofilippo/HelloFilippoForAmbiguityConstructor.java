package com.apress.flexjava.hellofilippo;

public class HelloFilippoForAmbiguityConstructor {
	
private String message;
	
	public void hello() {
		System.out.println("Hello Filippo!" + message);
	}
	
	public HelloFilippoForAmbiguityConstructor(Message message){
		this.message = message.getText();
	}
	
	public HelloFilippoForAmbiguityConstructor(String message){
		this.message = message;
	}
	
}

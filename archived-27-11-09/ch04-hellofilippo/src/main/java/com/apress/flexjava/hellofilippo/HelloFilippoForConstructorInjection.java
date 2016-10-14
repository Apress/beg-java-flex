package com.apress.flexjava.hellofilippo;

public class HelloFilippoForConstructorInjection {
	
	private Message message;
	
	public void hello() {
		System.out.println("Hello Filippo!" + message.getText());
	}
	
	public HelloFilippoForConstructorInjection(Message message){
		this.message = message;
	}
	
}

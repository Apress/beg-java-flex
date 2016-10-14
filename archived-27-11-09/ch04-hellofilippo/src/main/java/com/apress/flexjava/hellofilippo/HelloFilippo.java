package com.apress.flexjava.hellofilippo;

public class HelloFilippo {
	
	private Message message;
	
	public void hello() {
		System.out.println("Hello Filippo!" + message.getText());
	}
	
	public void setMessage(Message message) {
		this.message = message;
	}
	
}

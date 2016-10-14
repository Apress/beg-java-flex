package com.apress.flexjava.hellofilippo;

public class HelloFilippoForBothSetterAndConstructiorInjection {
	
	private Message message;
	
	private String name;
	
	public void hello() {
		System.out.println("Hello " + name + "!" + message.getText());
	}
	
	public void setMessage(Message message) {
		this.message = message;
	}
	
	public HelloFilippoForBothSetterAndConstructiorInjection(String name){
		this.name = name;
	}
	
}

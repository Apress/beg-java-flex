package com.apress.flexjava.hellofilippo.testannotations;

import org.springframework.stereotype.Component;

@Component
public class MessageForAnnotationConfiguration {
	
	private String text = "Welcome to annotations";
	
	public String getText() {
		return text;
	}

}

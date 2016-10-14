package com.apress.usermanager.mail;

import org.springframework.mail.javamail.JavaMailSenderImpl;

public class MailSenderImpl extends JavaMailSenderImpl {

	private String from;

	public String getFrom() {
		return from;
	}

	public void setFrom(String from) {
		this.from = from;
	}

}

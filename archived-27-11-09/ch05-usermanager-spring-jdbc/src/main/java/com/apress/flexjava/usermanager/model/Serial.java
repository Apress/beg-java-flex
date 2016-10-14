package com.apress.flexjava.usermanager.model;

import static javax.persistence.GenerationType.IDENTITY;

import javax.persistence.Column;
import javax.persistence.Entity;
import javax.persistence.GeneratedValue;
import javax.persistence.Id;
import javax.persistence.Table;

@Entity
@Table(name="serials")
public class Serial {

	@Id
	@GeneratedValue(strategy = IDENTITY)
	@Column(name="serial_id")
	private Integer serialId;

	@Column(name="serial")
	private String serial;
	
	

	public Integer getSerialId() {
		return serialId;
	}

	public void setSerialId(Integer serialId) {
		this.serialId = serialId;
	}

	public String getSerial() {
		return serial;
	}

	public void setSerial(String serial) {
		this.serial = serial;
	}



}

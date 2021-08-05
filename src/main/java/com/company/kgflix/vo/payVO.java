package com.company.kgflix.vo;

import java.util.Date;

public class payVO {
	private String id;
	private Date lastday;
	public payVO() {
		super();
	}
	public payVO(String id, Date lastday) {
		super();
		this.id = id;
		this.lastday = lastday;
	}
	public String getId() {
		return id;
	}
	public void setId(String id) {
		this.id = id;
	}
	public Date getLastday() {
		return lastday;
	}
	public void setLastday(Date lastday) {
		this.lastday = lastday;
	}
	
	

}

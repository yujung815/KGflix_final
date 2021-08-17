package com.company.kgflix.vo;

import java.util.Date;


public class MemberVO {
	private int user_no;
	private String id;
	private String pw;
	private String name;
	private String tel;
	private String email;
	private int subs;
	private Date orderday;
	private int status;
	
	
	public int getUser_no() {
		return user_no;
	}
	public void setUser_no(int user_no) {
		this.user_no = user_no;
	}
	public String getId() {
		return id;
	}
	public void setId(String id) {
		this.id = id;
	}
	public String getPw() {
		return pw;
	}
	public void setPw(String pw) {
		this.pw = pw;
	}
	public String getName() {
		return name;
	}
	public void setName(String name) {
		this.name = name;
	}
	public String getTel() {
		return tel;
	}
	public void setTel(String tel) {
		this.tel = tel;
	}
	public String getEmail() {
		return email;
	}
	public void setEmail(String email) {
		this.email = email;
	}
	public int getSubs() {
		return subs;
	}
	public void setSubs(int subs) {
		this.subs = subs;
	}
	public Date getOrderday() {
		return orderday;
	}
	public void setOrderday(Date orderday) {
		this.orderday = orderday;
	}
	public int getStatus() {
		return status;
	}
	public void setStatus(int status) {
		this.status = status;
	}
	public MemberVO(int user_no, String id, String pw, String name, String tel, String email, int subs, Date orderday,
			int status) {
		super();
		this.user_no = user_no;
		this.id = id;
		this.pw = pw;
		this.name = name;
		this.tel = tel;
		this.email = email;
		this.subs = subs;
		this.orderday = orderday;
		this.status = status;
	}
	public MemberVO() {
		super();
	}

	
	
	
	
	
}
	

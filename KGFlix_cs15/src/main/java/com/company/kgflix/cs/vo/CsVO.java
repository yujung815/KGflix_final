package com.company.kgflix.cs.vo;

import java.sql.Date;

public class CsVO {


	private int cs_no;
	private String user_no;
	private String cs_title;
	private String e_mail;
	private String cs_content;
	private Date regdate;
	
	public CsVO() {
		
	}
	

	public int getCs_no() {
		return cs_no;
	}

	public void setCs_no(int cs_no) {
		this.cs_no = cs_no;
	}
	
	public String getUser_no() {
		return user_no;
	}

	public void setUser_no(String user_no) {
		this.user_no = user_no;
	}

	
	public Date getRegdate() {
		return regdate;
	}

	public void setRegdate(Date regdate) {
		this.regdate = regdate;
	}

	public String getE_mail() {
		return e_mail;
	}

	public void setE_mail(String e_mail) {
		this.e_mail = e_mail;
	}

	public String getCs_title() {
		return cs_title;
	}

	public void setCs_title(String cs_title) {
		this.cs_title = cs_title;
	}
	
	
	public String getCs_content() {
		return cs_content;
	}

	public void setCs_content(String cs_content) {
		this.cs_content = cs_content;
	}
	
	
	public CsVO(String user_no,String e_mail,String cs_title, String cs_content) {
		super();
		this.user_no = user_no;
		this.e_mail = e_mail;
		this.cs_title = cs_title;
		this.cs_content = cs_content;	
	}


	public CsVO(int cs_no, String user_no, String e_mail, String cs_title, String cs_content) {
		super();
		this.cs_no = cs_no;
		this.user_no = user_no;
		this.e_mail = e_mail;
		this.cs_title = cs_title;
		this.cs_content = cs_content;
	}

	public CsVO(int cs_no, String user_no, String e_mail, String cs_title, String cs_content, Date regdate) {
		super();
		this.cs_no = cs_no;
		this.user_no = user_no;
		this.e_mail = e_mail;
		this.cs_title = cs_title;
		this.cs_content = cs_content;
		this.regdate = regdate;
	}


	
	


	
}
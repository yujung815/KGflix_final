package com.kgflix.member.vo;

import java.util.List;

public class memberVO {
	private int mNum;
	private String id;
	private String pw;
	private String name;
	private String tel;
	
	public int getmNum() {
		return mNum;
	}
	public void setmNum(int mNum) {
		this.mNum = mNum;
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
	private String email;

	public memberVO(int mNum, String id, String pw, String name, String tel, String email) {
		super();
		this.mNum = mNum;
		this.id = id;
		this.pw = pw;
		this.name = name;
		this.tel = tel;
		this.email = email;
	}
	public memberVO() {
		super();
		// TODO Auto-generated constructor stub
	}
	
	
	/*
	 * private List<movieNumber> mList;
	 */
}

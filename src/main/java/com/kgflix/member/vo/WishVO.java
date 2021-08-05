package com.kgflix.member.vo;

public class WishVO {
	private String user_id;
	private int con_no;
	public WishVO() {
		super();
	}
	public WishVO(String user_id, int con_no) {
		super();
		this.user_id = user_id;
		this.con_no = con_no;
	}
	public String getUser_id() {
		return user_id;
	}
	public void setUser_id(String user_id) {
		this.user_id = user_id;
	}
	public int getCon_no() {
		return con_no;
	}
	public void setCon_no(int con_no) {
		this.con_no = con_no;
	}
	

}

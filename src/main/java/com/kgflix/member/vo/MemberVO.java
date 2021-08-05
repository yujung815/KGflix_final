package com.kgflix.member.vo;



public class MemberVO {
	private int user_no;
	private String id;
	private String pw;
	private String name;
	private String tel;
	private String email;
	private int subs;
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

	public int getStatus() {
		return status;
	}

	public void setStatus(int status) {
		this.status = status;
	}



	

	public MemberVO(int user_no, String id, String pw, String name, String tel, String email, int subs, int status) {
		super();
		this.user_no = user_no;
		this.id = id;
		this.pw = pw;
		this.name = name;
		this.tel = tel;
		this.email = email;
		this.subs = subs;
		this.status = status;
	}

	public MemberVO(String id, String pw, String tel, String email) {
		super();
		this.id = id;
		this.pw = pw;
		this.tel = tel;
		this.email = email;
	}

	public MemberVO(String id, String pw, String name, String tel, String email) {
		super();
		this.id = id;
		this.pw = pw;
		this.name = name;
		this.tel = tel;
		this.email = email;
	}

	
	
	
	
}
	

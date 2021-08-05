package com.company.kgflix.vo;

import java.util.Date;

public class CommentVO {
	private int con_no;
	private String id;
	private Date uptime; 
	private String comment_user;
	private int score;
	
	public CommentVO() {}

	public CommentVO(int con_no, String id, Date uptime, String comment_user, int score) {
		super();
		this.con_no = con_no;
		this.id = id;
		this.uptime = uptime;
		this.comment_user = comment_user;
		this.score = score;
	}

	public int getCon_no() {
		return con_no;
	}

	public void setCon_no(int con_no) {
		this.con_no = con_no;
	}

	public String getId() {
		return id;
	}

	public void setId(String id) {
		this.id = id;
	}

	public Date getUptime() {
		return uptime;
	}

	public void setUptime(Date uptime) {
		this.uptime = uptime;
	}

	public String getComment_user() {
		return comment_user;
	}

	public void setComment_user(String comment_user) {
		this.comment_user = comment_user;
	}

	public int getScore() {
		return score;
	}

	public void setScore(int score) {
		this.score = score;
	}

	
	
	
}

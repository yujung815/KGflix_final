package com.company.kgflix.vo;


import lombok.ToString;


@ToString
public class FavoritesVO {
	
	private String title;
	private int con_no;
	private int free;
	private String id;
	private String user_id;
	private String deleteTitle;
	private String video_uri;
	private String thumb_uri;
	private static int subs;
	public int getFree() {
		return free;
	}
	public void setFree(int free) {
		this.free = free;
	}
	public String getId() {
		return id;
	}
	public void setId(String id) {
		this.id = id;
	}
	public String getUser_id() {
		return user_id;
	}
	public void setUser_id(String user_id) {
		this.user_id = user_id;
	}
	public String getDeleteTitle() {
		return deleteTitle;
	}
	public void setDeleteTitle(String deleteTitle) {
		this.deleteTitle = deleteTitle;
	}
	public String getVideo_uri() {
		return video_uri;
	}
	public void setVideo_uri(String video_uri) {
		this.video_uri = video_uri;
	}
	public String getThumb_uri() {
		return thumb_uri;
	}
	public void setThumb_uri(String thumb_uri) {
		this.thumb_uri = thumb_uri;
	}
	public static int getSubs() {
		return subs;
	}
	public static void setSubs(int subs) {
		FavoritesVO.subs = subs;
	}
	public int getCon_no() {
		return con_no;
	}
	public void setCon_no(int con_no) {
		this.con_no = con_no;
	}
	public String getTitle() {
		return title;
	}
	public void setTitle(String title) {
		this.title = title;
	}

	
}

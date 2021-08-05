package com.company.kgflix.vo;

public class ContentVO {
	private int con_no;
	private String title;
	private String category;
	private int new_no;
	private int pop;
	private int free;
	private String video_uri;
	private String thumb_uri;
	
	public ContentVO() {}

	public ContentVO(int con_no, String title, String category, int new_no, int pop, int free, String video_uri,
			String thumb_uri) {
		super();
		this.con_no = con_no;
		this.title = title;
		this.category = category;
		this.new_no = new_no;
		this.pop = pop;
		this.free = free;
		this.video_uri = video_uri;
		this.thumb_uri = thumb_uri;
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

	public String getCategory() {
		return category;
	}

	public void setCategory(String category) {
		this.category = category;
	}

	public int getNew_no() {
		return new_no;
	}

	public void setNew_no(int new_no) {
		this.new_no = new_no;
	}

	public int getPop() {
		return pop;
	}

	public void setPop(int pop) {
		this.pop = pop;
	}

	public int getFree() {
		return free;
	}

	public void setFree(int free) {
		this.free = free;
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
	
	
}

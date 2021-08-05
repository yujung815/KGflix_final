package com.company.kgflix.vo;

public class login_searchVO {
	
	private MemberVO mvo;
	private String searchItem;
	
	public login_searchVO() {
		super();
	}

	public login_searchVO(MemberVO mvo, String searchItem) {
		super();
		this.mvo = mvo;
		this.searchItem = searchItem;
	}

	public MemberVO getMvo() {
		return mvo;
	}

	public void setMvo(MemberVO mvo) {
		this.mvo = mvo;
	}

	public String getSearchItem() {
		return searchItem;
	}

	public void setSearchItem(String searchItem) {
		this.searchItem = searchItem;
	} 
	
	

}

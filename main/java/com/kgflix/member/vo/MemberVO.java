package com.kgflix.member.vo;

import java.util.Date;

import lombok.Data;


@Data
public class MemberVO {
	private int user_no;
	private String id;
	private String pw;
	private String name;
	private String tel;
	private String email;
	private int subs;
	private Date orderday;
	

	
}
	

package com.kgflix.member.vo;

import java.util.Date;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.web.client.RestTemplate;

import lombok.Data;
@Data
public class memberVO {
	@Autowired private RestTemplate rt;
	
	private int user_no;
	private String id;
	private String pw;
	private String name;
	private String tel;
	private String email;
	private int subs;
	private Date orderday;
	public memberVO() {
		super();
		// TODO Auto-generated constructor stub
	}
	
}
	
	


package com.kgflix.member.vo;

import java.util.Date;

import lombok.AllArgsConstructor;
import lombok.Data;
import lombok.Getter;
import lombok.NoArgsConstructor;
import lombok.NonNull;
import lombok.Setter;
import lombok.ToString;


@Data
public class MemberVO {
	private int user_no;
	private String id;
	private String pw;
	String name;
	private String tel;
	private String email;
	private int subs;
	private Date orderday;
	

	
}
	

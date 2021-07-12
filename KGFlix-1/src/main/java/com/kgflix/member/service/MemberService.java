package com.kgflix.member.service;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.kgflix.member.dao.MemberDAO;

@Service
public class MemberService {
	@Autowired 
	MemberDAO dao;
	
	public String loginStart(){
		
		return null;
		
	}
	
	

}

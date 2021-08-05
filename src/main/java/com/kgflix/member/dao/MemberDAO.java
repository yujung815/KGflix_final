package com.kgflix.member.dao;


import org.apache.ibatis.annotations.Mapper;

import com.kgflix.member.vo.MemberVO;

@Mapper
public interface MemberDAO {
		
	public MemberVO getMembInfo(String id);
	public void insertMember(MemberVO mvo);
	public void updateMembInfo(MemberVO mvo) ;
	public void deleteMembInfo(String id);
	public MemberVO login(String id,String pw);
	public void insertMember(String id, String pw, String name, String tel, String email);
	public int checkOverId(String user_id);//아이디 중복 체크


}
	

package com.kgflix.member.memberdao;

import java.util.List;

import org.apache.ibatis.annotations.Mapper;

import com.kgflix.member.membervo.memberVO;

@Mapper
public interface memberDAO {
	public List<memberVO> memberList();
	public int insertMember(memberVO vo);
	public memberVO viewMember (String userid);
	public void deleteMember(String userid);
	public void updateMember(memberVO vo);
	public boolean checkPw(String userid,String passwd);
	

}

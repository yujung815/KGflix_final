package com.company.kgflix.dao;

import java.util.List;

import org.apache.ibatis.annotations.Mapper;

import com.company.kgflix.vo.UserVO;

@Mapper
public interface UserDAO {
	public List <UserVO> Ad_member();
	public List<UserVO> allinfo();
	public int deleteUser(String id);
	public void updateStatus1(String id);
	public void updateStatus2(String id);
}

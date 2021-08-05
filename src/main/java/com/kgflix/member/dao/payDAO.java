package com.kgflix.member.dao;

import org.springframework.stereotype.Repository;
import org.springframework.stereotype.Service;

import com.kgflix.member.vo.payVO;

@Service
@Repository
public interface payDAO {
	public int insert(String id);
	public payVO getInfo(String id);
	public int update(payVO pvo);
	public int delete(String id);
	
}

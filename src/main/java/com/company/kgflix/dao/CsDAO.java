package com.company.kgflix.dao;

import java.util.List;

import org.apache.ibatis.annotations.Mapper;

import com.company.kgflix.vo.CsVO;

@Mapper
public interface CsDAO {
	public List <CsVO> Ad_cs();
	public void updateStatus(String cs_no, String status);
}

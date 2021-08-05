package com.company.kgflix.cs.dao;



import java.util.ArrayList;
import org.apache.ibatis.annotations.Mapper;
import org.springframework.stereotype.Repository;

import com.company.kgflix.cs.vo.CsVO;


@Repository
@Mapper
public interface CsDAO {

	public ArrayList<CsVO> list(String user_no);	
	public CsVO list2(int cs_no);
	public int insertInfo(CsVO cvo);
	public int deleteInfo(int cs_no);	





}

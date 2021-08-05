package com.company.kgflix.dao;

import java.util.ArrayList;

import org.apache.ibatis.annotations.Mapper;
import org.springframework.stereotype.Repository;

import com.company.kgflix.vo.CommentVO;

@Mapper
@Repository
public interface CommentDAO {
	public ArrayList<CommentVO> search_content(int con_no);
	public boolean delete_comment(int con_no ,String id);
	public boolean regist_comment(int con_no , String id , String comment_user , int score);
	public String score_avg(int con_no);
}

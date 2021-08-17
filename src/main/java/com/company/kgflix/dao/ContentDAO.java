package com.company.kgflix.dao;

import java.util.ArrayList;
import java.util.List;

import org.apache.ibatis.annotations.Mapper;
import org.springframework.stereotype.Repository;

import com.company.kgflix.vo.ContentVO;


@Mapper
@Repository
public interface ContentDAO {
	public ArrayList<ContentVO> getSearchInfo(String title_category);
	public ArrayList<ContentVO> getAllInfo();
	public List<ContentVO> Ad_videoSearch();
	public ContentVO getInfo(String con_no);
	public ContentVO getInfo_no(int con_no);
	public int insertInfo(String title ,String category, int new_no , int pop , int free , String videoPath , String thumbPath);
	int updateInfo(String title,String con_no,String category,int new_no , int pop , int free);
	public int deleteContent(String title);
	public ArrayList<ContentVO> Search_cate(String category); 
	
}

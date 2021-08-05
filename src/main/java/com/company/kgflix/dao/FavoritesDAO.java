package com.company.kgflix.dao;

import java.util.List;

import org.apache.ibatis.annotations.Mapper;

import com.company.kgflix.vo.FavoritesVO;

@Mapper
public interface FavoritesDAO {
	public FavoritesVO login(String id);
	public  void insertFavorites(String userId, int videoCon_no);
	public List<FavoritesVO> getAllInfo(String userId);
	public void deleteFavorites(String userId, String deleteCon_no);
	public FavoritesVO getInfo(String title);
	

}

package com.company.kgflix.dao;

import org.apache.ibatis.annotations.Mapper;

@Mapper
public interface FavoritesFreeDAO {

	Object getFree(int NumCon_no);

}

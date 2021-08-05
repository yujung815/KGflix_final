package com.kgflix.member.dao;

import org.springframework.stereotype.Repository;
import org.springframework.stereotype.Service;

@Service
@Repository
public interface WishDAO {
	public int delete(String id);
}

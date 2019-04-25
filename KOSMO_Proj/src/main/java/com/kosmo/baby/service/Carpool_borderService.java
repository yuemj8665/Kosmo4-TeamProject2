package com.kosmo.baby.service;

import java.util.List;
import java.util.Map;

public interface Carpool_borderService {
	//게시판 목록용
	List<Carpool_borderDTO> selectList(Map map);
	
	//CRUD 작업용
	int delete(Map map);
	int insert(Map map);
	int update(Map map);
	
	//검색용
	Carpool_borderDTO selectOne(Map map);
}


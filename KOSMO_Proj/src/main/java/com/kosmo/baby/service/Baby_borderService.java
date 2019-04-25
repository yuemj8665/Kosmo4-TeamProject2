package com.kosmo.baby.service;

import java.util.List;
import java.util.Map;

public interface Baby_borderService {
	//목록용
	//레코드를 DTO가 아닌 맵에 담는다
	List<Map> selectList(Map map);
	
	//입력 수정 삭제용
	int insert(Map map);
	int delete(Map map);
	int update(Map map);
}

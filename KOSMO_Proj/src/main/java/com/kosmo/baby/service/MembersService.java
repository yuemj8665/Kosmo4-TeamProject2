package com.kosmo.baby.service;

import java.util.List;
import java.util.Map;

public interface MembersService {
	//로그인용
	boolean isMember(Map map);
	//회원가입 아이디 중복확인
	String idCheck(Map map);
	//회원가입 이메일 인증용
	boolean emailConfirm(Map map);
	//목록용
	List<MembersDTO> selectList(Map map);	
	//검색용
	MembersDTO selectOne(Map map);	
	//입력수정삭제용
	int delete(Map map);
	int insert(Map map);
	int update(Map map);
}

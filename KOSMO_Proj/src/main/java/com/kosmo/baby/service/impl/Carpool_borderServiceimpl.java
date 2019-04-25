package com.kosmo.baby.service.impl;

import java.util.List;
import java.util.Map;

import javax.annotation.Resource;

import org.springframework.stereotype.Service;

import com.kosmo.baby.service.Carpool_borderDTO;
import com.kosmo.baby.service.Carpool_borderService;

@Service
public class Carpool_borderServiceimpl implements Carpool_borderService{
	@Resource(name="carpool_borderDAO")
	private Carpool_borderDAO dao;

	
	@Override
	public List<Carpool_borderDTO> selectList(Map map) {
		return dao.selectList(map);
	}

	@Override
	public int delete(Map map) {
		// TODO Auto-generated method stub
		return 0;
	}

	@Override
	public int insert(Map map) {
		
		return dao.insert(map);
	}

	@Override
	public int update(Map map) {
		// TODO Auto-generated method stub
		return 0;
	}

	@Override
	public Carpool_borderDTO selectOne(Map map) {
		return dao.selectOne(map);
	}
	
	
	

}

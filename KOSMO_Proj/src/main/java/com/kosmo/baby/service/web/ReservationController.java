package com.kosmo.baby.service.web;

import javax.annotation.Resource;

import org.springframework.stereotype.Controller;

import com.kosmo.baby.service.impl.ReservationServiceimpl;

@Controller
public class ReservationController {
	//서비스 주입
	@Resource(name="reservationServiceimpl")
	private ReservationServiceimpl service;
	
	//여기에 리퀘스트 맵핑 하셔서 작업하시면 됩니다.

}

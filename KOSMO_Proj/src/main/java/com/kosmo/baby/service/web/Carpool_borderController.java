package com.kosmo.baby.service.web;

import java.text.SimpleDateFormat;
import java.util.List;
import java.util.Map;

import javax.annotation.Resource;

import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;

import com.kosmo.baby.service.Carpool_borderDTO;
import com.kosmo.baby.service.impl.Carpool_borderServiceimpl;

@Controller
public class Carpool_borderController {
	
	//서비스 주입
	@Resource(name="carpool_borderServiceimpl")
	private Carpool_borderServiceimpl service;
	
	//여기다 리퀘스트 맵핑 하셔서 작성하시면 됩니다
	//인설트하기
	@RequestMapping("/Carinsert.kosmo")
	public String carinsert(@RequestParam Map map,Model model)throws Exception{
		System.out.println("인풋 컨트럴러");
		System.out.println(map.get("content"));
		System.out.println(map.get("startposition"));
		service.insert(map);
		
		
		return "forward:Carindex.kosmo";
	}
	
	//리스트 보여주기
	@RequestMapping("/Carindex.kosmo")
	public String carindex(@RequestParam Map map,Model model)throws Exception{
		List<Carpool_borderDTO> list = service.selectList(null);
		SimpleDateFormat format = new SimpleDateFormat("yyyy-MM-dd HH:mm");
		for(int i=0;i<list.size();i++) {
			System.out.println(list.get(i).getCp_No());
			list.get(i).setDate(format.format(list.get(i).getTime()));
		}
		
		model.addAttribute("list", list);		
		return "Car.tiles";
	}
	//상세보기
	@RequestMapping("/Carview.kosmo")
	public String carview(@RequestParam Map map,Model model)throws Exception{
		System.out.println(map.get("no"));
		
		Carpool_borderDTO list=service.selectOne(map);
		System.out.println("sxpos" + list.getStart_Xpos());
		System.out.println("sxpos" + list.getStart_Ypos());
		System.out.println("sxpos" + list.getEnd_Xpos());
		System.out.println("sxpos" + list.getEnd_Ypos());

		SimpleDateFormat format = new SimpleDateFormat("yyyy-MM-dd HH:mm");
		System.out.println(list.getTime());
		list.setDate(format.format(list.getTime()));
		model.addAttribute("dto", list);
		return "Car1.tiles";
	}
	
	
}
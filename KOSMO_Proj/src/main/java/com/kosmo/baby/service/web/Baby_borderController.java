package com.kosmo.baby.service.web;

import java.util.List;
import java.util.Map;

import javax.annotation.Resource;

import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;

import com.kosmo.baby.service.impl.Baby_borderServiceimpl;

@Controller
public class Baby_borderController {
	//서비스 주입
	@Resource(name="baby_borderServiceimpl")
	private Baby_borderServiceimpl service;
	
	//여기다가 이제 리퀘스트 맵핑써서 하심됩니다.
	
	@RequestMapping("/babyinfo.kosmo")
	public String baby_border(@RequestParam Map map,Model model) throws Exception{
		List<Map> list = service.selectList(null);
		System.out.println(list);
		model.addAttribute("list",list);
		return "babyInfo.tiles";
	}
	

}

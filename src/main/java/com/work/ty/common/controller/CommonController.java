package com.work.ty.common.controller;

import java.util.HashMap;
import java.util.List;
import java.util.Map;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseBody;

import com.work.ty.board.model.vo.Board;
import com.work.ty.common.model.service.CommonService;

import lombok.extern.slf4j.Slf4j;

@Controller
@Slf4j
@RequestMapping("/common")
public class CommonController {
	
	@Autowired
	private CommonService commonService;
	

	// navigation 로딩 메소드
	@GetMapping("/navLoding.do")
	@ResponseBody
	public Map<String,Object> nav(){
		Map<String,Object>map = new HashMap<>();
		
		// 서비스 로직
		List<Board>boardList = commonService.navLoding();
		
		// 가져온 boardList 로깅
		log.debug("boardList = {}",boardList);
		
		// map에 보드 리스트를 넣어준 뒤 응답처리.
		map.put("boardList",boardList);
		return map;
	};
	
}

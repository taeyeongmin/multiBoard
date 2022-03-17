package com.work.ty.board.controller;

import java.util.HashMap;
import java.util.List;
import java.util.Map;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.servlet.mvc.support.RedirectAttributes;

import com.work.ty.board.model.service.BoardService;
import com.work.ty.board.model.vo.Board;
import com.work.ty.member.model.vo.Member;

import lombok.extern.slf4j.Slf4j;

@RequestMapping("/board")
@Slf4j
@Controller
public class BoardController {

	@Autowired
	private BoardService boardService;
	
	// 게시판 생성 페이지 이동
	@GetMapping("/createBoard.do")
	public void createBoard() {}
	
	// boardList 가져오기 메소드
	@GetMapping("/boardList.do")
	@ResponseBody
	public Map<String,Object> boardList(){
		
		Map<String,Object>map = new HashMap<>();
	
		// 서비스 로직
		List<Board>boardList = boardService.boardList();
		
		// 가져온 boardList 로깅
		log.debug("boardList = {}",boardList);
		
		// map에 보드 리스트를 넣어준 뒤 응답처리.
		map.put("boardList",boardList);
		return map;
	};
	
	// 게시판 추가
	@PostMapping("/insertBoard.do")
	public String insertBoard(
				Board board
				,HttpServletRequest request
				,RedirectAttributes redirectAttr
			) {		
		// 사용자 입력값 로깅
		log.debug("사용자 입력값 = {}",board);
				
		// session 객체 가져오기 
		HttpSession session = request.getSession();
		
		// 현제 session에 저장되어 있는 로그인 회원의 정보를 가져온다.
		Member loginMember = (Member)session.getAttribute("loginMember");
		
		// 회원정보 로깅
		log.debug("loginMember = {}",loginMember);
		
		// 가져온 회원 객체의 ID를 가져와 board객체에 set해준다.
		board.setId(loginMember.getId());
				
		// 서비스 로직 - 게시판 추가
		int result = boardService.insertBoard(board);
		
		// 결과 로깅
		log.debug("result = {}", result);
		
		// 사용자 메세지 값 redirectAttributes 객체에 담기
		redirectAttr.addFlashAttribute("msg","게시판이 추가되었습니다.");
		
		return "redirect:/";
	}
	
	
	
	
	
	
	
	
}

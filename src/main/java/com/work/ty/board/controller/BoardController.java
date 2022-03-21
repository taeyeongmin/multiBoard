package com.work.ty.board.controller;

import java.util.HashMap;
import java.util.List;
import java.util.Map;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.servlet.mvc.support.RedirectAttributes;

import com.work.ty.board.model.service.BoardService;
import com.work.ty.board.model.vo.Board;
import com.work.ty.common.tyUtils;
import com.work.ty.member.model.vo.Member;
import com.work.ty.post.model.vo.Post;

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
		// log.debug("boardList = {}",boardList);
		
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
	
	// 해당 게시판 이동
	@GetMapping("/boardMove")
	public String getBoard(
				@RequestParam String boardCode				
				,HttpServletRequest request
				,Model model
				,@RequestParam(defaultValue ="1") int cPage
				
			) {
		log.debug("boardCode = {}", boardCode);
		log.debug("cPage = {}",cPage);
		
		// 페이징 처리
		int numPerPage = 5; // 한 페이지 당 게시물 수
		int startNo = cPage * numPerPage - (numPerPage-1); 
		int endNo = cPage * numPerPage;
		
		Map<String,Object> param = new HashMap<>();
		param.put("boardCode", boardCode);
		param.put("startNo", startNo);
		param.put("endNo", endNo);
		
		// 1. 총 게시물 수 구해오기
		int totalCount = boardService.selectTotalCount(boardCode);
		log.debug("총 게시물 수 = {}",totalCount);
		
		// 2. 현재 url 구하기
		String url = request.getRequestURI()+"?boardCode="+boardCode;
		log.debug("현재 url = {}",url);
		
		// 3. 페이지 바 처리
		String pageBar = tyUtils.pageBar(cPage,startNo,endNo,contentCount,url);
		
		// return 해줄 경로를 담을 변수 선언 및 초기화
		String location = "";
		
		// boardCode에 해당하는 board객체 가져오기
		Board board = boardService.selectBoard(boardCode);
		
		// 가져온 board 객체 로깅
		// log.debug("board = {}",board);
		
		// 가져온 board 객체에서 타입을 변수에 담아준 뒤 해당 값을 사용해 리턴 경로를 분기해준다.
		String boardType = board.getBoardType();
		
		// 해당 게시판의 게시물 가져오기 (해당 게시판의 code를 넘겨줘 where절에서 사용한다.)
		List<Post> postList = boardService.selectPostList(param);
		
		log.debug("postList = {}",postList);
		
		if("F".equals(boardType)) {
			location = "/board/boardTypeFrame";
		}else {
			location = "/board/boardTypeList";			
		}
		
		String boardYn = board.getBoardYn();
		
		// session에 boardCode값을 넣어줘 게시물 생성할 때 해당 게시판의 정보를 가져와 사용한다. 게시판 공개여부 정보도 저장
		HttpSession session = request.getSession();
		session.setAttribute("boardCode", boardCode);
		session.setAttribute("boardYn", boardYn);
		
		// postList 넘기기
		model.addAttribute("postList",postList);
	
		// 페이지 바 로깅
		log.debug("페이지 바 = {}", pageBar);
		model.addAttribute("pageBar",pageBar);
		
		return location;
	}
	
	// 게시판 이름 중복검사 비동기처리
	@ResponseBody
	@GetMapping("/boardNameDuplicate.do")
	public Map<String,Object> boardNameDuplicate(
				@RequestParam String boardName
			){
		// 사용자에게 응답해줄 메세지를 담을 변수
		String msg="";
		// jsp에서 중복 여부를 판단 할 코드로 사용할 값(0 == 사용 불가능, 1 == 사용가능)
		int posibleCode = 0;
		// 데이터를 전달 할 map객체 생성
		Map<String,Object> map = new HashMap<>();
		
		// 사용자 입력값 로깅
		log.debug("boardName = {}",boardName);
		
		// 서비스 로직 : 사용자 입력값을 메소드에 담아 호출한 뒤 입력값과 동일한 게시판 이름이 존재한다면 해당 board객체를 가져온다.
		Board board = boardService.boardNameDuplicate(boardName);
		
		// 리턴 값 로깅
		log.debug("board = {}", board);
		
		// 분기처리
		if(board == null) {
			msg = "["+boardName+"] 는 사용가능합니다.";
			posibleCode = 1;
			
		}else {
			msg = "["+boardName+"] 는 이미 사용중입니다.";
		}
		
		// 응답 정보 put
		map.put("msg", msg);
		map.put("posibleCode", posibleCode);
		
		return map;
	}
	
	
	
	
	
}

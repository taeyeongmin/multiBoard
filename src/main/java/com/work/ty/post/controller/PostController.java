package com.work.ty.post.controller;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;

import com.work.ty.board.model.service.BoardService;
import com.work.ty.board.model.vo.Board;

import lombok.extern.slf4j.Slf4j;

@RequestMapping("/post")
@Slf4j
@Controller
public class PostController {

	@Autowired
	private BoardService boardService;
	
	// 게시판 생성 페이지 이동
	@GetMapping("/createPost.do")
	public void createPost(
				@RequestParam String boardCode
				,Model model
			) {
		
		// 게시판에서 전달받은 boardCode 로깅
		log.debug("boardCode = {}",boardCode);
		
		// 해당 boardCode를 사용하여 board객체를 가져온다.(boardController에서 쓴 메소드 사용)
		Board board = boardService.selectBoard(boardCode);
		
		// board 객체 로깅
		log.debug("board = {}",board);
		
		// board 객체를 model 객체에 담아 jsp에 전달
		model.addAttribute("board",board);
		
		
	}

	
}

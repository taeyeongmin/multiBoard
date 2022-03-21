package com.work.ty.post.controller;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.servlet.mvc.support.RedirectAttributes;

import com.work.ty.board.model.service.BoardService;
import com.work.ty.board.model.vo.Board;
import com.work.ty.member.model.vo.Member;
import com.work.ty.post.model.service.PostService;
import com.work.ty.post.model.vo.Post;

import lombok.extern.slf4j.Slf4j;

@RequestMapping("/post")
@Slf4j
@Controller
public class PostController {

	@Autowired
	private BoardService boardService;
	
	@Autowired
	private PostService postService;
	
	// 게시판 생성 페이지 이동
	@GetMapping("/createPost.do")
	public void createPost(
				@RequestParam String boardCode
				,HttpServletRequest request
				,Model model
			) {
		 
		
		// 게시판에서 전달받은 boardCode 로깅
		log.debug("boardCode = {}",boardCode);
		
		// 현재 로그인 회원 아이디 가져오기
		HttpSession session = request.getSession();
		Member loginMember = (Member)session.getAttribute("loginMember");
		String loginMemberId = loginMember.getId();
		
		// 해당 boardCode를 사용하여 board객체를 가져온다.(boardController에서 쓴 메소드 사용)
		Board board = boardService.selectBoard(boardCode);
		
		// board 객체 로깅
		log.debug("board = {}",board);
		
		// board 객체를 model 객체에 담아 jsp에 전달
		model.addAttribute("board",board);
		model.addAttribute("loginMemberId",loginMemberId);
		
		
	}
	
	// 게시물 생성
	@PostMapping("/createPost.do")
	public String createPost(
		@RequestParam String boardCode	
		,@RequestParam String loginMemberId
		,Post post
		,RedirectAttributes redirectAttr
		
	) {
	
		
		// 사용자 응답 메시지를 담을 변수
		String msg="게시물을 등록했습니다.";
		
		// 가져온 정보를 게시물 객체에 set
		post.setBoardCode(boardCode);
		post.setId(loginMemberId);
		
		log.debug("post = {}",post);
	
		// 서비스 로직 (게시물 생성)
		int result = postService.insertPost(post);
		
		log.debug("result = {}",result);
		
		// jsp에 메세지 전달
		redirectAttr.addFlashAttribute("msg",msg);
		
		// 해당 게시판으로 이동
		return "redirect:/board/boardMove?boardCode="+boardCode;
	}
	
}

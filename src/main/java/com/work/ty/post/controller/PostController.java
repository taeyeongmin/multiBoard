package com.work.ty.post.controller;

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
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.servlet.mvc.support.RedirectAttributes;

import com.work.ty.board.model.service.BoardService;
import com.work.ty.board.model.vo.Board;
import com.work.ty.member.model.vo.Member;

import lombok.extern.slf4j.Slf4j;

@RequestMapping("/post")
@Slf4j
@Controller
public class PostController {

	@Autowired
	private BoardService boardService;
	
	// 게시판 생성 페이지 이동
	@GetMapping("/createPost.do")
	public void createPost() {}

	
}

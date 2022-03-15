package com.work.ty.member.controller;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.SessionAttributes;
import org.springframework.web.servlet.mvc.support.RedirectAttributes;

import com.work.ty.member.model.service.MemberService;
import com.work.ty.member.model.vo.Member;

import lombok.extern.slf4j.Slf4j;


@RequestMapping("/member")
@Slf4j
@Controller
public class MemberController {
	
	@Autowired
	private MemberService memberService;
	
	// 로그인 페이지 이동
	@GetMapping("/memberLogin.do")
	public void getLogin() {
		
	}
	
	// 회원가입 페이지 이동
	@GetMapping("/memberEnroll.do")
	public void getEnrollMember() {
		log.debug("회원가입 페이지 이동");
		
	}
	
	// 회원 가입 post 요청
	@PostMapping("/memberEnroll.do")
	public String postEnrollMember(
			RedirectAttributes redirectAttr,
			Member member

			) {
		// 사용자 메세지 담을 변수
		String msg = "";
		
		// 사용자 입력값 로깅
		log.debug("Member = {}",member);

		// 서비스 로직
		int result = memberService.memberEnroll(member);
		// 결과 확인
		log.debug("결과 = {}",result);
		
		// 메세지 분기처리
		msg = "회원가입을 축하드립니다.";
		// msg 변수에 메세지를 담아 index페이지까지 넘겨준다.(1회성)
		redirectAttr.addFlashAttribute("msg",msg);
		log.debug("msg = {} ",msg);

		return "redirect:/";
	}
	
	
	
	
}

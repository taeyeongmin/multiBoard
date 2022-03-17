package com.work.ty.member.controller;

import java.util.HashMap;
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
	
	// 로그인 처리
	@PostMapping("/memberLogin.do")
	public String postLogin(
			Member member
			,RedirectAttributes redirectAttr
			,HttpServletRequest request
			) {
		
		// redirect 경로를 담을 변수
		String location = "redirect:/";
		// 응답 메세지 담을 변수
		String msg = "";
		
		// session 객체 생성
		HttpSession session = request.getSession();
		
		// 사용자 입력값 로깅
		log.debug("member = {}",member);
		
		// 서비스 로직 
		Member loginMember = memberService.memberLogin(member);
		
		// 리턴 된 회원 객체 로깅
		log.debug("loginMember = {}",loginMember);
		
		
		// 입력한 아아디와 일치하는 회원이 있는 경우 비밀번호 체크
		if(loginMember != null) {
			// 입력한 비밀번호와 객체의 비밀번호가 일치하는 경우 session에 회원정보 저장
			if(member.getPwd().equals(loginMember.getPwd())) {
				// session 객체에 로그인한 회원정보 저장
				session.setAttribute("loginMember", loginMember);
				msg = "["+loginMember.getName() +"]님 안녕하세요";
			}
			else {
				msg = "비밀번호가 일치하지 않습니다.";
			}
		// 입력한 아이디와 동일한 회원이 없는 경우
		}else {
			msg = "입력한 아이디는 존재하지 않습니다.";
			
			// 입력한 아이디가 존재하지 않는다면 다시 로그인 페이지로 redirect 
			location = "redirect:/member/memberLogin.do";	
		}
		
		// msg 변수에 담은 문자열을 redirectAttributes 객체에 담아 1회성 session 객체로 사용한다.
		redirectAttr.addFlashAttribute("msg",msg);
		
		// 지정한 경로로 redirect 처리
		return location;
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

		// 로그인 페이지로 이동
		return "redirect:/member/memberLogin.do";
	}
	// 로그아웃 처리
	@GetMapping("/memberLogout.do")
	public String memberLogout(
				HttpServletRequest request
				,RedirectAttributes redirectAttr
			) {
		// session객체 생성
		HttpSession session = request.getSession();
		
		// 현재 session에 저장된 값 지우기
		session.invalidate();
		
		// 사용자 응답 메세지
		redirectAttr.addFlashAttribute("msg","로그아웃 완료.");
		
		// index 페이지로 이동
		return "redirect:/";
	}
	
	
	// 아아디 중복검사 비동기처리
	@ResponseBody
	@GetMapping("/idDuplicate.do")
	public Map<String,Object> idDuplicate(
				@RequestParam String inputId
			){
		// 사용자에게 응답해줄 메세지를 담을 변수
		String msg="";
		// jsp에서 중복 여부를 판단 할 코드로 사용할 값(0 == 사용 불가능, 1 == 사용가능)
		int posibleCode = 0;
		// 데이터를 전달 할 map객체 생성
		Map<String,Object> map = new HashMap<>();
		
		// 사용자 입력값 로깅
		log.debug("inputId = {}",inputId);
		
		// 서비스 로직 : 사용자 입력값을 메소드에 담아 호출한 뒤 입력값과 동일한 아이디가 존재한다면 해당 member객체를 가져온다.
		Member member = memberService.idDuplecate(inputId);
		
		// 리턴 값 로깅
		log.debug("member = {}", member);
		
		// 분기처리
		if(member == null) {
			msg = "["+inputId+"] 는 사용가능합니다.";
			posibleCode = 1;
			
		}else {
			msg = "["+inputId+"] 는 이미 사용중입니다.";
		}
		
		// 응답 정보 put
		map.put("msg", msg);
		map.put("posibleCode", posibleCode);
		
		return map;
	}
	
	
	
	
}

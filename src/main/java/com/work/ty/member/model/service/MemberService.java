package com.work.ty.member.model.service;

import com.work.ty.member.model.vo.Member;


public interface MemberService {

	// 회원가입 post요청
	int memberEnroll(Member member);

	// 아이디 중복검사
	Member idDuplecate(String inputId);

	// 로그인 처리
	Member memberLogin(Member member);

}

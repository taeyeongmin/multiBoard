package com.work.ty.member.model.dao;

import com.work.ty.member.model.vo.Member;


public interface MemberDao {

	// 회원가입 post요청
	int memberEnroll(Member member);

	// 아아디 중복검사
	Member idDuplicate(String inputId);

	// 로그인 처리
	Member memberLogin(Member member);

	// 기본 회원 권한 추가
	int authorityInsert(Member member);

}

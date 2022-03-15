package com.work.ty.member.model.dao;

import com.work.ty.member.model.vo.Member;

public interface MemberDao {

	// 회원가입 post요청
	int memberEnroll(Member member);

}

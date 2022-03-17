package com.work.ty.member.model.dao;

import org.apache.ibatis.session.SqlSession;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import com.work.ty.member.model.vo.Member;


@Repository
public class MemberDaoImpl implements MemberDao {

	@Autowired
	private SqlSession session;

	// 회원가입 post요청
	@Override
	public int memberEnroll(Member member) {
		return session.insert("member.memberEnroll",member);
	}

	// 아이디 중복검사
	@Override
	public Member idDuplicate(String inputId) {
		return session.selectOne("member.idDuplicate",inputId);
	}

	// 로그인 처리
	@Override
	public Member memberLogin(Member member) {
		return session.selectOne("member.memberLogin",member);
	}

	// 기본 회원 권한 추가
	@Override
	public int authorityInsert(Member member) {
		return session.insert("member.authorityInsert",member);
	}
}

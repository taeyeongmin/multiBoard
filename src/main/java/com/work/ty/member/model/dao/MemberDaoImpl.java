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
}

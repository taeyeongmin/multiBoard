package com.work.ty.member.model.service;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.work.ty.member.exception.SqlException;
import com.work.ty.member.model.dao.MemberDao;
import com.work.ty.member.model.vo.Member;

import lombok.extern.log4j.Log4j;

@Log4j
@Service
public class MemberServiceImpl implements MemberService {
	
	@Autowired
	private MemberDao memberDao;
	
	// 회원가입 post요청
	@Override
	public int memberEnroll(Member member) {
		int result = 0;
		try {
			// 서비스 로직
			result = memberDao.memberEnroll(member);
		} catch (Exception e) {
			// error log 출력
			log.error(e.getMessage());
			throw new SqlException("회원등록 오류입니다.",e);
		}
		
		return result;
	}

	// 아이디 중복검사
	@Override
	public Member idDuplecate(String inputId) {
		return memberDao.idDuplicate(inputId);
	}
	
}

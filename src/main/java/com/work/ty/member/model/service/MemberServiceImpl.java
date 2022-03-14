package com.work.ty.member.model.service;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.work.ty.member.model.dao.MemberDao;

import lombok.extern.log4j.Log4j;

@Log4j
@Service
public class MemberServiceImpl implements MemberService {
	
	@Autowired
	private MemberDao memberDao;
	
}

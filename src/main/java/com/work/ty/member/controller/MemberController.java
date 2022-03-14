package com.work.ty.member.controller;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;

import com.work.ty.member.model.service.MemberService;

import lombok.extern.slf4j.Slf4j;



@Slf4j
@Controller
public class MemberController {
	
	@Autowired
	private MemberService memberService;
	
	
	
}

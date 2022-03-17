package com.work.ty.common.model.service;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.work.ty.board.model.vo.Board;
import com.work.ty.common.model.dao.CommonDao;

import lombok.extern.slf4j.Slf4j;

@Service
@Slf4j
public class CommonServiceImpl implements CommonService {

	@Autowired
	private CommonDao commonDao;

	
	
}

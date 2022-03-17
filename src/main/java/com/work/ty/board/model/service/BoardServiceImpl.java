package com.work.ty.board.model.service;

import java.util.List;
import java.util.Map;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.work.ty.board.exception.insertBoardException;
import com.work.ty.board.model.dao.BoardDao;
import com.work.ty.board.model.vo.Board;

import lombok.extern.slf4j.Slf4j;

@Service
@Slf4j
public class BoardServiceImpl implements BoardService {

	@Autowired
	private BoardDao boardDao;

	// board 리스트 가져오기
	@Override
	public List<Board> boardList() {
		return boardDao.boardList();
	}

	// 게시판 추가
	@Override
	public int insertBoard(Board board) {
		int result;
		
		try {
			// 게시판 추가
			result = boardDao.insertBoard(board);
		} catch (Exception e) {
			// 게시판 추가 예외처리
			log.error(e.getMessage());
			throw new insertBoardException("게시판 추가 오류,",e);
		}
		
		return result;
	}

	// board 객체 하나 가져오기
	@Override
	public Board selectBoard(String boardCode) {
		return boardDao.selectBoard(boardCode);
	}
}

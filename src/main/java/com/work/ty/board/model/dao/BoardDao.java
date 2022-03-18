package com.work.ty.board.model.dao;

import java.util.List;
import java.util.Map;

import com.work.ty.board.model.vo.Board;

public interface BoardDao {

	// board 리스트 가져오기
	List<Board> boardList();
	
	// 게시판 추가
	int insertBoard(Board board);

	// board 객체 가져오기
	Board selectBoard(String boardCode);

	// 게시판명 중복검사
	Board boardNameDuplicate(String boardName);

}

package com.work.ty.board.model.service;

import java.util.List;
import java.util.Map;

import com.work.ty.board.model.vo.Board;

public interface BoardService {

	// board 리스트 가져오기
	List<Board> boardList();

	// 게시판 추가
	int insertBoard(Board board);

}

package com.work.ty.board.model.dao;

import java.util.List;
import java.util.Map;

import com.work.ty.board.model.vo.Board;
import com.work.ty.post.model.vo.Post;

public interface BoardDao {

	// board 리스트 가져오기
	List<Board> boardList();
	
	// 게시판 추가
	int insertBoard(Board board);

	// board 객체 가져오기
	Board selectBoard(String boardCode);

	// 게시판명 중복검사
	Board boardNameDuplicate(String boardName);

	// 게시물 리스트 가져오기
	List<Post> selectPostList(Map<String, Object> param);

	// 총 게시물 수 가져오기
	int selectTotalCount(String boardCode);

}

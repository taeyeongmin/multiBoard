package com.work.ty.board.model.dao;

import java.util.List;
import java.util.Map;

import org.apache.ibatis.session.SqlSession;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import com.work.ty.board.model.vo.Board;

@Repository
public class BoardDaoImpl implements BoardDao {

	@Autowired
	private SqlSession session;

	// board 리스트 가져오기
	@Override
	public List<Board> boardList() {
		return session.selectList("board.boardList");
	}

	// 게시판 추가
	@Override
	public int insertBoard(Board board) {
		return session.insert("board.insertBoard",board);
	}
	
	// board 객체 가져오기
	@Override
	public Board selectBoard(String boardCode) {
		return session.selectOne("board.selectBoard",boardCode);
	}

	// 게시판명 중복검사s
	@Override
	public Board boardNameDuplicate(String boardName) {
		return session.selectOne("board.boardNameDuplicate",boardName);
	}

	
	
}

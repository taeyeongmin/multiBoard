package com.work.ty.common.model.dao;

import java.util.List;

import org.apache.ibatis.session.SqlSession;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import com.work.ty.board.model.vo.Board;

@Repository
public class CommonDaoImpl implements CommonDao {

	@Autowired
	private SqlSession session;

	// board 리스트 가져오기
	@Override
	public List<Board> navLoding() {
		return session.selectList("board.navLoding");
	}
}

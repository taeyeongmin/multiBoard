package com.work.ty.post.model.dao;

import org.apache.ibatis.session.SqlSession;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import com.work.ty.post.model.vo.Post;

@Repository
public class PostDaoImpl implements PostDao {

	
	@Autowired
	private SqlSession session;
	
	// 게시물 생성
	@Override
	public int insertPost(Post post) {
		return session.insert("post.insertPost",post);
	}
	
	
}

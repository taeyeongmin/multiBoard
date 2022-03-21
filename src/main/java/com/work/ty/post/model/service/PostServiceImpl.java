package com.work.ty.post.model.service;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.work.ty.post.exception.InsertPostException;
import com.work.ty.post.model.dao.PostDao;
import com.work.ty.post.model.vo.Post;

import lombok.extern.slf4j.Slf4j;

@Slf4j
@Service
public class PostServiceImpl implements PostService {


	@Autowired
	private PostDao postDao;

	// 게시물 생성
	@Override
	public int insertPost(Post post) {
		int result = 0;
		// 게시물 생성 예외처리
		try {
			// 서비스 로직
			result = postDao.insertPost(post);
		} catch (Exception e) {
			log.error(e.getMessage());
			throw new InsertPostException("게시물 생성 오류,e");
		}
		return result;
	}
}

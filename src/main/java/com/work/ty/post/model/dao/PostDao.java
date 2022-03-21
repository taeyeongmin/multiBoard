package com.work.ty.post.model.dao;

import com.work.ty.post.model.vo.Post;

public interface PostDao {
	
	// 게시물 생성
	int insertPost(Post post);

}

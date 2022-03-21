package com.work.ty.post.model.vo;

import java.io.Serializable;
import java.sql.Date;

import lombok.Data;

@Data
public class Post implements Serializable {
	/**
	 * 
	 */
	private static final long serialVersionUID = 1L;

	private int postNo; // post의 pk, 시퀀스 사용
	private String id; // 게시물 생성자 id
	private String boardCode; // 해당 게시판의 코드
	private Date regDate; // 등록일
	private int heartCount; // 좋아요 갯수
	private String title; 
	private String content;
	
}

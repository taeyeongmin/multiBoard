package com.work.ty.board.model.vo;

import lombok.Data;

@Data
public class Board {
	private String boardCode;
	private String id;
	private String boardType;
	private String boardName;
	private int pagebarCount;
	private int postCount;
	private String commentYn;
	private String attachYn;
	private int fileCount;
}

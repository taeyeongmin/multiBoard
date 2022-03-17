package com.work.ty.board.model.vo;

import lombok.Data;

@Data
public class Board {
	private String boardCode;
	private String id;
	private String boardName;
	private String boardType;
	private String boardYn;
	private String attachYn;
	private int attachCount;
	private int pagebarCount;
	private int postCount;
	private String commentYn;
}

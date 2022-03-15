package com.work.ty.member.model.vo;

import java.sql.Date;

import lombok.AllArgsConstructor;
import lombok.Data;
import lombok.NoArgsConstructor;

@Data
@NoArgsConstructor
@AllArgsConstructor
public class Member {
	private String id;
	private String name;
	private String pwd;
	private String birthDate;
	private String nick;
	private Date enrollDate;
	private Date delDate;
	
}

package com.bitc.intranet.vo;

import java.util.Date;

import lombok.Getter;
import lombok.Setter;
import lombok.ToString;

@ToString
@Getter
@Setter
public class OfficialVO {

	private int ono;
	private String dep;
	private String job;
	private String title;
	private String content;
	private String writer;
	private String approve;
	private Date date;
}

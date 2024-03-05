package com.bitc.intranet.vo;

import java.util.Date;

import lombok.Data;

@Data
public class AccuseVO {

	private int bno;
	private String title;
	private String content;
	private String writer;
	private int origin;
	private int depth;
	private int seq;
	private Date regdate;
	private Date updatedate;
	private int viewcnt;
	private String showboard;
	private  int uno;
	

}

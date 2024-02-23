package com.bitc.intranet.vo;

import java.util.Date;

import lombok.Data;

@Data
public class CommentVO {
	
	private int noti_cno;
	private int bno;
	private String noti_content;
	private String author;
	private Date noti_regdate;
	private Date noti_updatedate;
}

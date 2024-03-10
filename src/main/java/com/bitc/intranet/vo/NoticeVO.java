package com.bitc.intranet.vo;

import java.util.Date;
import java.util.List;

import lombok.Data;

@Data
public class NoticeVO {

	private int bno;
	private String title;
	private String category;
	private String content;
	private String writer;
	private Date regdate;
	private int viewcnt;
	
	// 파일목록 출력용
	private List<String> files;
}

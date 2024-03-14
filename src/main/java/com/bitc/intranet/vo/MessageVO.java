package com.bitc.intranet.vo;

import java.util.Date;
import java.util.List;

import lombok.Data;

@Data
public class MessageVO {

	private int uno;
	private int mno;
	private String title;
	private String content;
	private String targetid;
	private String Writer;
	private Date opendate;
	private Date senddate;

	private List<String> files;
}

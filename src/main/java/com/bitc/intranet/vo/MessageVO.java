package com.bitc.intranet.vo;

import java.util.Date;
import java.util.List;

import lombok.Data;

@Data
public class MessageVO {

	private int mno;
	private String targetid;
	private String sender;
	private String message;
	private Date opendate;
	private Date senddate;

	private List<String> files;
}

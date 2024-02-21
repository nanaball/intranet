package com.bitc.intranet.vo;

import java.util.Date;

import lombok.Getter;
import lombok.Setter;
import lombok.ToString;

@Getter
@Setter
@ToString
public class CalendarVO {

	private int cno;
	private String schedule;
	private Date date;
}

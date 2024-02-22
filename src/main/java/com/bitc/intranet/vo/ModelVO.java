package com.bitc.intranet.vo;

import java.util.Date;

import lombok.Data;

@Data
public class ModelVO {

	private int mNo;
	private String mName;
	private int price;
	private int stoke;
	private boolean soldout;
	private boolean pay;
	private Date pDate;
}

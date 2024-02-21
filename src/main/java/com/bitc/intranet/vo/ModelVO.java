package com.bitc.intranet.vo;

import java.util.Date;

import lombok.Getter;
import lombok.Setter;
import lombok.ToString;

@Getter
@Setter
@ToString
public class ModelVO {

	private int mNo;
	private String mName;
	private int price;
	private int stoke;
	private boolean soldout;
	private boolean pay;
	private Date pDate;
}

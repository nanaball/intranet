package com.bitc.intranet.vo;

import java.util.Date;

import lombok.Data;

@Data
public class WelfareVO {

	private int num;			// 복지 상품 번호
	private String model;		// 복지 상품 이름
	private String intro;		// 복지 상품 설명
	private int price;			// 복지 상품 가격
	private int stock;			// 복지 상품 재고
	private String soldout;		// 복지 상품 솔드아웃?
	private String pay;			// 복지 상품 결제완료
	private Date pDate;			// 복지 상품 결제 시간
	
}


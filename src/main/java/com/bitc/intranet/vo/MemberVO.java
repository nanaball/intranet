package com.bitc.intranet.vo;

import java.util.Date;

import org.springframework.format.annotation.DateTimeFormat;

import lombok.Data;

@Data
public class MemberVO {

	private int uno;			// 사원번호
	private String uid;			// 아이디
	private String upw;			// 비밀번호
	private String repw;        // 비밀번호 찾기후 변경된 비밀번호
	private String newUpw;		// 비밀번호 수정
	private String uemail;		// 이메일
	private String uphone;		// 전화번호
	private String uname;		// 이름
	private String udep;		// 부서
	private String ujob;		// 직책
	@DateTimeFormat(pattern = "yyyy-MM-dd")
	private Date udate;			// 입사일
	private String uaddr;		// 주소
}

package com.bitc.intranet.service;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

public interface findPassService {

	public interface FindPassService {
		/**
		 * 비밀번호 찾기 메일 발송 요청 <br/>
		 * @param request -uid, uname(사용자 이름) <br/>
		 * @param response - 요청 처리 정보에 따라 화면 전환  <br/>
		 */
		void findPassSubmit(HttpServletRequest request,
				            HttpServletResponse response);
		
		
		/**이메일을 확인하여 비밀번호 변경 페이지 요청 처리 <br/>
		 * @param request - id(email), code <br/>
		 * @param response -정상적으로 이메일로 페이지 요청했는지 code로 확인후 요청처리 <br/>
		 */
		void changePassCode(HttpServletRequest request,
	            			HttpServletResponse response);
		/**
		 * @implNote 변경 페이지에서 새로운 비밀번호를 전달 받아 비밀번호 정보 수정
		 * @param request -id(email), code, pass
		 * @param response - 비밀번호 변경 요청 처리 결과 응답
		 */
		void changePass();

	}

}

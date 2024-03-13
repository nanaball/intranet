package com.bitc.intranet.interceptor;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.web.servlet.HandlerInterceptor;

import com.bitc.intranet.mapper.NoticeMapper;
import com.bitc.intranet.vo.MemberVO;
import com.bitc.intranet.vo.NoticeVO;

import lombok.extern.slf4j.Slf4j;

@Slf4j
public class AuthInterceptor implements HandlerInterceptor {
	
	@Autowired
	NoticeMapper mapper;

	@Override
	public boolean preHandle(HttpServletRequest request, HttpServletResponse response, Object handler)
			throws Exception {
		log.info("AuthInterceptor preHandler START");
		// 전체 URL 요청 경로
		String requestURI = request.getRequestURI();
		// 프로젝트 경로
		String contextPath = request.getContextPath();
		// session에 저장된 로그인된 사용자 정보
		Object obj = request.getSession().getAttribute("loginMember");
		if(obj == null) {
			// 미로그인 사용자
			response.sendRedirect(contextPath+"/");
			return false;
		}else{
			// 로그인 된 사용자
			if(requestURI.startsWith(contextPath+"/Notice/")) {
				return true;
			}
			if(requestURI.startsWith(contextPath+"/free/")) {
				return true;
			}
			if(requestURI.startsWith(contextPath+"/accuse/")) {
				return true;
			}
			if(requestURI.startsWith(contextPath+"/Welfare/")) {
				return true;
			}
			if(requestURI.startsWith(contextPath+"/message/")) {
				return true;
			}
			
			if(requestURI.startsWith(contextPath+"/main/")) { 
				return true; 
			}
			
			// 관리자 페이지 요청
			if(requestURI.equals(contextPath+"/member/memberList")){
				
				MemberVO member = (MemberVO)obj;
				if(member.getUjob().equals("관리자")) {
					// 관리자
					return true;
				}else {
					// 일반
					response.sendRedirect(contextPath+"/main");
					return true;
				}
			}
		}
		
		log.info("AuthInterceptor preHandler END");
		return true;
		
		// 모든 경우의 수에 return 값이 존재하기에 필요없어 빨간줄이 뜨는 것
		// log.info("AuthInterceptor preHandler END");
		// return true;
	}
	
}

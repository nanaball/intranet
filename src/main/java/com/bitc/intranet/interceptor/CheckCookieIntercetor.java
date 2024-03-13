package com.bitc.intranet.interceptor;

import javax.servlet.http.Cookie;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.web.servlet.HandlerInterceptor;
import org.springframework.web.util.WebUtils;

import com.bitc.intranet.mapper.MemberMapper;
import com.bitc.intranet.vo.MemberVO;

import lombok.extern.slf4j.Slf4j;

@Slf4j
public class CheckCookieIntercetor implements HandlerInterceptor {
	
	// 로그인 확인
	@Autowired
	MemberMapper mapper;

	@Override
	public boolean preHandle(HttpServletRequest request, HttpServletResponse response, Object handler)
			throws Exception {
		HttpSession session = request.getSession();
		if(session.getAttribute("userInfo")!=null) {
			log.info("이미 로그인 된 사용자");
			return true;
		}
		
		Cookie cookie = WebUtils.getCookie(request, "signInCookie");
		if(cookie != null) {
			String uid = cookie.getValue();
			MemberVO userInfo = mapper.readMember(uid);
			session.setAttribute("userInfo", userInfo);
			log.info("Cookie로 session 정보 등록 : {}",userInfo);
		}
		return true;
	}

	
}

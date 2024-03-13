package com.bitc.intranet.interceptor;

import javax.servlet.http.Cookie;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import org.springframework.ui.ModelMap;
import org.springframework.web.servlet.HandlerInterceptor;
import org.springframework.web.servlet.ModelAndView;

import com.bitc.intranet.vo.LoginDTO;
import com.bitc.intranet.vo.MemberVO;

import lombok.extern.slf4j.Slf4j;

@Slf4j
public class SignIninterceptor implements HandlerInterceptor {

	@Override
	public boolean preHandle(HttpServletRequest request, HttpServletResponse response, Object handler)
			throws Exception {
		HttpSession session = request.getSession();
		if(session.getAttribute("loginResult") != null) {
			session.removeAttribute("loginResult");
		}
		return true;
	}

	@Override
	public void postHandle(HttpServletRequest request, HttpServletResponse response, Object handler,
			ModelAndView modelAndView) throws Exception {
		HttpSession session = request.getSession();
		MemberVO loginMember = (MemberVO)session.getAttribute("loginResult");
		log.info("------ interceptor user info : {}",loginMember);
		
		ModelMap modelObj = modelAndView.getModelMap();
		LoginDTO dto = (LoginDTO)modelObj.get("loginDTO");
		log.info("------ interceptor login dto : {}",dto);
		
		if(loginMember != null) {
			// 정상적으로 로그인 된 상태
			if(dto.isUserCookie()) {
				// 자동로그인 요청
				Cookie cookie = new Cookie("signInCookie",loginMember.getUid());
				cookie.setPath("/");
				cookie.setMaxAge(60*60*8);
				response.addCookie(cookie);
			}
			
		}else {
			// 잘못된 사용자 정보로 로그인 요청
			String message = "로그인 실패";
			modelAndView.addObject("message",message);
			modelAndView.setViewName("redirect:/main");
		}
	}
	
}

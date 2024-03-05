package com.bitc.intranet.controller;

import java.util.Locale;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;

import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;

import com.bitc.intranet.service.BoardService;
import com.bitc.intranet.service.FreeService;

import lombok.RequiredArgsConstructor;


/**
 * Handles requests for the application home page.
 */
@Controller
@RequiredArgsConstructor
public class HomeController {
	
	private final BoardService bs;
	private final FreeService fs;
	
	@RequestMapping(value = "/", method = RequestMethod.GET)
	public String home(Locale locale, Model model, HttpServletRequest request, HttpSession session) {		
//		MemberVO memberVO = (MemberVO)session.getAttribute("memberVO");
//		memberVO 
		return "login";
	
	}

	// 메인에 최근 게시글 5개 띄우기
	@GetMapping("main")
	public void main(Model model) throws Exception {
		model.addAttribute("notice", bs.recentNotices());
		model.addAttribute("free", fs.recentFree());
	}
	
	
	
	@GetMapping("Board")
	public void Board() {}
	
}

package com.bitc.intranet.controller;

import java.util.Locale;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;

import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;

import com.bitc.intranet.vo.MemberVO;

/**
 * Handles requests for the application home page.
 */
@Controller
public class HomeController {
	
	@RequestMapping(value = "/", method = RequestMethod.GET)
	public String home(Locale locale, Model model, HttpServletRequest request, HttpSession session) {
		
//		MemberVO memberVO = (MemberVO)session.getAttribute("memberVO");
//		memberVO 
		
		return "login";
	
	}

	@GetMapping("main")
	public void main() {}
	
	@GetMapping("Board")
	public void Board() {}
	
	@GetMapping("memberUpdate")
	public void memberUpdate() {}
	
	@GetMapping("welfare")
	public void welfare() {}
	

	
	
	
}

package com.bitc.intranet.controller;

import java.io.UnsupportedEncodingException;

import javax.servlet.http.HttpServletRequest;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;

import com.bitc.intranet.service.MemberService;
import com.bitc.intranet.vo.MemberVO;

import lombok.RequiredArgsConstructor;
import lombok.extern.slf4j.Slf4j;

  
@Controller
@RequestMapping("/member")
@RequiredArgsConstructor
@Slf4j
public class MemberController {
	
	private final MemberService ms;
	
	@PostMapping("/joinsuc")
	public String join( 
			MemberVO vo,
			HttpServletRequest request
			) throws Exception {
		log.info("vo : {} ", vo);
		ms.addMember(vo);
		return "redirect:/";	
	}
	
	//로그인
	@GetMapping("/login")
	public String loginForm() {
		return "login";
	}
	
	@PostMapping("/login")
	public String login(@ModelAttribute MemberVO memberVO) throws Exception {
		   System.out.println("ID : " + memberVO.getUid());
	       System.out.println("PW : " + memberVO.getUpw());
		MemberVO loginResult = ms.login(memberVO);
		if(loginResult != null) {
			return "join";
		}else {
			return "login";
		}
	}
	
	
	
	
	
	
	/*
	 * 
	 * @RequestMapping(value = "/joinsuc", method = RequestMethod.POST)
	 * 
	 * @ResponseBody public ResponseEntity<String> addMember(MemberVO vo){
	 * System.out.println(vo); ResponseEntity<String> entity = null;
	 * 
	 * 
	 * try { List<MemberVO> list = ms.list(); return new ResponseEntity<>(list); }
	 * catch (Exception e) { e.printStackTrace(); return new
	 * ResponseEntity<>(HttpStatus.BAD_REQUEST); }
	 * 
	 * }
	 */

}

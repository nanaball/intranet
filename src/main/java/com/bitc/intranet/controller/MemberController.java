package com.bitc.intranet.controller;

import java.io.UnsupportedEncodingException;

import javax.servlet.http.HttpServletRequest;

import org.springframework.stereotype.Controller;
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

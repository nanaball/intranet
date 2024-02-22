package com.bitc.intranet.controller;

import java.io.UnsupportedEncodingException;
import java.util.Date;

import javax.servlet.http.HttpServletRequest;

import org.springframework.stereotype.Controller;

import org.springframework.web.bind.annotation.PostMapping;

import com.bitc.intranet.vo.MemberVO;

import lombok.RequiredArgsConstructor;
import lombok.extern.slf4j.Slf4j;


import org.springframework.web.bind.annotation.RequestMapping;

  
@Controller
@RequestMapping("/member")
public class MemberController {
	
	
	@Controller
@Slf4j
public class MemberController {
	
	@PostMapping("/joinsuc")
	public String join( 
			String uid, String upw, String uname, String uemail, String uphone, String udep, String ujob, Date udate,
			MemberVO vo,
			HttpServletRequest request
			) throws UnsupportedEncodingException {
		System.out.println(request.getCharacterEncoding());
		request.setCharacterEncoding("UTF-8");
		uid = request.getParameter("id");
		upw = request.getParameter("pw");
		uname = request.getParameter("name");
		uemail = request.getParameter("email");
		uphone = request.getParameter("phone");
		udep = request.getParameter("dep");
		ujob = request.getParameter("job");
		System.out.println("id : " + uid);
		System.out.println("pw : " + upw);
		System.out.println("name : " + uname);
		System.out.println("email : " + uemail);
		System.out.println("phone : " + uphone);
		System.out.println("dep : " + udep);
		System.out.println("job : " + ujob);
		System.out.println("date : " + udate);
		return "redirect:/";	
	}
	
	
	/*
	 * private final MemberService ms;
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

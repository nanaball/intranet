package com.bitc.intranet.controller;

import org.apache.ibatis.javassist.compiler.ast.Member;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.SessionAttribute;
import org.springframework.web.servlet.mvc.support.RedirectAttributes;

import com.bitc.intranet.service.MemberUpdateService;

import lombok.RequiredArgsConstructor;
import lombok.extern.slf4j.Slf4j;

@Controller
@RequiredArgsConstructor
@Slf4j
public class MemberUpdateController {
	
	private final MemberUpdateService mus;

	@GetMapping("memberUpdate")
	public void memberUpdate() {}
	
	@PostMapping("memberUpdate")
	public String memberUpdate(String upw, String newUpw, @SessionAttribute("loginMember") Member loginMember, RedirectAttributes ra) throws Exception{
		
		return "memberUpdate";
	}
	
	
	
	
	
	
	
	@GetMapping("memberDelete")
	public void memberDelete() {}
	
}

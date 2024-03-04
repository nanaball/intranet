package com.bitc.intranet.controller;

import javax.servlet.http.HttpServletRequest;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;

import com.bitc.intranet.service.MemberUpdateService;
import com.bitc.intranet.vo.MemberVO;

import lombok.RequiredArgsConstructor;
import lombok.extern.slf4j.Slf4j;

@Controller
@RequestMapping("/member")
@RequiredArgsConstructor
@Slf4j
public class MemberUpdateController {

	private final MemberUpdateService mus;
	
	@GetMapping("memberUpdate")
	public String memberUpdate() {
		return "memberUpdate";
	}
	
	@PostMapping("/done")
	public String done() {
		return "done";
	}
		
	

}

package com.bitc.intranet.controller;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;


import lombok.RequiredArgsConstructor;
import lombok.extern.slf4j.Slf4j;

@Controller
@RequestMapping("/member")
@Slf4j
public class MemberUpdateController {

	@GetMapping("memberUpdate")
	public void memberUpdate() {}
	
	@PostMapping("/done")
	public String done() {
		return "done";
	}
		
	

}

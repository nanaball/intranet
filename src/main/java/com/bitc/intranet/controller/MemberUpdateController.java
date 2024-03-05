package com.bitc.intranet.controller;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;

import lombok.extern.slf4j.Slf4j;

@Controller
@Slf4j
public class MemberUpdateController {

	@GetMapping("memberUpdate")
	public void memberUpdate() {}
	
	@GetMapping("memberDelete")
	public void memberDelete() {}
	
}

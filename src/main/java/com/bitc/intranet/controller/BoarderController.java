package com.bitc.intranet.controller;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.RequestMapping;

import com.bitc.intranet.service.BoardService;

import lombok.RequiredArgsConstructor;
import lombok.extern.slf4j.Slf4j;

@Controller
@RequestMapping("/Board")
@RequiredArgsConstructor
@Slf4j
public class BoarderController {
	
	private final BoardService bs;
	
	
	
	/* 게시글 등록 요청 처리*/
	@GetMapping("/BoardRegist")
	public String regist() throws Exception{
		System.out.println("Boardregist post 요청");
		return "BoardRegist";
	}
}

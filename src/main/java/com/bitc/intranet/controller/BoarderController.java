package com.bitc.intranet.controller;

import java.util.List;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseBody;

import com.bitc.intranet.service.BoardService;
import com.bitc.intranet.vo.BoardVO;

import lombok.RequiredArgsConstructor;
import lombok.extern.slf4j.Slf4j;

@Controller
@RequestMapping("/Board")
@RequiredArgsConstructor
@Slf4j
public class BoarderController {
	
	private final BoardService bs;
	
	@GetMapping("Board")
	@ResponseBody
	public List<BoardVO> listAll() throws Exception{
		
		return bs.listAll();
	}
	
	/* 게시글 새 글 작성 페이지 요청*/
	@GetMapping("/BoardRegist")
	public String regist() throws Exception{
		return "BoardRegist";
	}
}

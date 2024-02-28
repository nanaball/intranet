package com.bitc.intranet.controller;

import javax.servlet.http.HttpServletRequest;

import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;

import com.bitc.intranet.service.BoardService;
import com.bitc.intranet.vo.BoardVO;

import lombok.RequiredArgsConstructor;

@Controller
@RequestMapping("/Board")
@RequiredArgsConstructor
public class BoarderController {
	
	private final BoardService bs;
	
	/* 게시글 작성 요청*/
	@GetMapping("/Boardregist")
	public void regist(
			BoardVO vo,
			HttpServletRequest request
			) throws Exception{
		bs.regist(vo);
		System.out.println("게시글 작성 페이지 요청");
	}
	
	/* 게시글 등록 요청 처리*/
	@PostMapping("/Boardregist")
	public String registerPost(BoardVO vo, Model model) throws Exception{
		System.out.println("Boardregist post 요청");
		System.out.println(vo);
		String result = bs.regist(vo);
		model.addAttribute("msg",result);
		return "main";
	}
}

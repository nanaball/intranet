package com.bitc.intranet.controller;

import java.util.List;

import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;

import com.bitc.intranet.service.FreeService;
import com.bitc.intranet.vo.BoardVO;
import com.bitc.intranet.vo.FreeVO;

import lombok.RequiredArgsConstructor;
import lombok.extern.slf4j.Slf4j;

@Controller
@RequestMapping("/free")
@RequiredArgsConstructor
@Slf4j
public class FreeController {
	
	private final FreeService fs;
	
	// list 전체 보여주기
	@GetMapping("free")
	public String Board(Model model) throws Exception{
		List<FreeVO> list = fs.listAll();
		model.addAttribute("List",list);
		return "board";
	}
	
	/* 게시글 새 글 작성 페이지 요청*/
	@GetMapping("freeRegist")
	public String regist() throws Exception{
		return "freeRegist";
	}
	
	@PostMapping("freeRegist")
	public String register(FreeVO board) throws Exception{
		fs.regist(board);
		return "redirect:/free/free";
	}
}

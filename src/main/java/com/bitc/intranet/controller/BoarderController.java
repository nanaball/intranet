package com.bitc.intranet.controller;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;

import com.bitc.intranet.mapper.BoardMapper;
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
	
// 여기서부터	
	@Autowired
	private BoardMapper boardMapper;
	
	@RequestMapping(value="/list", method=RequestMethod.GET)
	public String boardList(Model model) {
		try {
			List<BoardVO> boardList = boardMapper.listAll();
			model.addAttribute("boardList",boardList);
		} catch (Exception e) {
			e.printStackTrace();
		}
		return "Board";
	}
// 여기까지
	
	/* 게시글 새 글 작성 페이지 요청*/
	@GetMapping("/BoardRegist")
	public String regist() throws Exception{
		return "BoardRegist";
	}
}

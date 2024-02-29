package com.bitc.intranet.controller;

import java.util.List;

import javax.servlet.http.HttpSession;

import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;

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
	
	// list 전체 보여주기
	@GetMapping("board")
	public String Board(Model model) throws Exception{
		List<BoardVO> list = bs.listAll();
		model.addAttribute("List",list);
		return "board";
	}
	
	/* 게시글 새 글 작성 페이지 요청*/
	@GetMapping("boardRegist")
	public String regist() throws Exception{
		return "boardRegist";
	}
	// 새 글 작성완료
	@PostMapping("boardRegist")
	public String register(BoardVO board) throws Exception{
		bs.regist(board);
		return "redirect:/Board/board";
	}
	
	// 게시글 상세 보기
	@GetMapping("readPage")
	public String readPage(int bno, Model model, HttpSession session) throws Exception {
		BoardVO vo = bs.read(bno);
		model.addAttribute("read",vo);
		
		// 조회수 증가
		return "boardRead";
		
	}
}

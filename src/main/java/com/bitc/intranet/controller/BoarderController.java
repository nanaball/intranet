package com.bitc.intranet.controller;

import java.util.List;

import javax.servlet.http.HttpSession;

import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.servlet.mvc.support.RedirectAttributes;

import com.bitc.intranet.service.BoardService;
import com.bitc.intranet.util.Criteria;
import com.bitc.intranet.util.PageMaker;
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
	/*
	 @GetMapping("board") 
	 public String Board(Model model) throws Exception{
		 List<BoardVO> list = bs.listAll(); 
		 model.addAttribute("List",list); 
		 return "board"; }
	*/
	
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
	@GetMapping("read")
	public String readPage(
			@ModelAttribute("cri")Criteria cri, 
			int bno, 
			Model model, 
			HttpSession session) throws Exception {
		BoardVO vo = bs.read(bno);
		model.addAttribute(cri);
		model.addAttribute("read",vo);
		return "boardRead";
	}
	
	// 게시글 상세보기 페이지 요청
	@GetMapping("boardRead")
	public String readPage(int bno, RedirectAttributes rttr) throws Exception{
		// 조회수 증가
		bs.updateCnt(bno);
		rttr.addAttribute("bno",bno);
		return "redirect:/Board/read";
	}
	
	// 게시글 수정 페이지 요청
	@GetMapping("modify")
	public String modifyGet(int bno, Model model) throws Exception {
		BoardVO vo = bs.read(bno);
		model.addAttribute(vo);
		return "boardModify";
	}
	
	// 게시글 수정완료 요청
	@PostMapping("modify")
	public String modifyPost(RedirectAttributes rtts, BoardVO vo, Model model) throws Exception {
		String result = bs.modify(vo);
		rtts.addFlashAttribute("result",result);
		rtts.addAttribute("bno",vo.getBno());
		return "redirect:/Board/readPage";
	}
	
	// 게시글 삭제요청
	@GetMapping("remove")
	public String remove(int bno) throws Exception{
		bs.remove(bno);
		return "redirect:/Board/board";
	}
	
	
	// 메인화면에 공지사항 최신글 5개 미리보기
	@GetMapping("/recentNotices")
	@ResponseBody
	public List<BoardVO> recentNotices() throws Exception {		 
		return bs.recentNotices();
	 }

	// 게시판 페이징처리
	@GetMapping("board")
	public String board(Criteria cri, Model model) throws Exception{
		//List<BoardVO> list = bs.listAll();
		//model.addAttribute("List",list); 
		System.out.println("listPage criteria : " + cri);
		List<BoardVO> List = bs.listCriteria(cri);
		model.addAttribute("List",List);
		
		PageMaker pm = bs.getPageMaker(cri);
		model.addAttribute("pm",pm);
		
		return "board";
	}

}

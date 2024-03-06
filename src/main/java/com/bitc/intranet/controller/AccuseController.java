package com.bitc.intranet.controller;

import java.util.List;

import javax.servlet.http.HttpSession;

import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.servlet.mvc.support.RedirectAttributes;

import com.bitc.intranet.service.AccuseService;
import com.bitc.intranet.vo.AccuseVO;
import com.bitc.intranet.vo.FreeVO;

import lombok.RequiredArgsConstructor;
import lombok.extern.slf4j.Slf4j;

@Controller
@RequestMapping("/accuse")
@RequiredArgsConstructor
@Slf4j
public class AccuseController {

	private final AccuseService as;

	
	
	// list 전체 보여주기
	@GetMapping
	public String Board(Model model) throws Exception {
		List<AccuseVO> list = as.listAll();
		model.addAttribute("List", list);
		return "/accuse";
	}

	/* 게시글 새 글 작성 페이지 요청 */
	@GetMapping("accuseRegist")
	public String regist() throws Exception {
		return "accuseRegist";
	}

	// 새 글 작성완료
	@PostMapping("accuseRegist")
	public String register(AccuseVO board) throws Exception {
		as.regist(board);
		return "redirect:/accuse";
	}

	// 게시글 상세 보기
	@GetMapping("readPage")
	public String readPage(int bno, Model model, HttpSession session) throws Exception {
		AccuseVO vo = as.read(bno);
		model.addAttribute("read", vo);
		return "accuseRead";
	}

	// 게시글 수정 페이지 요청
	@GetMapping("modify")
	public String modifyGet(int bno, Model model) throws Exception {
		AccuseVO vo = as.read(bno);
		model.addAttribute(vo);
		return "accuseModify";
	}

	// 게시글 수정완료 요청
		@PostMapping("modify")
		public String modifyPost(RedirectAttributes rtts, AccuseVO vo, Model model) throws Exception {
			String result = as.modify(vo);
			rtts.addFlashAttribute("result",result);
			rtts.addAttribute("bno",vo.getBno());
			return "redirect:/accuse/readPage";
		}

	// 게시글 삭제요청
	@GetMapping("remove")
	public String remove(int bno) throws Exception {
		as.remove(bno);
		return "redirect:/accuse";
	}

	// 메인화면에 최근 게시물 목록 5개 보여주기
	@GetMapping("/recentAccuse")
	@ResponseBody
	public List<AccuseVO> recentFree() throws Exception {
		return as.recentAccuse();

	}

}

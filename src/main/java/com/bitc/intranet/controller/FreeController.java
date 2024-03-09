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

import com.bitc.intranet.service.FreeService;
import com.bitc.intranet.vo.NoticeVO;
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
	public String Board(Model model) throws Exception {
		List<FreeVO> list = fs.listAll();
		model.addAttribute("List", list);
		return "free";
	}

	/* 게시글 새 글 작성 페이지 요청 */
	@GetMapping("freeRegist")
	public String regist() throws Exception {
		return "freeRegist";
	}

	// 새 글 작성완료
	@PostMapping("freeRegist")
	public String register(FreeVO board) throws Exception {
		fs.regist(board);
		return "redirect:/free/free";
	}

	// 게시글 상세 보기
	@GetMapping("readPage")
	public String readPage(int bno, Model model, HttpSession session) throws Exception {
		FreeVO vo = fs.read(bno);
		model.addAttribute("read", vo);
		return "freeRead";
	}

	// 게시글 수정 페이지 요청
	@GetMapping("modify")
	public String modifyGet(int bno, Model model) throws Exception {
		FreeVO vo = fs.read(bno);
		model.addAttribute(vo);
		return "freeModify";
	}

	// 게시글 수정완료 요청
		@PostMapping("modify")
		public String modifyPost(RedirectAttributes rtts, FreeVO vo, Model model) throws Exception {
			String result = fs.modify(vo);
			rtts.addFlashAttribute("result",result);
			rtts.addAttribute("bno",vo.getBno());
			return "redirect:/free/readPage";
		}

	// 게시글 삭제요청
	@GetMapping("remove")
	public String remove(int bno) throws Exception {
		fs.remove(bno);
		return "redirect:/free/free";
	}

	// 메인화면에 최근 게시물 목록 5개 보여주기
	@GetMapping("/recentFree")
	@ResponseBody
	public List<FreeVO> recentFree() throws Exception {
		return fs.recentFree();

	}

}

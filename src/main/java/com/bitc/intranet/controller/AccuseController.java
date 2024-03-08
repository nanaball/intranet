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

import com.bitc.intranet.service.AccuseService;
import com.bitc.intranet.util.Criteria;
import com.bitc.intranet.util.PageMaker;
import com.bitc.intranet.vo.AccuseVO;

import lombok.RequiredArgsConstructor;
import lombok.extern.slf4j.Slf4j;

@Controller
@RequestMapping("/accuse")
@RequiredArgsConstructor
@Slf4j
public class AccuseController {

	private final AccuseService as;

	
/*
	// 사내고발 게시판 페이지 요청
	@GetMapping("accuse")
	public String Board(Model model) throws Exception {
		List<AccuseVO> list = as.listAll();
		model.addAttribute("List", list);
		return "accuse";
	}
*/
	// 게시글 새 글 작성 페이지 요청 
	@GetMapping("accuseRegist")
	public String regist() throws Exception {
		return "accuseRegist";
	}

	// 새 글 작성완료
	@PostMapping("regist")
	public String register(AccuseVO board) throws Exception {
		as.regist(board);
		return "redirect:/accuse/accuse";
	}

	// 게시글 상세 보기
	@GetMapping("readPage")
	public String readPage(
			@ModelAttribute("cri")Criteria cri, 
			int bno, Model model, HttpSession session) throws Exception {
		as.updateCnt(bno);
		AccuseVO vo = as.read(bno);
		model.addAttribute(cri);
		model.addAttribute("read", vo);
		return "accuseRead";
	}
	
	// 게시글 상세보기 페이지 요청
	@GetMapping("accuseRead")
	public String readPage(int bno, RedirectAttributes rttr) throws Exception{
		// 조회수 증가
		as.updateCnt(bno);
		rttr.addAttribute("bno",bno);
		return "redirect:/accuse/read";
		}

	// 게시글 수정 페이지 요청
	@GetMapping("modify")
	public String modifyGet(int bno, Model model) throws Exception {
		AccuseVO vo = as.read(bno);
		model.addAttribute("read", vo);
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
	@PostMapping("remove")
	public String remove(int bno) throws Exception {
		as.remove(bno);
		return "redirect:/accuse/accuse";
	}
	
	// 답변글 작성 페이지 요청
	@GetMapping("accuseReplyRegister")
	public String accuseReplyRegister(int bno, Model model) throws Exception{
		// bno : 답변을 달려는 원본 게시글 번호
		AccuseVO origin = as.read(bno);
		model.addAttribute("origin", origin);
			// [/WEB-INF/views/accuseReplyRegister.jsp] 파일의 주소
		return "accuseReplyRegister";
	}
	
	// 답변글 등록 요청 처리
	// accuse/replyRegister - POST
	@PostMapping("accuseReplyRegister")
	public String accuseReplyRegister(AccuseVO reply) throws Exception{
		// 답변글 등록
		as.accuseReplyRegister(reply);
		
		// 답변글 등록 완료 시 게시글 목록 페이지 이동
		return "redirect:/accuse/accuse";
	}
		

	// 메인화면에 최근 게시물 목록 5개 보여주기
	@GetMapping("/recentAccuse")
	@ResponseBody
	public List<AccuseVO> recentAccuse() throws Exception {
		return as.recentAccuse();
	}
	
	// 사내고발 게시판 페이징 처리
	@GetMapping("accuse")
	public String board(Criteria cri, Model model) throws Exception{
		//List<AccuseVO> list = bs.listAll();
		//model.addAttribute("List",list); 
		System.out.println("listPage criteria : " + cri);
		List<AccuseVO> List = as.listCriteria(cri);
		model.addAttribute("List",List);
		
		PageMaker pm = as.getPageMaker(cri);
		model.addAttribute("pm",pm);
		
		return "accuse";
	}

	
	
	
/*
	// 게시글 검색
	@RequestMapping("/accuseSearch")
	public @ResponseBody List<AccuseVO> accuseSearch(String search){
		System.out.println(search);
		
		search = "%" + search + "%";
		
		List<AccuseVO> serchList = as.accuseSearch(search);
		
		return serchList;
	}
*/
	
	
}

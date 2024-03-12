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

import com.bitc.intranet.service.FreeService;
import com.bitc.intranet.util.Criteria;
import com.bitc.intranet.util.PageMaker;
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

	// 게시글 새 글 작성 페이지 요청 
		@GetMapping("freeRegist")
		public String regist() throws Exception {
			return "freeRegist";
		}

		// 새 글 작성완료
		@PostMapping("regist")
		public String register(FreeVO board) throws Exception {
			fs.regist(board);
			return "redirect:/free/free";
		}

		// 게시글 상세 보기
		@GetMapping("readPage")
		public String readPage(
				@ModelAttribute("cri")Criteria cri, 
				int bno, Model model, HttpSession session) throws Exception {
			fs.updateCnt(bno);
			FreeVO vo = fs.read(bno);
			model.addAttribute(cri);
			model.addAttribute("read", vo);
			return "freeRead";
		}
		
		// 게시글 상세보기 페이지 요청
		@GetMapping("freeRead")
		public String readPage(int bno, RedirectAttributes rttr) throws Exception{
			// 조회수 증가
			fs.updateCnt(bno);
			rttr.addAttribute("bno",bno);
			return "redirect:/free/read";
			}

		// 게시글 수정 페이지 요청
		@GetMapping("modify")
		public String modifyGet(int bno, Model model) throws Exception {
			FreeVO vo = fs.read(bno);
			model.addAttribute("read", vo);
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
		@PostMapping("remove")
		public String remove(int bno) throws Exception {
			fs.remove(bno);
			return "redirect:/free/free";
		}
		
		// 답변글 작성 페이지 요청
		@GetMapping("freeReplyRegister")
		public String freeReplyRegister(int bno, Model model) throws Exception{
			// bno : 답변을 달려는 원본 게시글 번호
			FreeVO origin = fs.read(bno);
			model.addAttribute("origin", origin);
				// [/WEB-INF/views/freeReplyRegister.jsp] 파일의 주소
			return "freeReplyRegister";
		}
		
		// 답변글 등록 요청 처리
		// free/replyRegister - POST
		@PostMapping("freeReplyRegister")
		public String freeReplyRegister(FreeVO reply) throws Exception{
			// 답변글 등록
			fs.freeReplyRegister(reply);
			
			// 답변글 등록 완료 시 게시글 목록 페이지 이동
			return "redirect:/free/free";
		}
			

		// 메인화면에 최근 게시물 목록 5개 보여주기
		@GetMapping("/recentFree")
		@ResponseBody
		public List<FreeVO> recentFree() throws Exception {
			return fs.recentFree();
		}
		
		// 사내고발 게시판 페이징 처리
		@GetMapping("free")
		public String board(Criteria cri, Model model) throws Exception{
			//List<FreeVO> list = bs.listAll();
			//model.addAttribute("List",list); 
			System.out.println("listPage criteria : " + cri);
			List<FreeVO> List = fs.listCriteria(cri);
			model.addAttribute("List",List);
			
			PageMaker pm = fs.getPageMaker(cri);
			model.addAttribute("pm",pm);
			
			return "free";
		}

		
		
		

		// 게시글 검색
		@RequestMapping("/freeSearch")
		@ResponseBody 
		public List<FreeVO> freeSearch(String search){
			System.out.println(search);
			
			search = "%" + search + "%";
			
			List<FreeVO> serchList = fs.freeSearch(search);
			
			return serchList;
		}

		

}

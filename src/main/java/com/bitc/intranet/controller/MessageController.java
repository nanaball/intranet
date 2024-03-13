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

import com.bitc.intranet.service.MessageService;
import com.bitc.intranet.vo.NoticeVO;
import com.bitc.intranet.vo.MessageVO;

import lombok.RequiredArgsConstructor;
import lombok.extern.slf4j.Slf4j;

@Controller
@RequestMapping("messages/*")
@RequiredArgsConstructor
@Slf4j
public class MessageController {
	
	private final MessageService ms;
	
	
	@GetMapping("message")
	public String message(Model model) throws Exception{
		List<MessageVO> list = ms.list();
		model.addAttribute("list",list);
		return "message";
	}
	
	
	// 게시글 새 글 작성 페이지 요청
	@GetMapping("messageRegist")
	public String regist() throws Exception{
		return "messageRegist";
	}
	
	// 결제하기 글 등록 처리 요청
	@PostMapping("messageRegist")
	public String register(MessageVO message) throws Exception{
		ms.regist(message);
		return "redirect:/messages/message";
	}
	
	//출력할 view페이지와 출력할 게시글 정보
	@GetMapping("read")
	public String messageRead(int mno, Model model, HttpSession session) throws Exception {
		MessageVO message = ms.read(mno);
		model.addAttribute("read",message);
		return "messageRead";
	}
	
	// 게시글 상세보기 페이지 요청
	@GetMapping("messageRead")
	public String messageRead(int mno, RedirectAttributes rttr) throws Exception{
		rttr.addAttribute("mno",mno);
		return "redirect:/messages/read";
	}
	
	
	/*게시글 상세보기 페이지 요청
	// /board/readPage - 조회수만 증가
	@GetMapping("readPage")
	public String readPage(int bno, RedirectAttributes rttr) throws Exception{
		// 조회수 증가
		bs.updateViewCnt(bno);
		//redirect된 페이지에 get방식의 QueryString parameter 지정
		rttr.addAttribute("bno",bno);
		return "redirect:/board/read";
		//return "redirect:/board/read?bno="+bno;
	}*/
	
		
	
	
	//메세지 수정 페이지 요청
		@GetMapping("modify")
		public String modifyGet(int mno, Model model) throws Exception {
			MessageVO message = ms.read(mno);
			model.addAttribute(message);
			return "messageRegister";
		}
		
		// 메세지 수정완료 요청
		@PostMapping("modify")
		public String modifyPost(RedirectAttributes rtts, MessageVO vo, Model model) {
			String result = "";
			
			try {
				ms.modify(vo);
				result="수정완료";
			} catch (Exception e) {
				result="수정사항을 확인해주세요";
			}
			
			rtts.addFlashAttribute("result",result);
			rtts.addAttribute("bno",vo.getMno());
			return "redirect:/message/??";
		}
		
		// 게시글 삭제요청
		@GetMapping("remove")
		public String remove(int mno) throws Exception{
			ms.remove(mno);
			return "redirect:/Messages/??";
		}
		
		
		// 메인화면에 공지사항 최신글 5개 미리보기
		@GetMapping("/recentNotices")
		@ResponseBody
		public List<NoticeVO> recentNotices() throws Exception {		 
			return ms.recentNotices();
			 
		 }
		


}

package com.bitc.intranet.controller;

import java.util.List;

import javax.servlet.http.HttpSession;

import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.servlet.mvc.support.RedirectAttributes;

import com.bitc.intranet.service.MessageService;
import com.bitc.intranet.util.Criteria;
import com.bitc.intranet.util.PageMaker;
import com.bitc.intranet.vo.MemberVO;
import com.bitc.intranet.vo.MessageVO;
import com.bitc.intranet.vo.NoticeVO;

import lombok.RequiredArgsConstructor;
import lombok.extern.slf4j.Slf4j;

@Controller
@RequestMapping("messages/*")
@RequiredArgsConstructor
@Slf4j
public class MessageController {
	
	private final MessageService ms;
	
	/*
	@GetMapping("message")
	public String message(Model model, HttpSession session) throws Exception{
		MemberVO memberVO = (MemberVO)session.getAttribute("loginMember");
		List<MessageVO> list = ms.list(memberVO.getUname());
		model.addAttribute("list",list);
		return "message";
	}
	*/
	
	//+더보기 에서 수신함 List 추가
	@GetMapping("messageList")
	public String messageList(Model model, HttpSession session) throws Exception{
		MemberVO memberVO = (MemberVO)session.getAttribute("loginMember");
		List<MessageVO> sendList = ms.sendList(memberVO.getUid());
		model.addAttribute("sendList",sendList);
		return "messageList";
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
	
	//메세지 수정 페이지 요청
		@GetMapping("messageModify")
		public String messageModify(int mno, Model model) throws Exception {
			MessageVO message = ms.read(mno);
			model.addAttribute(message);
			return "messageModify";
		}
		
		// 메세지 수정완료 요청
		@PostMapping("messageModify")
		public String modifyPost(RedirectAttributes rtts, MessageVO vo, Model model) {
			String result = "";
			
			try {
				ms.messageModify(vo);
				result="수정완료";
			} catch (Exception e) {
				result="수정사항을 확인해주세요";
			}
			
			rtts.addFlashAttribute("result",result);
			rtts.addAttribute("mno",vo.getMno());
			return "redirect:/messages/messageModify";
		}
		
		// 게시글 삭제요청
		@GetMapping("remove")
		public String remove(int mno) throws Exception{
			ms.remove(mno);
			return "redirect:/Messages/??";
		}

		@GetMapping("message")
		public String message(Criteria cri, Model model,HttpSession session) throws Exception{
			MemberVO memberVO = (MemberVO)session.getAttribute("loginMember");
			//List<MessageVO> list = ms.list(memberVO.getUname());
			//model.addAttribute("list",list);
			System.out.println("listPage criteria : " + cri);
			List<MessageVO> list = ms.listCriteria(cri, memberVO.getUname());
			model.addAttribute("list",list);
			
			PageMaker pm = ms.getPageMaker(cri);
			model.addAttribute("pm",pm);
			return "message";
		}
		

}

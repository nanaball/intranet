package com.bitc.intranet.controller;

import java.util.List;

import javax.servlet.http.HttpSession;

import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.servlet.mvc.support.RedirectAttributes;

import com.bitc.intranet.service.WelfareService;
import com.bitc.intranet.vo.WelfareVO;

import lombok.RequiredArgsConstructor;

@Controller
@RequestMapping("/Welfare")
@RequiredArgsConstructor
public class WelfareController {

	private final WelfareService ws;
	
	// 복지 리스트
	@GetMapping("welfare")
	public String welfare(Model model) throws Exception {
		List<WelfareVO> list = ws.list();
		model.addAttribute("List", list);
		return "welfare";
	}
	
	// 복지 추가
	@GetMapping("welfareAdd")
	public String welfareAdd() throws Exception{
		return "welfareAdd";
	}
	
	// 복지 상세보기
	@GetMapping("welfareDetail")
	public  String welfareDetail(int mNo, Model model, HttpSession session) throws Exception {
		WelfareVO vo = ws.read(mNo);
		model.addAttribute("read", vo);
		return "welfareDetail";
	}
	
	// 복지 수정
	@GetMapping("modify")
	public String welfareModify(int mNo, Model model) throws Exception {
		WelfareVO vo = ws.read(mNo);
		model.addAttribute(vo);
		return "welfareModify";
	}
	
	// 복지 수정완료
	@PostMapping("modify")
	public String modifyWelfare(RedirectAttributes rtts, WelfareVO vo, Model model) throws Exception{
		String result = ws.modify(vo);
		rtts.addFlashAttribute("result", result);
		rtts.addAttribute("mNo", vo.getMNo());
		return "redirect:/Welfare/welfareDetail";
	}
	
	// 복지 삭제요청
	@GetMapping("delete")
	public String delete(int mNo) throws Exception{
		ws.removeWelfare(mNo);
		return "redirect:/Welfare/welfare";
	}
	
//	// 새로운 복지 제품 미리보기
//	@GetMapping("/recentWelfare")
//	@ResponseBody
//	public List<WelfareVO> recentWelfare() thrwos Exception{
//		return ws.recentWelfare();
//	}
	
	
}

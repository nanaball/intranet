package com.bitc.intranet.controller;

import java.util.List;

import javax.servlet.http.HttpSession;

import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.servlet.mvc.support.RedirectAttributes;

import com.bitc.intranet.service.WelfareService;
import com.bitc.intranet.vo.WelfareVO;

import lombok.RequiredArgsConstructor;
import lombok.extern.slf4j.Slf4j;

@Controller
@RequestMapping("/Welfare")
@RequiredArgsConstructor
@Slf4j
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
	public String addWelfareGet() throws Exception{
		return "welfareAdd";
	}
	
	// 복지 추가 요청
	@PostMapping("welfareAdd")
	public String addWelfarePost(WelfareVO vo) throws Exception{
		ws.addWelfare(vo);
		System.out.println(vo);
		return "redirect:/Welfare/welfare";
	}
	
	// 복지 상세보기
	@GetMapping("welfareDetail")
	public String welfareDetail(int num, Model model, HttpSession session) throws Exception {
		WelfareVO vo = ws.detail(num);
		model.addAttribute("Detail", vo);
		return "welfareDetail";
	}
	
	// 복지 수정
	@GetMapping("welfareModify")
	public String modifyGet(int num, Model model) throws Exception {
		WelfareVO vo = ws.detail(num);
		model.addAttribute("welfareVO", vo);
		return "welfareModify";
	}
	
	// 복지 수정 요청
	@PostMapping("welfareModify")
	public String modifyPost(RedirectAttributes rtts, WelfareVO vo, Model model) throws Exception{
		String result = ws.modify(vo);
		rtts.addAttribute("num", vo.getNum());
		rtts.addFlashAttribute("message", result);
		return "redirect:/Welfare/welfareDetail";
	}
	
	// 복지 삭제 요청
	@PostMapping("welfareDelete")
	public String delete(int num, RedirectAttributes rttr, Model model) throws Exception{
		ws.welfareDelete(num);
		rttr.addFlashAttribute("message","삭제완료 되었습니다.");
		rttr.addAttribute("num",num);
		return "redirect:/Welfare/welfare";
	}
	
	// 구매
	@PostMapping("welfareBuy")
	public String buy(int num, RedirectAttributes rttr) throws Exception{
		ws.buyWelfare(num);
		rttr.addFlashAttribute("message","구매완료 되었습니다.");
		rttr.addAttribute("num",num);
		return "redirect:/Welfare/welfareDetail";
	}
	
	// 새로운 복지 제품 미리보기
	@GetMapping("/recentWelfare")
	@ResponseBody
	public List<WelfareVO> recentWelfare() throws Exception{
		return ws.recentWelfare();
	}
	
}









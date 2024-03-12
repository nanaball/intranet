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
	public String addWelfareGet() throws Exception{
		return "welfareAdd";
	}
	
	// 복지 추가 요청
	@PostMapping("welfareAdd")
	public String addWelfarePost(WelfareVO vo) throws Exception{
		ws.addWelfare(vo);
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
	public String modifyGet(@RequestParam Integer num, Model model) throws Exception {
		WelfareVO vo = ws.detail(num);
		model.addAttribute("welfareVO", vo);
		return "welfareModify";
	}
	
	// 복지 수정 요청
	@PostMapping("welfareModify")
	public String modifyPost(RedirectAttributes rtts, WelfareVO vo, Model model) throws Exception{
		ws.modify(vo);
		rtts.addAttribute("num", vo.getNum());
		return "redirect:/Welfare/welfareDetail";
	}
	
	// 복지 삭제 요청
	@GetMapping("delete")
	public String delete(int num) throws Exception{
		ws.removeWelfare(num);
		return "redirect:/Welfare/welfare";
	}
	
	// 구매
	@GetMapping("buy")
	public String buy(WelfareVO vo) throws Exception{
		ws.buyWelfare(vo);
		return "redirect:/Welfare/welfare";
	}
	
	// 새로운 복지 제품 미리보기
	@GetMapping("/recentWelfare")
	@ResponseBody
	public List<WelfareVO> recentWelfare() throws Exception{
		return ws.recentWelfare();
	}
	
}

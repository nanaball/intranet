package com.bitc.intranet.controller;

import javax.servlet.http.HttpSession;

import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.PostMapping;

import com.bitc.intranet.service.MemberUpdateService;
import com.bitc.intranet.vo.MemberVO;

import lombok.RequiredArgsConstructor;
import lombok.extern.slf4j.Slf4j;

@Controller
@RequiredArgsConstructor
@Slf4j
public class MemberUpdateController {
	
	private final MemberUpdateService mus;

	@GetMapping("memberUpdate")
	public String detail(String uno, Model model, HttpSession session) throws Exception{
		MemberVO vo = mus.detail(uno);
		model.addAttribute("detail", vo);
		
		return "memberUpdate";
	}
	
   @PostMapping("memberUpdate")
   public String changePass(@ModelAttribute MemberVO vo, Model model) throws Exception{
	   System.out.println(vo);
	   mus.updateMember(vo);
	   return "memberUpdate"; 
   }
	
	@GetMapping("memberDelete")
	public void memberDelete() {}
	
}

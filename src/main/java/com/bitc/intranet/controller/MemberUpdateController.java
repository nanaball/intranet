package com.bitc.intranet.controller;

import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.servlet.mvc.support.RedirectAttributes;

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
	public String detail(int uno, Model model) throws Exception{
		MemberVO vo = mus.detail(uno);
		model.addAttribute("detail", vo);
		return "memberUpdate";
	}
	
   @PostMapping("memberUpdate")
   public String changePass(@ModelAttribute MemberVO vo, Model model, int uno) throws Exception{
	   System.out.println(vo);
	   System.out.println(uno);
	   mus.updateMember(vo);
	   return "redirect:/main"; 
   }
	
}

package com.bitc.intranet.controller;

import java.io.UnsupportedEncodingException;

import javax.servlet.http.HttpServletRequest;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseBody;

import com.bitc.intranet.service.MemberService;
import com.bitc.intranet.vo.MemberVO;

import lombok.RequiredArgsConstructor;
import lombok.extern.slf4j.Slf4j;

  
@Controller
@RequestMapping("/member")
@RequiredArgsConstructor
@Slf4j
public class MemberController {
	
	private final MemberService ms;
	

	
	
	// 회원가입 -- 완
	// 추후 비밀번호 재 확인 다른부분에도 null 값이 아니면 회원가입되는거 수정하기 
	@PostMapping("/joinsuc")
	public String join( 
			MemberVO vo,
			HttpServletRequest request
			) throws Exception {
		log.info("vo : {} ", vo);
		ms.addMember(vo);
		if(vo == null ) {
			return "redirect:/join";
		}else {
			return "redirect:/";
		}	
	}
	

	// 아이디 중복 확인 -- 완
	@PostMapping("/checkId")
	@ResponseBody
	public String checkId(String uid) throws Exception{
		
        MemberVO vo = ms.readMember(uid);
		
		if (vo != null) {
            return "duplicate";
        } else {
            return "not_duplicate";
        }
	}
	
	
	
	 
	   @PostMapping("/login")
	   public String login(@ModelAttribute MemberVO memberVO) throws Exception {
	         System.out.println("ID : " + memberVO.getUid());
	          System.out.println("PW : " + memberVO.getUpw());
	      MemberVO loginResult = ms.login(memberVO);
	      if(loginResult != null) {
	         return "join";
	      }else {
	         return "login";
	      }
	   }
	   
	
}

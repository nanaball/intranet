package com.bitc.intranet.controller;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import org.springframework.stereotype.Controller;
import org.springframework.transaction.annotation.Transactional;
import org.springframework.ui.Model;
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
	
	// 회원가입 창 -- 완
	// member/join
	@GetMapping("/join")
	public String join() {
		return "join";
		}
	
	
	// 회원가입 -- 완
	// TODO 추후 비밀번호 재 확인 다른부분에도 null 값이 아니면 회원가입되는거 수정하기 
	// TODO 중복 아이디 일때 null 값이 아니면 회원 가입 창 뜨는것도 수정
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
	
	// 로그인 확인 - 완
	// member/login
   @PostMapping("/login")
   public String loginCheck(@ModelAttribute MemberVO vo,
		   			   HttpSession session) throws Exception {
      MemberVO loginResult = ms.login(vo);
      
      if(loginResult != null) {
    	  // 로그인 성공 - 일치하는 사용자 정보 검색 완료
    	  session.setAttribute("loginMember", loginResult);
         return "redirect:/main";
      }else {
    	  // 로그인 실패  - 일치하는 사용자 정보 없음
         return "redirect:/";
      }
   }

   //로그인창에서 비밀번호 찾기
   @PostMapping("/findPass")
	public String findPass(@ModelAttribute MemberVO vo,
							Model model) throws Exception {
	   MemberVO findPassResult = ms.findPass(vo);
	   
	   if(findPassResult != null) {
		   //회원이메일로 코드발송
		   return "";
	   }else {
		   return null;
	   }
		
   }
   @GetMapping("/findPass")
   public String findPass() {
	   return "/findPass";
   }
   
   //비밀번호 변경 - 이메일 보내기
   @PostMapping("/changePass")
   public String changePass(@ModelAttribute MemberVO vo,
		                    HttpServletRequest request,
		                    HttpServletResponse  response) throws Exception{
	   return "redirect:/";
   }
   
   @GetMapping("/changePass")
   public String changePass() {
	   return "/changePass";
   }
   
   

   // 회원 수정 창 
   @GetMapping("/views/memberUpdate")
   public String memberUpdate() {
	   return" views/memberUpdate";
   
   
}

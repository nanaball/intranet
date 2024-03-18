package com.bitc.intranet.controller;

import java.util.List;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;

import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.servlet.mvc.support.RedirectAttributes;

import com.bitc.intranet.service.MemberService;
import com.bitc.intranet.util.Criteria;
import com.bitc.intranet.util.PageMaker;
import com.bitc.intranet.vo.AccuseVO;
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
	@PostMapping("/joinsuc")
	public String join(MemberVO vo,
//			HttpServletRequest request,
			RedirectAttributes rttr) throws Exception {
		log.info("vo : {} ", vo);
		ms.addMember(vo);
		rttr.addFlashAttribute("message", "회원가입 성공");
		return "redirect:/";
	}

	// 아이디 중복 확인 -- 완
	@PostMapping("/checkId")
	@ResponseBody
	public String checkId(String uid) throws Exception {

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
	public String loginCheck(@ModelAttribute MemberVO vo, HttpSession session) throws Exception {
		MemberVO loginResult = ms.login(vo);

		if (loginResult != null) {
			// 로그인 성공 - 일치하는 사용자 정보 검색 완료
			session.setAttribute("loginMember", loginResult);
			return "redirect:/main";
		} else {
			// 로그인 실패 - 일치하는 사용자 정보 없음
			return "redirect:/";
		}
	}

	// 로그인창에서 비밀번호 찾기
	@PostMapping("/findPass")
	public String findPass(@ModelAttribute(name = "vo") MemberVO vo,

			Model model) throws Exception {
		MemberVO findPassResult = ms.findPass(vo);
		System.out.println(vo);
		System.out.println(findPassResult);
		if (findPassResult != null) {
			// 아이디,이름,메일 정보가 확인되면 비밀번호 변경창으로 이동
			return "changePass";
		} else {
			return "findPass";
		}

	}

	@GetMapping("/findPass")
	public String findPass() {
		return "/findPass";
	}

	// 비밀번호 변경
	@PostMapping("/changePass")
	public String changePass(@ModelAttribute MemberVO vo, Model model) throws Exception {
		System.out.println(vo);
		ms.changePass(vo);
		return "redirect:/";
	}

	/*
	 * @GetMapping("/changePass") public String changePass() { return "/changePass";
	 * }
	 */

	// 회원 수정 창
	@GetMapping("/views/memberUpdate")
	public String memberUpdate() {
		return " views/memberUpdate";
	}

	// 회원정보 관리창
	@GetMapping("/memberList")
	public String memberInfo(Criteria cri, Model model) throws Exception {
		// List<AccuseVO> list = bs.listAll();
		// model.addAttribute("List",list);
		System.out.println("listPage criteria : " + cri);
		List<MemberVO> List = ms.listCriteria(cri);
		model.addAttribute("List", List);

		PageMaker pm = ms.getPageMaker(cri);
		model.addAttribute("pm", pm);

		return "memberList";
	}

	// 회원 이름 검색
	// 게시글 검색
	@RequestMapping("/memberSearch")
	@ResponseBody
	public List<MemberVO> accuseSearch(String search) {
		System.out.println(search);

		search = "%" + search + "%";

		List<MemberVO> serchList = ms.accuseSearch(search);

		return serchList;
	}

	// 로그아웃
	@GetMapping("/logOut")
	public String logOut(HttpServletRequest request, HttpSession session) throws Exception {
		// 세션에서 사용자 정보를 제거
		session.removeAttribute("loginMember");
		return "redirect:/";
	}

	// 회원 삭제 창(관리자)
	@GetMapping("memberDel")
	public String memberDel(int uno, Model model) throws Exception {
		MemberVO Member = ms.read(uno);
		model.addAttribute("Member", Member);
		return "memberDel";
	}

	// 회원 삭제
	@PostMapping("bye")
	public String bye(int uno) throws Exception{
		ms.remove(uno);
		return "redirect:/member/memberList";
	}
}

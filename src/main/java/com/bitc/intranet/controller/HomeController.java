package com.bitc.intranet.controller;

import java.util.Locale;

import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;

import com.bitc.intranet.service.RecentService;

import lombok.RequiredArgsConstructor;

/**
 * Handles requests for the application home page.
 */
@Controller
@RequiredArgsConstructor
public class HomeController {
	
	private final RecentService rs;
	
	@RequestMapping(value = "/", method = RequestMethod.GET)
	public String home(Locale locale, Model model){
		return "login";
	
	}

	@GetMapping("main")
	public void main(Model model) throws Exception {
		model.addAttribute("notice", rs.RecentNotices());
	}
	
	@GetMapping("Board")
	public void Board() {}
	
	@GetMapping("memberUpdate")
	public void memberUpdate() {}
	
	@GetMapping("welfare")
	public void welfare() {}
	
	@GetMapping("NewFile")
	public void NewFile() {}
	
}

package com.bitc.intranet.controller;

import java.util.Locale;

import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;

/**
 * Handles requests for the application home page.
 */
@Controller
public class HomeController {
	
	@RequestMapping(value = "/", method = RequestMethod.GET)
	public String home(Locale locale, Model model) {
		return "login";
	
	}

	@GetMapping("main")
	public void main() {}
	
	@GetMapping("memberUpdate")
	public void memberUpdate() {}
	
	@GetMapping("welfare")
	public void welfare() {}
	
}

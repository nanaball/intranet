package com.bitc.intranet.controller;

import java.util.List;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseBody;

import com.bitc.intranet.service.RecentService;
import com.bitc.intranet.vo.BoardVO;

import lombok.RequiredArgsConstructor;
import lombok.extern.slf4j.Slf4j;

@Controller
@RequestMapping("/Board")
@RequiredArgsConstructor
@Slf4j
public class RecentController {

 private final RecentService rs;


 @GetMapping("/recentNotices")
 @ResponseBody
 public List<BoardVO> RecentNotices() throws Exception {
	 
	 return rs.RecentNotices();
	 
 }
	

}

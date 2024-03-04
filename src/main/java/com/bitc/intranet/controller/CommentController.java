package com.bitc.intranet.controller;

import java.util.List;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseBody;

import com.bitc.intranet.service.CommentService;
import com.bitc.intranet.vo.CommentVO;

import lombok.RequiredArgsConstructor;

@Controller
@RequestMapping("/comment")
@RequiredArgsConstructor
public class CommentController {
	
	private final CommentService cs;
	
	// 전체 댓글 목록
	@GetMapping("/{bno}/list")
	@ResponseBody
	public List<CommentVO> commentList(@PathVariable(name="bno") int bno) throws Exception{
		List<CommentVO> list = cs.commentList(bno);
		System.out.println("comment/bno/list : " );
		System.out.println(list);
		return list; 
	}
}

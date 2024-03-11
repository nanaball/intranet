package com.bitc.intranet.controller;

import java.util.List;
import java.util.Map;

import org.springframework.http.HttpHeaders;
import org.springframework.http.HttpStatus;
import org.springframework.http.ResponseEntity;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.DeleteMapping;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PatchMapping;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestBody;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseBody;

import com.bitc.intranet.service.CommentService;
import com.bitc.intranet.util.Criteria;
import com.bitc.intranet.vo.CommentVO;

import lombok.RequiredArgsConstructor;

@Controller
@RequestMapping("/comment/*")
@RequiredArgsConstructor
public class CommentController {
	
	private final CommentService cs;
	
	// 전체 댓글 목록
	@GetMapping("/{bno}/list")
	@ResponseBody
	public List<CommentVO> commentList(@PathVariable(name="bno") int bno) throws Exception{
		List<CommentVO> list = cs.commentList(bno);
		return list; 
	}
	
	// 댓글 등록
	@PostMapping("joinComment")
	public ResponseEntity<String> addComment(CommentVO vo){
		System.out.println(vo);
		ResponseEntity<String> entity = null;
		// 인코딩용
	 	HttpHeaders headers = new HttpHeaders();
	 	try{
	 		String message = cs.addComment(vo);
	 		headers.add("Content-Type", "text/plain;charset=utf8");
	 		entity = new ResponseEntity<>(message,headers,HttpStatus.OK);
	 	}catch(Exception e){
	 		entity = new ResponseEntity<>(e.getMessage(), HttpStatus.BAD_REQUEST);
	 	}
		return entity;
	}
	
	// 댓글 수정
	@PatchMapping(value="/{noti_cno}", produces="text/plain;charset=utf-8")
	public ResponseEntity<String> update(
			@PathVariable(name="noti_cno") int cno,
			@RequestBody CommentVO vo
			){
		System.out.println("noti_cno : " + cno);
		System.out.println("vo : " + vo);
		vo.setNoti_cno(cno);
		try {
			String result = cs.updateComment(vo);
			return ResponseEntity.ok(result);
		} catch (Exception e) {
			return ResponseEntity.badRequest().body(e.getMessage());
		}
			
	}
	
	// 댓글 삭제
	@DeleteMapping(value="/{cno}",produces="text/plain;charset=utf-8")
	public String delete(
			@PathVariable(name="cno") int cno
			) throws Exception{
		return cs.deleteComment(cno);
		
	}
	
	// 페이징처리
	@GetMapping("/{bno}/{page}/{parPageNum}")
	public Map<String, Object> listpage(
			@PathVariable("bno") int bno,
			Criteria cri) throws Exception{
		System.out.println(cri);
		return cs.commentListPage(bno, cri);
	}
}

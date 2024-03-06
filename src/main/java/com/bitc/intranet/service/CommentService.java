package com.bitc.intranet.service;

import java.util.List;

import org.springframework.stereotype.Service;

import com.bitc.intranet.mapper.CommentMapper;
import com.bitc.intranet.vo.CommentVO;

import lombok.RequiredArgsConstructor;

@Service
@RequiredArgsConstructor
public class CommentService {

	private final CommentMapper mapper;
	
	public List<CommentVO> commentList(int bno) throws Exception{
		return mapper.commentList(bno);
	}
	
	public String addComment(CommentVO vo) throws Exception{
		int result = mapper.insert(vo);
		String message = result == 0 ? "요청처리 실패" : "요청처리 성공";
		return message;
	}

	public String updateComment(CommentVO vo) throws Exception{
		int result = mapper.update(vo);
		return getResult(result);
	}

	private String getResult(int result) {
		return result == 1? "요청 처리 성공" : "요청처리 실패";
	}

	public String deleteComment(int cno) throws Exception{
		return getResult(mapper.delete(cno));
	}

}

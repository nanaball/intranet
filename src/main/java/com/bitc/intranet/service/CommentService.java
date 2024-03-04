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

}

package com.bitc.intranet.service;

import java.util.HashMap;
import java.util.List;
import java.util.Map;

import org.springframework.stereotype.Service;

import com.bitc.intranet.mapper.CommentMapper;
import com.bitc.intranet.util.Criteria;
import com.bitc.intranet.util.PageMaker;
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

	public Map<String, Object> commentListPage(int bno, Criteria cri) {
		Map<String, Object> map = new HashMap<>();
		List<CommentVO> list = mapper.listPage(bno,cri);
		map.put("list", list);
		
		PageMaker pm = new PageMaker();
		pm.setCri(cri);
		
		int totalCount = mapper.totalCount(bno);
		pm.setTotalCount(totalCount);
		map.put("pm", pm);
		
		return map;
	}

}

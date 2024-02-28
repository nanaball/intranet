package com.bitc.intranet.service;

import java.util.List;

import org.springframework.stereotype.Service;

import com.bitc.intranet.mapper.BoardMapper;
import com.bitc.intranet.util.Criteria;
import com.bitc.intranet.util.PageMaker;
import com.bitc.intranet.vo.BoardVO;

import lombok.RequiredArgsConstructor;

@Service
@RequiredArgsConstructor
public class BoardServiceImpl implements BoardService {

	private final BoardMapper dao;
	
	@Override
	public String regist(BoardVO board) throws Exception {
		int result = dao.regist(board);
        if (result == 1) {
            return "success"; // 성공적으로 등록되었음을 알리는 메시지를 반환
        }
        return "fail"; // 등록에 실패했음을 알리는 메시지를 반환
	}

	@Override
	public void updateCnt(int bno) throws Exception {
		dao.updateCnt(bno);
	}

	@Override
	public BoardVO read(int bno) throws Exception {
		return dao.read(bno);
	}

	@Override
	public List<BoardVO> listAll() throws Exception {
		// TODO Auto-generated method stub
		return null;
	}

	@Override
	public String modify(BoardVO board) throws Exception {
		 int result = dao.modify(board);
	        if (result == 1) {
	            return "success"; // 성공적으로 수정되었음을 알리는 메시지를 반환
	        }
	        return "fail"; // 수정에 실패했음을 알리는 메시지를 반환
	}

	@Override
	public String remove(int bno) throws Exception {
		return null;
	}

	@Override
	public List<BoardVO> listCriteria(Criteria cri) throws Exception {
		return dao.listCriteria(cri);
	}

	@Override
	public PageMaker getPageMaker(Criteria cri) throws Exception {
		/*
		 * int totalCount = dao.totalCount(); PageMaker pm = new PageMaker(cri,
		 * totalCount);
		 */
		return null;
	}

}

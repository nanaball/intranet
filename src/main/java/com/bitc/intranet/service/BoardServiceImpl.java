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
public class BoardServiceImpl implements BoardMapper {

	
	@Override
	public int regist(BoardVO board) throws Exception {
		
		return 0;
	}

	@Override
	public void updateCnt(int bno) throws Exception {
		// TODO Auto-generated method stub

	}

	@Override
	public BoardVO read(int bno) throws Exception {
		
		return null;
	}

	@Override
	public List<BoardVO> listAll() throws Exception {
		// TODO Auto-generated method stub
		return null;
	}

	@Override
	public int modify(BoardVO board) throws Exception {
		// TODO Auto-generated method stub
		return 0;
	}

	@Override
	public int delete(int bno) throws Exception {
		// TODO Auto-generated method stub
		return 0;
	}

	@Override
	public List<BoardVO> listCriteria(Criteria cri) throws Exception {
		// TODO Auto-generated method stub
		return null;
	}

	@Override
	public PageMaker getPageMaker(Criteria cri) throws Exception {
		// TODO Auto-generated method stub
		return null;
	}

}

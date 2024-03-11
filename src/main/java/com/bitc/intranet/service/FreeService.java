package com.bitc.intranet.service;

import java.util.List;

import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

import com.bitc.intranet.mapper.FreeMapper;
import com.bitc.intranet.vo.NoticeVO;
import com.bitc.intranet.vo.FreeVO;

import lombok.RequiredArgsConstructor;

@Service
@RequiredArgsConstructor
public class FreeService {

	private final FreeMapper mapper;
	
	/**
	 * 게시글 전체 목록 페이지
	 * @return 전체 게시글 목록을 리스트로 반환
	 */
	public List<FreeVO> listAll() throws Exception{
		return mapper.listAll();
	}

	
	/**
	 * 게시글 작성 - 성공 유무에 따라 메세지 전달
	 * @param 게시글 등록 정보
	 */
	public void regist(FreeVO board)throws Exception{
		mapper.regist(board);
	}


	/** 
	 * 자유게시판에 등록된 게시글 최근 5개 목록
	 * @return
	 * @throws Exception
	 */
	public List<FreeVO> recentFree() throws Exception {
		return mapper.recentFree();
	}


	
	
	/**
	 * 조회수 증가
	 * @param bno 조회수 증가 시킬 게시글 번호 
	 */
	// void updateCnt(int bno)throws Exception;
	
	/**
	 * 게시글 상세보기
	 * @param bno - 상세보기 게시글 번호
	 * @return 조회된 게시글 정보
	 */
	public FreeVO read(int bno) throws Exception{
		return mapper.read(bno);
	}
	
	
	/**
	 * 게시글 수정 - 성공 유무에 따라 메세지 전달
	 * @param vo - 수정할 게시글 정보
	 * @return - 수정 작업 완료 여부를 메시지로 반환
	 */
	public String modify(FreeVO vo) throws Exception{
		return mapper.modify(vo) != 0 ? "수정 완료" : "실패";
	}
	/**
	 * 게시글 삭제 - 성공 유무에 따라 메세지 전달
	 * @param bno - 삭제할 게시글 번호
	 */
	public void remove(int bno) throws Exception{
		mapper.remove(bno);
	}



	
	/**
	 * 페이징 처리된 리스트 목록
	 * @param cri - 페이징 처리된 게시글 목록을 불러올 정보 <br/>
	 * 				page 요청 페이지    <br/> 
	 * 				startrow(검색 시작 행 인덱시 번호)	<br/>
	 * 				perPageNum(검색할 게시글 개수) 	<br/>
	 * @return - 페이징 처리된 게시글 목록을 리스트로 반환
	 */
	// List<BoardVO> listCriteria(Criteria cri)throws Exception;
	
	/**
	 * 페이징 정보 처리
	 * @param cri - 페이징 처리에 필요한 정보
	 * @return	페이징 블럭 출력을 위한 정보를 저장하는 PageMaker 객체 반환
	 */
	// PageMaker getPageMaker(Criteria cri)throws Exception;

	
}

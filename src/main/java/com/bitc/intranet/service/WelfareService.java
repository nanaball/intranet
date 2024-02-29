package com.bitc.intranet.service;

import java.util.List;

import com.bitc.intranet.util.Criteria;
import com.bitc.intranet.util.PageMaker;
import com.bitc.intranet.vo.WelfareVO;

public interface WelfareService {

	
	/**
	 * 복지 상품 추가
	 * @param vo
	 * @throws Exception
	 */
	void addWelfare (WelfareVO vo) throws Exception;
	
	
	/**
	 * 복지 상품 목록
	 * @return
	 * @throws Exception
	 */
	List<WelfareVO> list() throws Exception;
	

	/**
	 * 복지 상품 상세보기
	 * @param mNo
	 * @return
	 * @throws Exception
	 */
	WelfareVO read(int mNo) throws Exception;
	
	
	/**
	 * 복지 상품 수정
	 * @param welfare
	 * @return
	 * @throws Exception
	 */
	String modify(WelfareVO welfare) throws Exception;
	
	
	/**
	 * 복지 상품 삭제
	 * @param vo
	 * @throws Exception
	 */
	void removeWelfare (WelfareVO vo) throws Exception;
	
	
	/**
	 * 페이징 처리된 리스트 목록
	 * @param cri
	 * @return
	 * @throws Exception
	 */
	List<WelfareVO> listCriteria(Criteria cri) throws Exception;
	
	
	/**
	 * 페이징 정보 처리
	 * @param cri
	 * @return
	 * @throws Exception
	 */
	PageMaker getPageMaker (Criteria cri) throws Exception;
}

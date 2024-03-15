package com.bitc.intranet.service;

import java.util.List;

import org.springframework.stereotype.Service;

import com.bitc.intranet.mapper.WelfareMapper;
import com.bitc.intranet.vo.WelfareVO;

import lombok.RequiredArgsConstructor;

@Service
@RequiredArgsConstructor
public class WelfareService {

	private final WelfareMapper mapper;
	
	/**
	 * 복지 상품 추가
	 * @param vo
	 * @throws Exception
	 */
	public void addWelfare(WelfareVO vo) throws Exception{
		mapper.addWelfare(vo);
	}
	
	
	/**
	 * 복지 상품 목록
	 * @return
	 * @throws Exception
	 */
	public List<WelfareVO> list() throws Exception{
		return mapper.list();
	}
	

	/**
	 * 복지 상품 상세보기
	 * @param num
	 * @return
	 * @throws Exception
	 */
	public WelfareVO detail(int num) throws Exception{
		return mapper.detail(num);
	}
	
	
	/**
	 * 복지 상품 수정
	 * @param welfare
	 * @return
	 * @throws Exception
	 */
	public String modify(WelfareVO vo) throws Exception{
		return mapper.modify(vo) != 0 ? "수정완료" : "실패";
		
	}
	
	
	/**
	 * 복지 상품 삭제
	 * @param vo
	 * @throws Exception
	 */
	public void welfareDelete (int num) throws Exception{
		mapper.delete(num);
	}

	/**
	 * 구매하기 눌렀을 때 재고 수량 -1
	 * @param vo
	 * @throws Exception
	 */
	public void buyWelfare(int num) throws Exception{
		mapper.buy(num);
	}
	
	/**
	 * 제품 미리보기
	 */
	public List<WelfareVO> recentWelfare() throws Exception{
		return mapper.recentWelfare();
	}
	
	
//	/**
//	 * 페이징 처리된 리스트 목록
//	 * @param cri
//	 * @return
//	 * @throws Exception
//	 */
//	public List<WelfareVO> listCriteria(Criteria cri) throws Exception{
//	
//	
//	/**
//	 * 페이징 정보 처리
//	 * @param cri
//	 * @return
//	 * @throws Exception
//	 */
//	public PageMaker getPageMaker (Criteria cri) throws Exception;
}

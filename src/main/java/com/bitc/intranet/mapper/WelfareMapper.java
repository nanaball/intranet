package com.bitc.intranet.mapper;

import java.util.List;

import org.apache.ibatis.annotations.Delete;
import org.apache.ibatis.annotations.Insert;
import org.apache.ibatis.annotations.Select;
import org.apache.ibatis.annotations.Update;

import com.bitc.intranet.vo.WelfareVO;

public interface WelfareMapper {

	/**
	 * 복지 제품 등록
	 * @param vo
	 * @throws Exception
	 */
	@Insert("INSERT "
			+ "INTO model (model, price, stock, soldout, pay) "
			+ "VALUES (#{model}, #{price}, #{stock}, #{soldout}, #{pay})")
	void addWelfare(WelfareVO vo) throws Exception;
	
	/**
	 * 복지 제품 리스트
	 * @return
	 * @throws Exception
	 */
	@Select("SELECT * FROM model ORDER BY num DESC")
	List<WelfareVO> list() throws Exception;
	
	/**
	 * 복지 제품 상세보기
	 * @return
	 * @throws Exception
	 */
	@Select("SELECT * FROM model WHERE num = #{num}")
	WelfareVO detail(int num) throws Exception;
	
	/**
	 * 복지 제품 수정
	 * @param vo
	 * @return
	 * @throws Exception
	 */
	@Update("UPDATE model SET model = #{model}, price = #{price}")
	int modify(WelfareVO vo) throws Exception;
	
	/**
	 * 복지 상품 삭제
	 * @param num
	 * @return
	 * @throws Exception
	 */
	@Delete("DELETE FROM model WHERE num = #{num}")
	void delete(int num) throws Exception;
	
	/** 새 제품 미리보기 3개
	 * @return
	 * @throws Exception
	 */
	@Select("SELECT * FROM model ORDER BY num DESC LIMIT 5")
	List<WelfareVO> recentWelfare() throws Exception;
	
	/**
	 * 복지 상품 조회수
	 * @param num
	 * @throws Exception
	 */
	void updateCnt(int num) throws Exception;


	
}

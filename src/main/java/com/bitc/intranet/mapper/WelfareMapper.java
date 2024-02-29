package com.bitc.intranet.mapper;

import java.util.List;

import org.apache.ibatis.annotations.Delete;
import org.apache.ibatis.annotations.Insert;
import org.apache.ibatis.annotations.Select;

import com.bitc.intranet.vo.WelfareVO;

public interface WelfareMapper {

	/**
	 * 복지 제품 등록
	 * @param vo
	 * @throws Exception
	 */
	@Insert("INSERT "
			+ "INTO model (mName, price, stock, soldout, pay, pDate) "
			+ "VALUES (#{mName}, #{price}, #{stock}, #{soldout}, #{pay}, #{pDate})")
	void addWelfare(WelfareVO vo) throws Exception;
	
	/**
	 * 복지 제품 리스트
	 * @return
	 * @throws Exception
	 */
	@Select("SELECT * FROM model ORDER BY mNo DESC")
	List<WelfareVO> list() throws Exception;
	
	/**
	 * 복지 검색 제품 리스트
	 * @return
	 * @throws Exception
	 */
	@Select("SELECT * FROM model WHERE mName = #{mName}")
	List<WelfareVO> search() throws Exception;
	
	/**
	 * 복지 상품 조회수
	 * @param mNo
	 * @throws Exception
	 */
	void updateCnt(int mNo) throws Exception;
	
	@Delete("DELETE FROM model WHERE mNo = #{mNo}")
	int delete(int mNo) throws Exception;
	
}

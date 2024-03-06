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
			+ "INTO model (mName, price, stock, soldout, pay) "
			+ "VALUES (#{mName}, #{price}, #{stock}, #{soldout}, #{pay})")
	void addWelfare(WelfareVO vo) throws Exception;
	
	/**
	 * 복지 제품 리스트
	 * @return
	 * @throws Exception
	 */
	@Select("SELECT * FROM model ORDER BY mNo DESC")
	List<WelfareVO> list() throws Exception;
	
	/**
	 * 복지 제품 상세보기
	 * @return
	 * @throws Exception
	 */
	@Select("SELECT * FROM model WHERE mNo = #{mNo}")
	WelfareVO detail(int mNo) throws Exception;
	
	/**
	 * 복지 제품 수정
	 * @param vo
	 * @return
	 * @throws Exception
	 */
	@Update("UPDATE model SET mName = #{mName}, price = #{price}")
	int modify(WelfareVO vo) throws Exception;
	
	/**
	 * 복지 상품 삭제
	 * @param mNo
	 * @return
	 * @throws Exception
	 */
	@Delete("DELETE FROM model WHERE mNo = #{mNo}")
	void delete(int mNo) throws Exception;
	
//	/**
//	 * 새 제품 미리보기 3개
//	 * @return
//	 * @throws Exception
//	 */
//	@Select("SELECT * FROM model ORDER BY mNo DESC LIMIT 3")
//	List<WelfareVO> recentWelfare() throws Exception;
	
	/**
	 * 복지 상품 조회수
	 * @param mNo
	 * @throws Exception
	 */
	void updateCnt(int mNo) throws Exception;
	
}

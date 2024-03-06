package com.bitc.intranet.mapper;

import java.util.List;

import org.apache.ibatis.annotations.Delete;
import org.apache.ibatis.annotations.Insert;
import org.apache.ibatis.annotations.Select;
import org.apache.ibatis.annotations.Update;
import org.springframework.stereotype.Service;

import com.bitc.intranet.util.Criteria;
import com.bitc.intranet.util.PageMaker;
import com.bitc.intranet.vo.AccuseVO;
import com.bitc.intranet.vo.BoardVO;
import com.bitc.intranet.vo.FreeVO;

public interface AccuseMapper {
	
	/**
	 * 게시글 작성
	 * @param 게시글 등록 정보
	 * @return	성공 유무 메세지
	 */
	@Insert("INSERT INTO accuse(title,content,writer,uno) " 
			+ " VALUES(#{title}, #{content}, #{writer}, #{uno})")
	void regist(AccuseVO board) throws Exception;
	
	/**
	 * 조회수 증가
	 * @param bno 조회수 증가시킬 게시글 번호
	 */
	void updateCnt(int bno) throws Exception;
	
	/**
	 * 게시글 상세보기
	 * @param bno - 상세보기 게시글 번호
	 * @return 조회된 게시글 정보
	 */
	@Select("SELECT * FROM accuse WHERE bno = #{bno}")
	AccuseVO read(int bno) throws Exception;
	
	/**
	 * 게시글 전체 목록 페이지
	 * @return 전체 게시글 목록을 리스트로
	 */
	@Select("SELECT * FROM accuse ORDER BY bno DESC")
	List<AccuseVO> listAll() throws Exception;
	
	/**
	 *  게시글 수정 - 성공 유무에 따라 메세지 전달
	 * @param board - 수정할 게시글 정보
	 * @return - 수정 작업 완료 여부를 메세지로 반환
	 */
	@Update("UPDATE accuse SET title = #{title}, content = #{content}, writer = #{writer}, category = #{category}, regdate = now() WHERE bno = #{bno}")
	int modify(AccuseVO board) throws Exception;
	
	/**
	 * 게시글 삭제
	 * @param bno - 삭제할 게시글 번호
	 * @return - 삭제 완료 여부를 메세지로 반환
	 */
	@Delete("DELETE FROM accuse WHERE bno = #{bno}")
	void remove(int bno) throws Exception;
	
	/**
	 * 페이징 처리된 리스트 목록 
	 * @param cri
	 * @return
	 * @throws Exception
	 */
	@Select("SELECT * FROM accuse ORDER BY bno DESC LIMIT #{startRow}, #{perPageNum}")
	List<AccuseVO> listCriteria(Criteria cri) throws Exception;
	
	/**
	 * 페이징 정보 처리
	 * @param cri
	 * @return
	 * @throws Exception
	 */
	@Select("SELECT * FROM accuse ORDER BY bno DESC LIMIT #{startRow}, #{perPageNum}")
	PageMaker getPageMaker(Criteria cri) throws Exception;
	
	/**
	 * 자유게시판에 등록된 게시글 최근 5개 목록
	 * @return
	 */
	@Select("SELECT * FROM accuse ORDER BY bno DESC LIMIT 5")
    List<AccuseVO> recentAccuse() throws Exception;








	
	
}

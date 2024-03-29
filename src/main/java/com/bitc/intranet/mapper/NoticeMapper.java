package com.bitc.intranet.mapper;

import java.util.List;

import org.apache.ibatis.annotations.Delete;
import org.apache.ibatis.annotations.Insert;
import org.apache.ibatis.annotations.Select;
import org.apache.ibatis.annotations.Update;
import org.springframework.stereotype.Service;

import com.bitc.intranet.util.Criteria;
import com.bitc.intranet.util.PageMaker;
import com.bitc.intranet.vo.NoticeVO;

public interface NoticeMapper {
	
	/**
	 * 게시글 작성
	 * @param 게시글 등록 정보
	 * @return	성공 유무 메세지
	 */
	@Insert("INSERT INTO notice(title, category, content, writer) VALUES(#{title}, #{category}, #{content}, #{writer})")
	int regist(NoticeVO notice) throws Exception;
	
	/**
	 * 조회수 증가
	 * @param bno 조회수 증가시킬 게시글 번호
	 */
	@Update("UPDATE notice SET viewcnt = viewcnt+1 WHERE bno = #{bno}")
	void viewcnt(int bno) throws Exception;
	
	/**
	 * 게시글 상세보기
	 * @param bno - 상세보기 게시글 번호
	 * @return 조회된 게시글 정보
	 */
	@Select("SELECT * FROM notice WHERE bno = #{bno}")
	NoticeVO read(int bno) throws Exception;
	
	/**
	 * 게시글 전체 목록 페이지
	 * @return 전체 게시글 목록을 리스트로
	 */
	@Select("SELECT * FROM notice ORDER BY bno DESC")
	List<NoticeVO> listAll() throws Exception;
	
	/**
	 *  게시글 수정 - 성공 유무에 따라 메세지 전달
	 * @param board - 수정할 게시글 정보
	 * @return - 수정 작업 완료 여부를 메세지로 반환
	 */
	@Update("UPDATE notice SET title = #{title}, content = #{content}, writer = #{writer}, category = #{category}, regdate = now() WHERE bno = #{bno}")
	int modify(NoticeVO notice) throws Exception;
	
	/**
	 * 게시글 삭제
	 * @param bno - 삭제할 게시글 번호
	 * @return - 삭제 완료 여부를 메세지로 반환
	 */
	@Delete("DELETE FROM notice WHERE bno = #{bno}")
	void remove(int bno) throws Exception;
	
	/**
	 * 페이징 처리된 리스트 목록 
	 * @param cri
	 * @return
	 * @throws Exception
	 */
	@Select("SELECT * FROM notice ORDER BY bno DESC LIMIT #{startRow}, #{perPageNum}")
	List<NoticeVO> listCriteria(Criteria cri) throws Exception;
	
	/**
	 * 페이징 정보 처리
	 * @param cri
	 * @return
	 * @throws Exception
	 */
	PageMaker getPageMaker(Criteria cri) throws Exception;

	/**
	 * 메인화면 공지사항 미리보기 5개
	 * @return
	 * @throws Exception
	 */
	@Select("SELECT * FROM notice ORDER BY bno DESC LIMIT 5")
    List<NoticeVO> recentNotices() throws Exception;

	@Select("SELECT count(*) FROM notice")
	int totalCount();

	
}

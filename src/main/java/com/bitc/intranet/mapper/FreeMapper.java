package com.bitc.intranet.mapper;

import java.util.List;

import org.apache.ibatis.annotations.Insert;
import org.apache.ibatis.annotations.Select;
import org.apache.ibatis.annotations.Update;

import com.bitc.intranet.util.Criteria;
import com.bitc.intranet.util.PageMaker;
import com.bitc.intranet.vo.FreeVO;

public interface FreeMapper {
	
	/**
	 * 게시글 작성
	 * @param 게시글 등록 정보
	 * @return	성공 유무 메세지
	 */
	@Insert("INSERT INTO free(title, category, content,writer,uno) " 
			+ " VALUES(#{title}, #{category}, #{content}, #{writer}, #{uno})")
	void regist(FreeVO board) throws Exception;
	
	@Update("UPDATE free SET origin = LAST_INSERT_ID() "
			+ " WHERE bno = LAST_INSERT_ID()")
	void updateOrigin() throws Exception;
	
	/**
	 * 조회수 증가
	 * @param bno 조회수 증가시킬 게시글 번호
	 */
	@Update("UPDATE free SET viewcnt = viewcnt + 1 WHERE bno = #{bno}")
	void updateCnt(int bno) throws Exception;
	
	/**
	 * 게시글 상세보기
	 * @param bno - 상세보기 게시글 번호
	 * @return 조회된 게시글 정보
	 */
	@Select("SELECT * FROM free WHERE bno = #{bno}")
	FreeVO read(int bno) throws Exception;
	
	/**
	 * 게시글 전체 목록 페이지
	 * @return 전체 게시글 목록을 리스트로
	 */
	@Select("SELECT * FROM free ORDER BY origin DESC, seq ASC")
	List<FreeVO> listAll() throws Exception;
	
	/**
	 *  게시글 수정 - 성공 유무에 따라 메세지 전달
	 * @param board - 수정할 게시글 정보
	 * @return - 수정 작업 완료 여부를 메세지로 반환
	 */
	@Update("UPDATE free SET title = #{title},  category = #{category}, content = #{content}, writer = #{writer}, updatedate = now() WHERE bno = #{bno}")
	int modify(FreeVO board) throws Exception;
	
	/**
	 * 게시글 삭제
	 * @param bno - 삭제할 게시글 번호
	 * @return - 삭제 완료 여부를 메세지로 반환
	 */
	@Update("Update free set "
			+ " showboard = 'n' , "
			+ " updatedate = now() "
			+ " WHERE bno = #{bno}")
	void remove(int bno) throws Exception;
	
	/**
	 * 페이징 처리된 리스트 목록 
	 * @param cri
	 * @return
	 * @throws Exception
	 */
	@Select("SELECT * FROM free ORDER BY origin DESC, seq ASC LIMIT #{startRow}, #{perPageNum}")
	List<FreeVO> listCriteria(Criteria cri) throws Exception;
	
	/**
	 * 페이징 정보 처리
	 * @param cri
	 * @return
	 * @throws Exception
	 */
	PageMaker getPageMaker(Criteria cri) throws Exception;

	/**
	 * 총 게시글 갯수
	 * @return
	 */
	@Select("SELECT count(*) FROM free")
	int totalCount();

	
	/**
	 * 자유게시판에 등록된 게시글 최근 5개 목록
	 * @return
	 */
	@Select("SELECT * FROM free ORDER BY bno DESC LIMIT 5")
    List<FreeVO> recentFree() throws Exception;

	/**
	 * 답변글 작성 등록
	 */
	@Insert("INSERT INTO free(title,content,writer,origin,depth,seq,uno, category) "
			+ "VALUES(#{title},#{content},#{writer},#{origin},#{depth},#{seq},#{uno} ,#{category})")
	public void freeReplyRegister(FreeVO reply) throws Exception;

	/**
	 * 작성한 답변글 페이지 위치
	 * @param reply
	 * @throws Exception
	 */
	@Update("UPDATE free SET seq = seq + 1 WHERE origin = #{origin} AND seq > #{seq}")
	void updateReply(FreeVO reply)throws Exception;


	/**
	 * 게시글 제목으로 검색
	 * @param search
	 * @return
	 */
	@Select("SELECT * FROM free WHERE title LIKE CONCAT('%',#{search},'%') ")
	/* + " ORDER BY bno DESC LIMIT #{startRow}, #{perPageNum}") */ 
	public List<FreeVO> freeSearch(String search);

	




	
	
}

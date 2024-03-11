package com.bitc.intranet.mapper;

import java.util.List;

import org.apache.ibatis.annotations.Delete;
import org.apache.ibatis.annotations.Insert;
import org.apache.ibatis.annotations.Param;
import org.apache.ibatis.annotations.Select;
import org.apache.ibatis.annotations.Update;

import com.bitc.intranet.util.Criteria;
import com.bitc.intranet.vo.CommentVO;

public interface CommentMapper {

	/**
	 * 전체 댓글 목록
	 */
	@Select("SELECT * FROM notice_comment WHERE bno = #{bno} ORDER BY noti_cno DESC")
	List<CommentVO> commentList(int bno);

	/**
	 * 댓글 등록
	 */
	@Insert("INSERT INTO notice_comment(bno,noti_content,author) VALUES(#{bno},#{noti_content},#{author})")
	int insert(CommentVO vo) throws Exception;
	
	/**
	 * 댓글 수정 
	 */
	@Update("UPDATE notice_comment SET noti_content = #{noti_content}, author = #{author}, noti_updatedate = now() WHERE noti_cno = #{noti_cno}")
	int update(CommentVO vo) throws Exception;

	/**
	 * 댓글 삭제 
	 */
	@Delete("DELETE FROM notice_comment WHERE noti_cno = #{noti_cno}")
	int delete(int cno) throws Exception;

	
	/**
	 * @param bno - 페이징 처리된 댓글을 검색할 게시글 번호
	 * @param cri 
	 * @return - 페이징 처리된 게시글 목록
	 */
	@Select("SELECT * FROM notice_comment WHERE bno = #{bno} ORDER BY noti_cno DESC limit #{cri.startRow}, #{cri.perPageNum}")
	List<CommentVO> listPage(@Param("bno")int bno, @Param("cri")Criteria cri) throws Exception;
	
	/**
	 * @param bno - 검색할 게시글 번호
	 * @return
	 */
	@Select("SELECT count(*) FROM notice_comment WHERE bno = #{bno}")
	int totalCount(int bno) throws Exception;
}

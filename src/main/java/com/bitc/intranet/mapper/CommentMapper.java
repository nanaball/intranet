package com.bitc.intranet.mapper;

import java.util.List;

import org.apache.ibatis.annotations.Delete;
import org.apache.ibatis.annotations.Insert;
import org.apache.ibatis.annotations.Select;
import org.apache.ibatis.annotations.Update;

import com.bitc.intranet.vo.CommentVO;

public interface CommentMapper {

	/**
	 * 전체 댓글 목록
	 * @param bno
	 * @return
	 */
	@Select("SELECT * FROM notice_comment WHERE bno = #{bno} ORDER BY noti_cno DESC")
	List<CommentVO> commentList(int bno);

	@Insert("INSERT INTO notice_comment(bno,noti_content,author) VALUES(#{bno},#{noti_content},#{author})")
	int insert(CommentVO vo) throws Exception;

	@Update("UPDATE notice_comment SET noti_content = #{noti_content}, author = #{author}, noti_updatedate = now() WHERE noti_cno = #{noti_cno}")
	int update(CommentVO vo) throws Exception;

	@Delete("DELETE FROM notice_comment WHERE noti_cno = #{noti_cno}")
	int delete(int cno) throws Exception;
}

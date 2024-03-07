package com.bitc.intranet.mapper;

import java.util.List;

import org.apache.ibatis.annotations.Delete;
import org.apache.ibatis.annotations.Insert;
import org.apache.ibatis.annotations.Param;
import org.apache.ibatis.annotations.Select;

import com.bitc.intranet.vo.MessageVO;

public interface MessageFileMapper {

	/**
	 * 첨부파일 등록
	 */
	@Insert("INSERT INTO attach_tbl(fullName, mno) "
			+ "VALUES(#{fullName}, LAST_INSERT_ID())")
	void addAttach(String fullName)throws Exception;
	
	/**
	 * 첨부파일 목록 검색
	 */
	@Select("SELECT fullName FROM attach_tbl WHERE mno = #{mno}")
	List<String> getAttach(int mno)throws Exception;

	/**
	 * @param bno - 게시글 번호가 일치하는 첨부파일 삭제
	 */
	@Delete("DELETE FROM attach_tbl WHERE mno = #{mno}")
	void deleteAttach(int mno) throws Exception;

	@Insert("INSERT INTO attach_tbl(fullName, mno) "
			+ "VALUES(#{fullName} , #{mno})")
	void replaceAttach(@Param("mno")int mno, @Param("fullname")String fullName) throws Exception;

	


}


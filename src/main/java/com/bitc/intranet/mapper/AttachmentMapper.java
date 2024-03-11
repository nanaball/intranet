package com.bitc.intranet.mapper;

import java.util.List;

import org.apache.ibatis.annotations.Insert;
import org.apache.ibatis.annotations.Select;

public interface AttachmentMapper {

	/**
	 * 첨부파일 등록 
	 */
	@Insert("INSERT INTO noti_attach(fullName, bno) VALUES(#{fullName},LAST_INSERT_ID())")
	void addAttach(String fullName) throws Exception;

	/**
	 * 첨부된 파일 목록 검색 
	 */
	@Select("SELECT fullName FROM noti_attach WHERE bno = #{bno}")
	List<String> getAttach(int bno);

}

package com.bitc.intranet.mapper;

import org.apache.ibatis.annotations.Insert;

public interface AttachmentMapper {

	/**
	 * 첨부파일 등록 
	 */
	@Insert("INSERT INTO noti_attach(fullName, bno) VALUES(#{fullName},LAST_INSERT_ID())")
	void addAttach(String fullName) throws Exception;

}

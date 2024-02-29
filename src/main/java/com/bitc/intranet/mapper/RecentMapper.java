package com.bitc.intranet.mapper;

import java.util.List;

import org.apache.ibatis.annotations.Select;

import com.bitc.intranet.vo.BoardVO;

public interface RecentMapper {
	
	/**
	 * 공지사항에 등록된 게시글 최근 5개 목록
	 * @return
	 */
	@Select("SELECT * FROM notice ORDER BY bno DESC LIMIT 5")
    List<BoardVO> findRecentNotices() throws Exception;

}


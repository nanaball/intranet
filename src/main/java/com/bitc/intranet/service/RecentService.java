package com.bitc.intranet.service;

import java.util.List;


import com.bitc.intranet.vo.BoardVO;

public interface RecentService {
	
	/**
	 * 공지사항에 등록된 게시글 최근 5개 목록
	 * @return
	 * @throws Exception
	 */
	List<BoardVO> RecentNotices() throws Exception;

}

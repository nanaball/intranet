package com.bitc.intranet.service;

import java.util.List;

import org.springframework.stereotype.Service;

import com.bitc.intranet.mapper.MemberMapper;
import com.bitc.intranet.mapper.RecentMapper;
import com.bitc.intranet.vo.BoardVO;

import lombok.RequiredArgsConstructor;
import lombok.extern.slf4j.Slf4j;

@Slf4j
@Service
@RequiredArgsConstructor
public class RecentServiceImpl implements RecentService {

	private final RecentMapper mapper;
        
	@Override
	public List<BoardVO> RecentNotices() throws Exception {
        return mapper.findRecentNotices();
	}

}

package com.bitc.intranet.service;

import java.util.List;

import org.springframework.stereotype.Service;

import com.bitc.intranet.mapper.MemberMapper;
import com.bitc.intranet.vo.MemberVO;

import lombok.RequiredArgsConstructor;
import lombok.extern.slf4j.Slf4j;

@Slf4j
@Service
@RequiredArgsConstructor
public class MemberServiceImpl implements MemberService {

	private final MemberMapper mapper;
	
	
	@Override
	public void addMember(MemberVO vo) throws Exception {
		mapper.create(vo);
	}

	@Override
	public List<MemberVO> list() throws Exception {
		// TODO Auto-generated method stub
		return null;
	}

	@Override
	public MemberVO readMember(String uid, int mno) throws Exception {
		// TODO Auto-generated method stub
		return null;
	}

}

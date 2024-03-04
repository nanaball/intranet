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
	
	
	// 회원가입시 저장할 회원정보- 완
	@Override
	public void addMember(MemberVO vo) throws Exception {
		mapper.create(vo);
	}

	@Override
	public List<MemberVO> list() throws Exception {
		return null;
	}

	// 중복 아이디 찾기 위한 아이디 검색 -완
	@Override
	public MemberVO readMember(String uid) throws Exception {
		return mapper.readMember(uid);
	}

	// 로그인 -- 완
	@Override
	public MemberVO login(MemberVO memberVO) throws Exception {
		return mapper.loginMember(memberVO);
	}

	@Override
	public MemberVO findPass(MemberVO memberVO) throws Exception {
		return mapper.findPass(memberVO);
	}

	
	@Override
	public void changePass(MemberVO vo) throws Exception {
		mapper.changePass(vo);		
	}

}

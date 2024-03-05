package com.bitc.intranet.service;

import org.springframework.stereotype.Service;

import com.bitc.intranet.mapper.MemberUpdateMapper;
import com.bitc.intranet.vo.MemberVO;

import lombok.RequiredArgsConstructor;

@Service
@RequiredArgsConstructor
public class MemberUpdateService {

	private final MemberUpdateMapper mapper;
	
	// 회원 비밀번호 읽기
	public void readMemberPass(MemberVO vo) throws Exception{
		mapper.readMemberPass(vo);
	}
	
	// 회원이 작성한 수정 정보 입력
	public MemberVO UpdateMember(MemberVO vo) throws Exception{
		return mapper.updateMember(vo);
	}
	
	
	
}

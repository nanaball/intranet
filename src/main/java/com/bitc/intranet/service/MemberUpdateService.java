package com.bitc.intranet.service;

import java.util.List;

import java.util.List;

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
	
	public List<MemberVO> list(MemberVO vo) throws Exception{
		return mapper.list();
	}
	
	// 회원 정보 읽기
	public MemberVO detail(String uno) throws Exception{
		return mapper.memberDetail(uno);
	}
	
	// 회원이 작성한 수정 정보 입력
	public String updateMember(MemberVO vo) throws Exception{
		return mapper.updateMember(vo) != 0 ? "정보 수정 완료" : "정보 수정 실패";
	}


	
}

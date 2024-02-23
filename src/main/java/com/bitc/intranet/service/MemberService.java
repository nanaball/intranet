package com.bitc.intranet.service;

import java.util.List;

import com.bitc.intranet.vo.MemberVO;

public interface MemberService {
	


	/**
	 * 회원 가입한 회원 정보 등록 -- 완 
	 * @param vo - 회원 가입한 회원 정보
	 * uid, upw, uname, uemail, uphone, udep, ujob, udate
	 */
	void addMember(MemberVO vo) throws Exception;

	/**
	 * 
	 * @return - 등록된 전체 회원 목록
	 * @throws Exception
	 */
	List<MemberVO> list() throws Exception;
	
	/**
	 * 중복 아이디 검색할 회원아이디 -- 완
	 * @param uid - 회원 아이디
	 * @return
	 * @throws Exception
	 */
	MemberVO readMember (String uid) throws Exception;
	
	 //로그인 
	 MemberVO login(MemberVO memberVO) throws Exception;
}

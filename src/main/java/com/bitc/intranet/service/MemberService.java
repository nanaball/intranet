package com.bitc.intranet.service;

import java.util.List;

import com.bitc.intranet.vo.MemberVO;

public interface MemberService {
	


	/**
	 * 
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
	 * 
	 * @param uid - 회원 아이디
	 * @param mno - 회원번호 
	 * @return
	 * @throws Exception
	 */
	MemberVO readMember (String uid, int uno) throws Exception;
}

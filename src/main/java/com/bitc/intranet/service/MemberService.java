package com.bitc.intranet.service;

import java.util.List;

import com.bitc.intranet.vo.MemberVO;

public interface MemberService {
	


	/**
	 * 
	 * @param vo - 회원 가입한 회원 정보
	 * uid, upw, uname, uemail, uphone, udep, ujob, udate
	 */
	public void addMember(MemberVO vo) throws Exception;

	/**
	 * 
	 * @return - 등록된 전체 회원 목록
	 * @throws Exception
	 */
	public List<MemberVO> list() throws Exception;
	
	/**
	 * 
	 * @param uid - 회원 아이디
	 * @return
	 * @throws Exception
	 */
	public MemberVO readMember (String uid) throws Exception;
	

	//로그인 
	public MemberVO login(MemberVO memberVO) throws Exception;


	//비밀번호찾기 
	public MemberVO findPass(MemberVO memberVO) throws Exception;
	
	//비밀번호 변경
	public void changePass(String repw) throws Exception;

	
}

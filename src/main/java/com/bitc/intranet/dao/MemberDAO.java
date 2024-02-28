package com.bitc.intranet.dao;

import java.util.List;

import com.bitc.intranet.vo.MemberVO;

public interface MemberDAO {
	
	
	
	/*
	 * @param member - 등록한 사원 정보
	 * @return - 삽입된 사원 행 개수
	 */
	int insertMember (MemberVO member);
	
	/*
	 * @param userid - 검색할 사원 아이디
	 * @return - 아이디가 일치하는 사원 정보
	 */
	MemberVO readMember(String uId);
	
	/*
	 * @param uId - 검색할 사원 아이디
	 * @param uPw - 검색할 사원 비밀번호
	 * @return - 아이디와 패스워드가 일치하는 사원 정보 - 없으면 null
	 */
	MemberVO readMemberWithPass(String uId, String uPw);
	
	/*
	 * @return - 전체 사원 목록
	 */
	List<MemberVO> readMemberList();
	
	/*
	 * @param member - 수정할 사원 정보
	 * @return - 수정한 행의 개수
	 */
	int updateMember (MemberVO member);
	
	/*
	 * @param uNo - 삭제할 사원 번호
	 * @return - 삭제한 행의 개수
	 */
	int removeMember (int uNo);
}

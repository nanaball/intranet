package com.bitc.intranet.service;

import java.util.List;

import com.bitc.intranet.util.Criteria;
import com.bitc.intranet.util.PageMaker;
import com.bitc.intranet.vo.AccuseVO;
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
	public List<MemberVO> listAll() throws Exception;
	
	/**
	 * 
	 * @param uid - 회원 아이디
	 * @return
	 * @throws Exception
	 */
	public MemberVO readMember (String uid) throws Exception;
	

	//로그인 
	public MemberVO login(MemberVO memberVO) throws Exception;

	public static void memberUpdate(MemberVO vo) {
		
	}

	//비밀번호찾기 
	public MemberVO findPass(MemberVO memberVO) throws Exception;
	
	//비밀번호 변경

	public void changePass(MemberVO vo) throws Exception;

	// 페이징 처리된 리스트 목록
	public List<MemberVO> listCriteria(Criteria cri);

	// 페이징 정보 처리
	public PageMaker getPageMaker(Criteria cri);
	
	// 회원 이름 검색
	public List<MemberVO> accuseSearch(String search);






	
}

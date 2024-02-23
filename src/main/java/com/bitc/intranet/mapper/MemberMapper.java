package com.bitc.intranet.mapper;

import java.lang.reflect.Member;
import java.util.List;

import org.apache.ibatis.annotations.Insert;
import org.apache.ibatis.annotations.Select;
import org.apache.ibatis.annotations.Update;

import com.bitc.intranet.vo.MemberVO;

public interface MemberMapper {

	/**
	 * memeber 등록
	 * @param vo - 등록할 회원 정보
	 */
	@Insert("INSERT INTO member(uid, upw, uname, uemail, uphone, udep, ujob, udate) " 
			+ " VALUES(#{uid}, #{upw}, #{uname}, #{uemail}, #{uphone}, #{udep}, #{ujob}, #{udate})")
	void create(MemberVO vo)throws Exception;

		
	/**
	 * 
	 * @param uno - 찾을 회원 번호 
	 * @return - uno가 일치하는 하나의 회원 정보 
	 */
	@Select("SELECT * FROM Member WHERE uno = #{uno}")
	MemberVO readMember(int uno) throws Exception;
	
	/**
	 * 
	 * @return - 테이블에 등록된 전체 회원 목록
	 */
	@Select("SELECT * FROM member ORDER BY uno DESC")
	List<MemberVO> list() throws Exception;
	
	/**
	 * 
	 * @param uid와 upw 가 일치하는 로그인정보
	 */
	@Select("SELECT * FROM Member WHERE uid = #{uid} and upw = #{upw}")
	MemberVO loginMember(String uid, String upw ) throws Exception;
}

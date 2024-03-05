package com.bitc.intranet.mapper;

import org.apache.ibatis.annotations.Delete;
import org.apache.ibatis.annotations.Select;
import org.apache.ibatis.annotations.Update;

import com.bitc.intranet.vo.MemberVO;

public interface MemberUpdateMapper {

	// 수정할 회원의 비밀번호 읽기
	@Select("SELECT upw FROM Member WHERE uid = #{uid}")
	MemberVO readMemberPass(MemberVO vo) throws Exception;
	
	// 회원 수정
	@Update("UPDATE member SET upw = #{newUpw}, uname = #{uname}, uemail = #{uemail}, uphone = #{uphone}, uaddr = #{uaddr} WHERE uid = #{uid}")
	MemberVO updateMember(MemberVO vo) throws Exception;
	
	// 회원 탈퇴
	@Delete("DELETE FROM member WHERE uid = (#uid)")
	void Delete (MemberVO vo) throws Exception;
	
}

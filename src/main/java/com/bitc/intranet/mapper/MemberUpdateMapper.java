package com.bitc.intranet.mapper;

import org.apache.ibatis.annotations.Delete;
import org.apache.ibatis.annotations.Select;
import org.apache.ibatis.annotations.Update;

import com.bitc.intranet.vo.MemberVO;

public interface MemberUpdateMapper {

	@Select("SELECT * FROM Member WHERE uid = #{uid}")
	MemberVO readMember(String uid) throws Exception;
	
	// 회원 수정
	@Update("UPDATE * FROM member SET upw = #{newUpw}, uname = #{uname}, uemail = #{uemail}, uphone = #{uphone}, uaddr = #{uaddr} WHERE uid = #{uid}")
	MemberVO updateMember(MemberVO vo) throws Exception;
	
	// 회원 탈퇴
	@Delete("DELETE FROM member WHERE uid = (#uid)")
	void Delete (MemberVO vo) throws Exception;
	
}

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
	 * @param mno - 수신 확인할 메세지 번호 
	 * 사용자가 메세지 수신 확인하면 opendate column 정보를 수신 확인한 시간으로 수정
	 */
	@Update("UPDATE tbl_message SET opendate = now() WHERE mno = #{mno}")
	void updatemessage(int mno) throws Exception;
	
	
	/**
	 * 
	 * @param mno - 확인할 메세지 번호 
	 * @return - mno가 일치하는 하나의 메세지 정보 반환
	 */
	@Select("SELECT * FROM tbl_message WHERE mno = #{mno}")
	MemberVO readMessage(int mno) throws Exception;
	
	/**
	 * 
	 * @return - 테이블에 등록된 전체 메세지 목록
	 */
	@Select("SELECT * FROM member ORDER BY uno DESC")
	List<MemberVO> list() throws Exception;
}

package com.bitc.intranet.mapper;

import java.util.List;

import org.apache.ibatis.annotations.Insert;
import org.apache.ibatis.annotations.Select;
import org.apache.ibatis.annotations.Update;

import com.bitc.intranet.vo.NoticeVO;
import com.bitc.intranet.vo.MessageVO;

public interface MessageMapper {

	@Insert("INSERT INTO message_tbl(title,targetid,content,writer,mno) "
			+ " VALUES(#{title},#{targetid}, #{content}, #{writer}, #{mno})")
	void register(MessageVO vo) throws Exception;
	/**
	 * 전체 원본글 게시글 목록을 검색
	 * origin으로 정렬 후 같은 origin 값이면 seq 오름차순으로 정렬
	 */
	@Select("SELECT * FROM message_tbl WHERE writer = #{uname} ORDER BY mno DESC")
	List<MessageVO> list(String uname) throws Exception;
	
	//+더보기 수신함
	@Select("SELECT * FROM message_tbl WHERE targetid = #{uid} ORDER BY mno DESC")
	List<MessageVO> sendList(String uid) throws Exception;
	
	// List<MessageVO> messageList

	@Update("UPDATE message_tbl SET title=#{title}, content=#{content}, writer=#{writer}, updatedate=now() WHERE mno=${mno}")
	String modify(MessageVO vo)throws Exception;

	@Update("UPDATE message_tbl SET showboard='n',updatedate=now() WHERE mno=${mno}")
	void remove(int mno) throws Exception;

	/**
	 * 매개변수로 전달받은 게시글번호와 일치하는 게시글 정보 반환
	 */
	@Select("SELECT * FROM message_tbl WHERE mno = #{mno}")
	MessageVO readMessage(int mno) throws Exception;

	//지정된 타겟아이디로 받은결제 목록을 띄워줌-> list목록도 똑같이!!!
	@Select("SELECT * FROM message_tbl WHERE targetid = #{uid} ORDER BY mno DESC LIMIT 5")
    List<MessageVO> recentMessage(String uid) throws Exception;

	
}





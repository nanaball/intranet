package com.bitc.intranet.mapper;

import java.util.List;

import org.apache.ibatis.annotations.Insert;
import org.apache.ibatis.annotations.Param;
import org.apache.ibatis.annotations.Select;
import org.apache.ibatis.annotations.Update;

import com.bitc.intranet.util.Criteria;
import com.bitc.intranet.vo.MessageVO;

public interface MessageMapper {

	@Insert("INSERT INTO message_tbl(title,targetid,content,writer,mno) "
			+ " VALUES(#{title},#{targetid}, #{content}, #{writer}, #{mno})")
	void register(MessageVO vo) throws Exception;
	
	//내가쓴 결제서류 리스트
	@Select("SELECT * FROM message_tbl WHERE writer = #{uname} ORDER BY mno DESC")
	List<MessageVO> list(String uname) throws Exception;
	
	//받은결제사항 정리
	@Select("SELECT * FROM message_tbl WHERE targetid = #{uid} ORDER BY mno DESC")
	List<MessageVO> sendList(String uid) throws Exception;
	
	@Update("UPDATE message_tbl SET title=#{title}, content=#{content}, targetid=#{targetid}, updatedate=now() WHERE mno=${mno}")
	void messageModify(MessageVO vo) throws Exception;

	@Update("DELETE FROM message_tbl WHERE mno=${mno}")
	void remove(int mno) throws Exception;

	/**
	 * 매개변수로 전달받은 게시글번호와 일치하는 게시글 정보 반환
	 */
	@Select("SELECT * FROM message_tbl WHERE mno = #{mno}")
	MessageVO readMessage(int mno) throws Exception;

	//지정된 타겟아이디로 받은결제 목록을 띄워줌-> list목록도 똑같이!!!
	@Select("SELECT * FROM message_tbl WHERE targetid = #{uid} ORDER BY mno DESC LIMIT 5")
    List<MessageVO> recentMessage(String uid) throws Exception;
	
	//보낸결재 페이징처리
	@Select("SELECT * FROM message_tbl WHERE writer = #{uname} ORDER BY mno DESC LIMIT #{cri.startRow}, #{cri.perPageNum}")
	List<MessageVO> listCriteria(@Param("cri") Criteria cri, @Param("uname")String uname) throws Exception;
	
	
	@Select("SELECT count(*) FROM message_tbl")
	int totalCount();

}





package com.bitc.intranet.service;

import java.util.List;

import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

import com.bitc.intranet.mapper.MessageFileMapper;
import com.bitc.intranet.mapper.MessageMapper;
import com.bitc.intranet.util.Criteria;
import com.bitc.intranet.util.PageMaker;
import com.bitc.intranet.vo.MessageVO;

import lombok.RequiredArgsConstructor;

@Service
@RequiredArgsConstructor
public class MessageService {
	
	private final MessageMapper mapper;
	private final MessageFileMapper filemapper;
	
	@Transactional
	public void regist(MessageVO message) throws Exception{
		// 원본글 등록
		mapper.register(message);
		// 등록된 원본글 번호로 origin 컬럼 번호 수정
		
		List<String> files = message.getFiles();
		if(files != null && !files.isEmpty()) {
			for(String fullName : files) {
				filemapper.addAttach(fullName);
			}
		}
	}
	public List<MessageVO> list(String uname) throws Exception {
		List<MessageVO> list = mapper.list(uname);
		for(MessageVO v : list) {
			MessageVO message = new MessageVO();
			message.setFiles(filemapper.getAttach(v.getMno()));
		}
		return list;
	}
	//+더보기 수신함 List
	public List<MessageVO> sendList(String uid) throws Exception {
		List<MessageVO> sendList = mapper.sendList(uid);
		for(MessageVO v : sendList) {
			MessageVO message = new MessageVO();
			message.setFiles(filemapper.getAttach(v.getMno()));
		}
		return sendList;
	}
	
	
	public MessageVO readMessage(int bno) throws Exception{
		MessageVO vo = mapper.readMessage(bno);
		// 첨부파일 목록 추가
		List<String> fileList = filemapper.getAttach(bno);
		vo.setFiles(fileList);
		return vo;
	}
	public MessageVO read(int mno) throws Exception{
		MessageVO message = mapper.readMessage(mno);
		List<String> fileList = filemapper.getAttach(mno);
		message.setFiles(fileList);
		return message;
	}
	public void messageModify(MessageVO vo) throws Exception{
		//targetid, message 수정하기
		mapper.messageModify(vo);
		
		filemapper.deleteAttach(vo.getMno());
		//변경된 첨부파일 목록등록
		List<String> fileList = vo.getFiles();
		if(fileList !=null && !fileList.isEmpty()) {
			for(String fullName : fileList) {
				filemapper.replaceAttach(vo.getMno(), fullName);
			}
		}
	}
	public void remove(int mno) throws Exception{
		filemapper.deleteAttach(mno);
		mapper.remove(mno);
		
	}
	//메인에서 게시글 5개 미리보기

	public List<MessageVO> recentMessage(String uid) throws Exception{
		return mapper.recentMessage(uid);

	}
	

	
	
	//작성자 이름으로 쓰인 결제 페이징처리
	 
	public List<MessageVO> listCriteria(Criteria Cri,String uname)throws Exception{
		return mapper.listCriteria(Cri, uname);
	};
	
	
	public PageMaker getPageMaker(Criteria cri)throws Exception{
		int totalCount = mapper.totalCount();
		PageMaker pm = new PageMaker(cri, totalCount); 
		return pm;
     };



}

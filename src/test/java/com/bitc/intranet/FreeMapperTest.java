package com.bitc.intranet;

import org.junit.Test;
import org.junit.runner.RunWith;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.test.context.ContextConfiguration;
import org.springframework.test.context.junit4.SpringJUnit4ClassRunner;

import com.bitc.intranet.mapper.FreeMapper;
import com.bitc.intranet.vo.NoticeVO;
import com.bitc.intranet.vo.AccuseVO;
import com.bitc.intranet.vo.FreeVO;

@RunWith(SpringJUnit4ClassRunner.class)
@ContextConfiguration(
	locations = {"classpath:/spring/root-context.xml"}
)
public class FreeMapperTest {

	@Autowired
	FreeMapper fs;
	
	// @Test
	public void testBoard() throws Exception{
		FreeVO vo = new FreeVO();
		vo.setTitle("첫게시글 테스트");
		vo.setCategory("사담");
		vo.setContent("내용ㅇㅇㅇㅇㅇ");
		vo.setWriter("관리자");
		vo.setUno(1);
		fs.regist(vo);
	}
	

}

package com.bitc.intranet;

import org.junit.Test;
import org.junit.runner.RunWith;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.test.context.ContextConfiguration;
import org.springframework.test.context.junit4.SpringJUnit4ClassRunner;

import com.bitc.intranet.mapper.FreeMapper;
import com.bitc.intranet.vo.BoardVO;
import com.bitc.intranet.vo.FreeVO;

@RunWith(SpringJUnit4ClassRunner.class)
@ContextConfiguration(
	locations = {"classpath:/spring/root-context.xml"}
)
public class FreeMapperTest {

	@Autowired
	FreeMapper fs;
	
	@Test
	public void testBoard() throws Exception{
		FreeVO vo = new FreeVO();
		vo.setTitle("제목ㄱㄱㄱㄱㄱ");
		vo.setCategory("카테고리");
		vo.setContent("내용ㅇㅇㅇㅇㅇ");
		vo.setWriter("작성자ㅏㅏㅏㅏㅏ");
		
		fs.regist(vo);
	}
}

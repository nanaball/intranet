package com.bitc.intranet;

import org.junit.Test;
import org.junit.runner.RunWith;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.test.context.ContextConfiguration;
import org.springframework.test.context.junit4.SpringJUnit4ClassRunner;

import com.bitc.intranet.service.BoardService;
import com.bitc.intranet.vo.BoardVO;

@RunWith(SpringJUnit4ClassRunner.class)
@ContextConfiguration(
	locations = {"classpath:/spring/root-context.xml"}
)
public class BoardServiceTest {
	
	@Autowired
	BoardService bs;
	
	@Test
	public void testBoard() throws Exception{
		BoardVO vo = new BoardVO();
		vo.setTitle("gd");
		vo.setCategory("1");
		vo.setContent("2");
		vo.setWriter("3");
		
		bs.regist(vo);

		
	}
}

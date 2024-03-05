package com.bitc.intranet;

import java.util.List;

import org.junit.Test;
import org.junit.runner.RunWith;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.test.context.ContextConfiguration;
import org.springframework.test.context.junit4.SpringJUnit4ClassRunner;

import com.bitc.intranet.mapper.BoardMapper;
import com.bitc.intranet.vo.BoardVO;

@RunWith(SpringJUnit4ClassRunner.class)
@ContextConfiguration(
	locations = {"classpath:/spring/root-context.xml"}
)
public class BoardMapperTest {
	
	@Autowired
	BoardMapper bs;
	
	@Test
	public void testBoard() throws Exception{
		BoardVO vo = new BoardVO();
		vo.setTitle("qq");
		vo.setCategory("4");
		vo.setContent("5");
		vo.setWriter("6");
		
		bs.regist(vo);
	}
	
	// @Test
	public void test() {
		try {
			List<BoardVO> list = bs.listAll();
			System.out.println(list);
		} catch (Exception e) {
			e.printStackTrace();
		}
	}
	
}

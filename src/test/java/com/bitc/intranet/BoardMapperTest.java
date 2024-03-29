package com.bitc.intranet;

import java.util.List;

import org.junit.Test;
import org.junit.runner.RunWith;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.test.context.ContextConfiguration;
import org.springframework.test.context.junit4.SpringJUnit4ClassRunner;

import com.bitc.intranet.mapper.NoticeMapper;
import com.bitc.intranet.vo.NoticeVO;

@RunWith(SpringJUnit4ClassRunner.class)
@ContextConfiguration(
	locations = {"classpath:/spring/root-context.xml"}
)
public class BoardMapperTest {
	
	@Autowired
	NoticeMapper bs;
	
	//@Test
	public void testBoard() throws Exception{
		NoticeVO vo = new NoticeVO();
		vo.setTitle("qq");
		vo.setCategory("4");
		vo.setContent("5");
		vo.setWriter("6");
		
		bs.regist(vo);
	}
	
	@Test
	public void test() {
		try {
			List<NoticeVO> list = bs.listAll();
			System.out.println(list);
		} catch (Exception e) {
			e.printStackTrace();
		}
	}
	
	/*
	 * //@Test public void delete() throws Exception{ int result = bs.delete(2);
	 * System.out.println("result 삭제 : " + result); }
	 */
}

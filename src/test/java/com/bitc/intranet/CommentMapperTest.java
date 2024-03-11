package com.bitc.intranet;

import java.util.List;

import org.apache.ibatis.annotations.Delete;
import org.apache.ibatis.annotations.Update;
import org.junit.Test;
import org.junit.runner.RunWith;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.test.context.ContextConfiguration;
import org.springframework.test.context.junit4.SpringJUnit4ClassRunner;

import com.bitc.intranet.mapper.CommentMapper;
import com.bitc.intranet.vo.CommentVO;

@RunWith(SpringJUnit4ClassRunner.class)
@ContextConfiguration(
	locations = {"classpath:/spring/root-context.xml"}
)
public class CommentMapperTest {

	@Autowired
	CommentMapper cm;
	
	// @Test
	public void testComment() throws Exception{
		CommentVO vo = new CommentVO();
		vo.setBno(23);
		vo.setNoti_content("test_11");
		vo.setAuthor("40");
		
		cm.insert(vo);
	}
	
	@Test
	public void testCommentList() {
		try {
			List<CommentVO> list = cm.commentList(23);
			System.out.println(list);
		} catch (Exception e) {
			e.printStackTrace();
		}
	}
	
	
}

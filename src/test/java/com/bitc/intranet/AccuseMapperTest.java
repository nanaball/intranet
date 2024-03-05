package com.bitc.intranet;

import org.junit.Test;
import org.junit.runner.RunWith;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.test.context.ContextConfiguration;
import org.springframework.test.context.junit4.SpringJUnit4ClassRunner;

import com.bitc.intranet.mapper.AccuseMapper;
import com.bitc.intranet.vo.AccuseVO;

@RunWith(SpringJUnit4ClassRunner.class)
@ContextConfiguration(
	locations = {"classpath:/spring/root-context.xml"}
)
public class AccuseMapperTest {

	@Autowired
	AccuseMapper as;
	
	@Test
	public void testaccuse() throws Exception{
		AccuseVO vo = new AccuseVO();
		vo.setTitle("제목ㄱㄱㄱㄱㄱ");
		vo.setContent("내용ㅇㅇㅇㅇㅇ");
		vo.setWriter("작성자ㅏㅏㅏㅏㅏ");
		vo.setUno(0);
		
		as.regist(vo);
	}
}

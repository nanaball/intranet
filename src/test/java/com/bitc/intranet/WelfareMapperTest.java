package com.bitc.intranet;

import java.util.List;

import org.junit.Test;
import org.junit.runner.RunWith;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.test.context.ContextConfiguration;
import org.springframework.test.context.junit4.SpringJUnit4ClassRunner;

import com.bitc.intranet.mapper.WelfareMapper;
import com.bitc.intranet.vo.MemberVO;
import com.bitc.intranet.vo.WelfareVO;

@RunWith(SpringJUnit4ClassRunner.class)
@ContextConfiguration(
	locations = {"classpath:/spring/root-context.xml"}
)

public class WelfareMapperTest {

	@Autowired
	WelfareMapper ws;
	
	// @Test
	public void testWelfare() throws Exception{
		WelfareVO vo = new WelfareVO();
		vo.setMName("크롱");
		vo.setPrice(30);
		vo.setStock(50000);
		vo.setSoldout("Y");
		vo.setPay("Y");
		
		
		ws.addWelfare(vo);
	}
	
	
	@Test
	public void testList() throws Exception{
		List<WelfareVO> list = ws.list();
		System.out.println(list);
		

	}
}

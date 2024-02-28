package com.bitc.intranet;

import java.util.List;

import org.junit.Test;
import org.junit.runner.RunWith;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.test.context.ContextConfiguration;
import org.springframework.test.context.junit4.SpringJUnit4ClassRunner;

import com.bitc.intranet.mapper.RecentMapper;
import com.bitc.intranet.vo.BoardVO;

@RunWith(SpringJUnit4ClassRunner.class)
@ContextConfiguration(
	locations = {"classpath:/spring/root-context.xml"}
)
public class RecentMapperTest {

	@Autowired
	RecentMapper mapper;
	
	@Test
	public void testNoticeList() throws Exception{
		
        List<BoardVO> recentNotices = mapper.findRecentNotices();
        System.out.println(recentNotices);
	}
}

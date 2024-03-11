package com.bitc.intranet;

import java.util.List;

import org.junit.Test;
import org.junit.runner.RunWith;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.test.context.ContextConfiguration;
import org.springframework.test.context.junit4.SpringJUnit4ClassRunner;

import com.bitc.intranet.mapper.NoticeMapper;
import com.bitc.intranet.mapper.FreeMapper;
import com.bitc.intranet.vo.NoticeVO;
import com.bitc.intranet.vo.FreeVO;

@RunWith(SpringJUnit4ClassRunner.class)
@ContextConfiguration(
	locations = {"classpath:/spring/root-context.xml"}
)
public class RecentMapperTest {

	@Autowired
	NoticeMapper bm;
	
	@Autowired
	FreeMapper fm;
	
	@Test
	public void testNoticeList() throws Exception{
		
        List<NoticeVO> recentNotices = bm.recentNotices();
        System.out.println(recentNotices);
	}
	
	@Test
	public void testFreeList() throws Exception{
		
        List<FreeVO> recentFree = fm.recentFree();
        System.out.println(recentFree);
	}
	
}

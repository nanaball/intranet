package com.bitc.intranet;

import org.junit.runner.RunWith;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.test.context.ContextConfiguration;
import org.springframework.test.context.junit4.SpringJUnit4ClassRunner;

import com.bitc.intranet.dao.BoardDAO;

@RunWith(SpringJUnit4ClassRunner.class)
@ContextConfiguration(
	locations = {"classpath:/spring/root-context.xml"}
)
public class BoardDAOTest {
	
	@Autowired
	BoardDAO dao;
}

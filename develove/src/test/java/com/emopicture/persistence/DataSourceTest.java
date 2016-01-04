package com.emopicture.persistence;

import java.sql.Connection;

import javax.sql.DataSource;

import org.junit.Test;
import org.junit.runner.RunWith;
import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.test.context.ContextConfiguration;
import org.springframework.test.context.junit4.SpringJUnit4ClassRunner;

@RunWith(SpringJUnit4ClassRunner.class)
@ContextConfiguration(
	locations ={"file:src/main/webapp/WEB-INF/spring/**/*.xml"})
public class DataSourceTest {

	protected static final Logger logger = LoggerFactory.getLogger(DataSourceTest.class);
	
	
	@Autowired
	private DataSource ds;
	
	@Test
	public void test() throws Exception{
		System.out.println(ds);
		Connection con = ds.getConnection();
		System.out.println(con);
		
		con.close();
	}

}

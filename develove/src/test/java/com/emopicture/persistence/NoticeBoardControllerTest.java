package com.emopicture.persistence;

import org.junit.Before;
import org.junit.Test;
import org.junit.runner.RunWith;
import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.test.context.ContextConfiguration;
import org.springframework.test.context.junit4.SpringJUnit4ClassRunner;
import org.springframework.test.context.web.WebAppConfiguration;
import org.springframework.test.web.servlet.MockMvc;
import org.springframework.test.web.servlet.MvcResult;
import org.springframework.test.web.servlet.request.MockMvcRequestBuilders;
import org.springframework.test.web.servlet.setup.MockMvcBuilders;
import org.springframework.web.context.WebApplicationContext;
import org.springframework.web.servlet.ModelAndView;

@RunWith(SpringJUnit4ClassRunner.class)
@WebAppConfiguration
@ContextConfiguration(
		locations ={"file:src/main/webapp/WEB-INF/spring/**/*.xml"})
public class NoticeBoardControllerTest {

	protected static final Logger logger = LoggerFactory.getLogger(NoticeBoardControllerTest.class);
	
	
	@Autowired
	WebApplicationContext wac;
	
	MockMvc mockMvc;
	
	@Before
	public void setup(){
		this.mockMvc= MockMvcBuilders.webAppContextSetup(wac).build();
	}
	
	@Test
	public void test() throws Exception{
		MvcResult result = mockMvc.perform(
				MockMvcRequestBuilders.get("/board/slist")
				.param("pageNo", "2")
				.param("searchType", "t")
				).andReturn();
		
		ModelAndView mav = result.getModelAndView();
		System.out.println(mav.getModel().get("cri"));
		System.out.println(mav.getViewName());
	}

}

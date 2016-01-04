package com.emopicture.persistence;

import org.junit.Test;
import org.junit.runner.RunWith;
import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.test.context.ContextConfiguration;
import org.springframework.test.context.junit4.SpringJUnit4ClassRunner;

import com.emopicture.domain.Criteria;
import com.emopicture.domain.NoticeBoardVO;
import com.emopicture.persistence.NoticeBoardMapper;
import com.emopicture.service.NoticeBoardService;

@RunWith(SpringJUnit4ClassRunner.class)
@ContextConfiguration(locations = { "file:src/main/webapp/WEB-INF/spring/**/*.xml" })
public class NoticeBoardMapperTest {

	protected static final Logger logger = LoggerFactory.getLogger(NoticeBoardMapperTest.class);

	@Autowired
	private NoticeBoardService service;
	
	@Autowired
	private NoticeBoardMapper mapper;


	@Test
	public void createTest() throws Exception {
		NoticeBoardVO vo = new NoticeBoardVO();
		
		for (int i = 1500; i < 1999; i++) {
			
			vo.setMno(2);
			vo.setTitle(i+"번. 제목 제목 제목 제목");
			vo.setContent(i+"번. 내용 내용 내용 내용");
			vo.setNickname(i+"번. 닉네임");
			service.create(vo);
		}
		
	}

	
	@Test
	public void readTest() throws Exception {
		service.read(3);
	}
	
	@Test
	public void updateTest() throws Exception {
		
		NoticeBoardVO vo = new NoticeBoardVO();
		vo.setBno(3);
		vo.setContent("수정수정수정수정수정 테스트");
		vo.setNickname("test");
		vo.setTitle("엽데이트 테스트");
		service.update(vo);
	}
	
	@Test
	public void searchTest() throws Exception {

		Criteria cri = new Criteria();
		cri.setPageNo(2);
		cri.setPerPage(20);
		cri.setKeyword("카페");
		cri.setSearchType("t");
		System.out.println(service.search(cri));

	}

}

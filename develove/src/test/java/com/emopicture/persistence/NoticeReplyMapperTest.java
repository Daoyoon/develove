package com.emopicture.persistence;

import org.junit.Test;
import org.junit.runner.RunWith;
import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.test.context.ContextConfiguration;
import org.springframework.test.context.junit4.SpringJUnit4ClassRunner;

import com.emopicture.domain.Criteria;
import com.emopicture.domain.PageMaker;
import com.emopicture.domain.ReplyVO;
import com.emopicture.service.NoticeReplyService;

@RunWith(SpringJUnit4ClassRunner.class)
@ContextConfiguration(
	locations ={"file:src/main/webapp/WEB-INF/spring/**/*.xml"})
public class NoticeReplyMapperTest {

	
	protected static final Logger logger = LoggerFactory.getLogger(NoticeBoardMapperTest.class);

	@Autowired
	private NoticeReplyService service;

	private ReplyVO vo;
	
	
	@Test
	public void createTest() throws Exception{
		vo = new ReplyVO();
		vo.setBno(3);
		vo.setReplytext("댓글 =============== 댓글 테스트 댓글 달리나???");
		vo.setReplyer("댓글 작성자 테스트");
		service.create(vo);
	}
	
	@Test
	public void updateTest() throws Exception{
		vo = new ReplyVO();
		vo.setReplytext("업데이트 테스트");
		vo.setReplyer("Doyoon");
		vo.setRno(1);
		service.update(vo);
	}
	
	@Test
	public void deleteTest() throws Exception{
		service.delete(2);
	}
	
	@Test
	public void countTest() throws Exception{
		service.count(3);
	}

	@Test
	public void listTest() throws Exception{
		service.list(3);
	}
	//12.28 test complete!!

	@Test
	public void pageTest() throws Exception{
		PageMaker pageMaker = new PageMaker();
		Criteria cri = new Criteria();	
		service.listPage(114, cri);
	}
}

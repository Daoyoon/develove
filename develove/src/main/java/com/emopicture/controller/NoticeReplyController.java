package com.emopicture.controller;

import java.util.List;

import javax.inject.Inject;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.http.HttpStatus;
import org.springframework.http.ResponseEntity;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RequestBody;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RestController;

import com.emopicture.domain.NoticeReplyVO;
import com.emopicture.persistence.NoticeBoardMapper;
import com.emopicture.service.NoticeReplyService;





@RestController
@RequestMapping("/noticereplies/*")
public class NoticeReplyController {

	@Inject
	private NoticeReplyService service;
	
	@Inject
	private NoticeBoardMapper bMapper;

	private static final Logger logger = LoggerFactory.getLogger(NoticeReplyController.class);


	@RequestMapping(value = "", method = RequestMethod.POST)
	public ResponseEntity<String> create(@RequestBody NoticeReplyVO vo ) {
		System.out.println("create");
		ResponseEntity<String> entity = null;
		try {
			service.create(vo);
			entity = new ResponseEntity<String>("Success", HttpStatus.OK);
		} catch (Exception e) {
			e.printStackTrace();
			entity = new ResponseEntity<String>(e.getMessage(), HttpStatus.BAD_REQUEST);
		}
		return entity;
	}
	
	

	@RequestMapping(value="/{bno}", method=RequestMethod.GET)
	public ResponseEntity<List<NoticeReplyVO>> listAll(@PathVariable("bno") Integer bno){
		ResponseEntity<List<NoticeReplyVO>> entity = null;
		try{
			
			List<NoticeReplyVO> list = service.list(bno);
				System.out.println(service.list(bno));
			int replyCount = service.count(bno);
			
			entity = new ResponseEntity<List<NoticeReplyVO>>(list, HttpStatus.OK);
		}catch(Exception e){
			e.printStackTrace();
			entity = new ResponseEntity<>(HttpStatus.BAD_REQUEST);
		}
		return entity;
	}
	
//	@RequestMapping(value="/{bno}/{page}", method=RequestMethod.GET)
//	public ResponseEntity<Map<String, Object>> listPage(@PathVariable("bno") Integer bno, @PathVariable("page") Integer page){
//		ResponseEntity<Map<String,Object>> entity = null;
//		try{
//			Criteria cri = new Criteria();
//			cri.setPageNo(page);
//			PageMaker pageMaker = new PageMaker();
//			pageMaker.setCri(cri);
//			Map<String, Object> map = new HashMap<>();
//			List<QnaReplyVO> list = service.listPage(bno, cri);
//			map.put("list", list);	
//			int replyCount = service.count(bno);
//			pageMaker.setTotalCount(replyCount);
//			map.put("pageMaker", pageMaker);
//			entity = new ResponseEntity<Map<String,Object>>(map, HttpStatus.OK);
//		}catch(Exception e){
//			e.printStackTrace();
//			entity = new ResponseEntity<>(HttpStatus.BAD_REQUEST);
//		}
//		return entity;
//	}
	
	@RequestMapping(value = "/{rno}", method = { RequestMethod.PUT, RequestMethod.PATCH})
	public ResponseEntity<String> update(@PathVariable("rno") Integer rno, @RequestBody NoticeReplyVO vo) {
		logger.info("Update.....");
		ResponseEntity<String> entity = null;
		try {
			vo.setRno(rno);
			service.update(vo);
			System.out.println(vo);
			entity = new ResponseEntity<String>("Success", HttpStatus.OK);
		} catch (Exception e) {
			e.printStackTrace();
			entity = new ResponseEntity<String>(e.getMessage(), HttpStatus.BAD_REQUEST);
		}
		return entity;
	}

	
	@RequestMapping(value = "/{rno}", method = {RequestMethod.DELETE, RequestMethod.POST})
	public ResponseEntity<String> delete(@PathVariable("rno") Integer rno, @RequestBody NoticeReplyVO vo) {
		logger.info("Delete.....");
		ResponseEntity<String> entity = null;
		try {
			service.delete(rno);
			entity = new ResponseEntity<String>("Success", HttpStatus.OK);
		} catch (Exception e) {
			e.printStackTrace();
			entity = new ResponseEntity<String>(e.getMessage(), HttpStatus.BAD_REQUEST);
		}
		return entity;
	}
}

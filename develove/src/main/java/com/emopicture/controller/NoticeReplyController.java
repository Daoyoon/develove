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

import com.emopicture.domain.ReplyVO;
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
	public ResponseEntity<String> create(@RequestBody ReplyVO vo ) {
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
	public ResponseEntity<List<ReplyVO>> listAll(@PathVariable("bno") Integer bno){
		ResponseEntity<List<ReplyVO>> entity = null;
		try{
			
			List<ReplyVO> list = service.list(bno);
				System.out.println(service.list(bno));
			int replyCount = service.count(bno);
			
			entity = new ResponseEntity<List<ReplyVO>>(list, HttpStatus.OK);
		}catch(Exception e){
			e.printStackTrace();
			entity = new ResponseEntity<>(HttpStatus.BAD_REQUEST);
		}
		return entity;
	}
	

	
	@RequestMapping(value = "/{rno}", method = { RequestMethod.PUT, RequestMethod.PATCH})
	public ResponseEntity<String> update(@PathVariable("rno") Integer rno, @RequestBody ReplyVO vo) {
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
	public ResponseEntity<String> delete(@PathVariable("rno") Integer rno, @RequestBody ReplyVO vo) {
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

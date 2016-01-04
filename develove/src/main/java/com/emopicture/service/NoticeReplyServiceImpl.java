package com.emopicture.service;

import java.util.List;

import javax.inject.Inject;

import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

import com.emopicture.domain.Criteria;
import com.emopicture.domain.NoticeReplyVO;
import com.emopicture.persistence.NoticeBoardMapper;
import com.emopicture.persistence.NoticeReplyMapper;

@Service
public class NoticeReplyServiceImpl implements NoticeReplyService<NoticeReplyVO, Integer> {

	@Inject
	private NoticeReplyMapper mapper;
	
	@Inject
	private NoticeBoardMapper bMapper;
	
	
	
	@Transactional
	@Override
	public void create(NoticeReplyVO vo) throws Exception {
		mapper.create(vo);
		bMapper.updatereply(vo.getBno());
	}

	@Override
	public void delete(Integer rno) throws Exception {
		mapper.delete(rno);
	}

	@Override
	public void update(NoticeReplyVO vo) throws Exception {
		mapper.update(vo);
	}

	@Override
	public List<NoticeReplyVO> list(Integer bno) throws Exception {
		return mapper.list(bno);
	}

	@Override
	public List<NoticeReplyVO> listPage(Integer bno, Criteria cri) throws Exception {
		return mapper.listPage(bno, cri);
	}

	@Override
	public int count(Integer bno) throws Exception {
		return mapper.count(bno);
	}

	

}

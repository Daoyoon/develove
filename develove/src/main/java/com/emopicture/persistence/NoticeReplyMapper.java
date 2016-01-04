package com.emopicture.persistence;

import java.util.List;

import com.emopicture.domain.Criteria;

public interface NoticeReplyMapper<NoticeReplyVO, Integer> {
	
	public List<NoticeReplyVO> list(Integer bno) throws Exception;
	
	public void create(NoticeReplyVO vo)throws Exception;
	
	public void update(NoticeReplyVO vo)throws Exception;
	
	public void delete(Integer bno)throws Exception;
	
	public List<NoticeReplyVO> listPage(Integer bno,Criteria cri)throws Exception;
	
	public int count(Integer bno)throws Exception;
	
	
	
}

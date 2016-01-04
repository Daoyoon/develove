package com.emopicture.service;

import java.util.List;

import com.emopicture.domain.Criteria;

public interface NoticeReplyService<V, K> {

	public List<V> list(K key) throws Exception;

	public void create(V vo)throws Exception;
	   
	public void delete(K key)throws Exception;
	   
	public void update(V vo)throws Exception;
	
	public List<V> listPage(K key, Criteria cri)throws Exception;
	
	public int count(K key)throws Exception;
	
}

package com.emopicture.persistence;

import java.util.List;

import com.emopicture.domain.Criteria;

public interface CRUDMapper<V,K> {

	public void create(V vo) throws Exception;
	
	public V read(K key) throws Exception;
	
	public void update(V vo) throws Exception;
	
	public void delete(K key) throws Exception;
	
	public List<V> listAll() throws Exception;
	
	
	
	
	
	
	

	
}

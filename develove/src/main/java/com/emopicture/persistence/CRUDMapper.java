package com.emopicture.persistence;

import java.util.List;

public interface CRUDMapper<V,K> {

	public void create(V vo) throws Exception;
	
	public V read(K key) throws Exception;
	
	public void update(V vo) throws Exception;
	
	public void delete(K key) throws Exception;
	
	public List<V> listAll() throws Exception;
	
}

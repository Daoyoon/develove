package com.emopicture.persistence;

import java.util.HashMap;
import java.util.List;
import java.util.Map;

import org.apache.ibatis.session.SqlSession;
import org.springframework.beans.factory.annotation.Autowired;

import com.emopicture.domain.Criteria;

public class AbstractNoticeReplyMapper<V,K> implements NoticeReplyMapper<V, K> {
	
	@Autowired
	protected SqlSession session;
	
	protected String namespace;
	
	public AbstractNoticeReplyMapper(){
		
		String name = this.getClass().getName();
		this.namespace = name.substring(0, name.length()-4);
		
	}
	
	@Override
	public List<V> list(K key) throws Exception {
		return session.selectList(namespace+".list", key);
	}

	@Override
	public void create(V vo) throws Exception {
		session.insert(namespace+".create", vo);
	}

	@Override
	public void update(V vo) throws Exception {
		session.update(namespace+".update", vo);
		
	}

	@Override
	public void delete(K key) throws Exception {
		session.delete(namespace+".delete", key);
		
	}

	@Override
	public List<V> listPage(K key, Criteria cri) throws Exception {
		Map<String, Object> paramMap = new HashMap<>();
		paramMap.put("bno", key);
		paramMap.put("cri", cri);
				
		return session.selectList(namespace+".listPage", paramMap);
	}

	@Override
	public int count(K key) throws Exception {
		return session.selectOne(namespace+".count", key);
		
	}
	
	
	
}

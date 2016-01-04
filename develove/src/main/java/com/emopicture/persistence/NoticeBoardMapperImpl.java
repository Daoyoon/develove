package com.emopicture.persistence;

import java.util.List;

import org.springframework.stereotype.Repository;

import com.emopicture.domain.Criteria;
import com.emopicture.domain.NoticeBoardVO;

@Repository
public class NoticeBoardMapperImpl extends AbstractCRUDMapper<NoticeBoardVO, Integer> implements NoticeBoardMapper {

	@Override
	public List<NoticeBoardVO> listpage(int page) throws Exception {

		return session.selectList(namespace+".listpage",page);
	}

	@Override
	public void viewcnt(Integer bno) throws Exception {
		
		session.update(namespace+".viewcnt",bno);
		
	}

	@Override
	public int totalcount() throws Exception {
		return session.selectOne(namespace+".totalcount");
		
	}

	@Override
	public List<NoticeBoardVO> search(Criteria cri) throws Exception {
		return session.selectList(namespace+".search",cri);
	}

	@Override
	public void updatereply(Integer bno) throws Exception {
		session.update(namespace+".updatereply", bno);
		
	}

	@Override
	public List<NoticeBoardVO> listAll() throws Exception {
		return session.selectList(namespace+".listall");
	}



}

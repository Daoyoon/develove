package com.emopicture.service;

import java.util.List;

import javax.inject.Inject;

import org.springframework.stereotype.Service;

import com.emopicture.domain.Criteria;
import com.emopicture.domain.NoticeBoardVO;
import com.emopicture.persistence.NoticeBoardMapper;

@Service
public class NoticeBoardServiceImpl implements NoticeBoardService<NoticeBoardVO, Integer>  {
	
	@Inject
	private NoticeBoardMapper mapper;
	

	@Override
	public void create(NoticeBoardVO vo) throws Exception {
		mapper.create(vo);
		
	}

	@Override
	public NoticeBoardVO read(Integer bno) throws Exception {
		return mapper.read(bno);
	}

	@Override
	public void delete(Integer bno) throws Exception {
		mapper.delete(bno);
	}

	@Override
	public void update(NoticeBoardVO vo) throws Exception {
		mapper.update(vo);
	}

	@Override
	public List<NoticeBoardVO> listpage(int page) throws Exception {
		return mapper.listpage(page);
	}

	@Override
	public void viewcnt(Integer bno) throws Exception {
		mapper.viewcnt(bno);
	}

	@Override
	public int totalcount() throws Exception {
		return mapper.totalcount();
	}

	@Override
	public List<NoticeBoardVO> search(Criteria cri) throws Exception {
		return mapper.search(cri);
	}

}

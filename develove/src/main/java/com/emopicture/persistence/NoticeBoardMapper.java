package com.emopicture.persistence;

import java.util.List;
import com.emopicture.domain.Criteria;
import com.emopicture.domain.NoticeBoardVO;

public interface NoticeBoardMapper extends CRUDMapper<NoticeBoardVO, Integer> {
	
	public List<NoticeBoardVO> listAll()throws Exception;
	
	public List<NoticeBoardVO> listpage(int page) throws Exception;
	
	public void viewcnt(Integer bno)throws Exception;
	
	public int totalcount() throws Exception;
	
	public List<NoticeBoardVO> search(Criteria cri) throws Exception;
	
	public void updatereply(Integer bno) throws Exception;
	

}

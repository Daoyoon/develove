package com.emopicture.controller;

import javax.inject.Inject;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.stereotype.Controller;
import org.springframework.transaction.annotation.Transactional;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;

import com.emopicture.domain.Criteria;
import com.emopicture.domain.NoticeBoardVO;
import com.emopicture.service.NoticeBoardService;


@Controller
@RequestMapping("/noticeboard/*")
public class NoticeBoardController {

	@Inject
	private NoticeBoardService bService;
	

	private static final Logger logger = LoggerFactory.getLogger(NoticeBoardController.class);

	@RequestMapping(value = "/list", method = RequestMethod.GET)
	public void searchlist(@ModelAttribute("cri") Criteria cri,  Model model) throws Exception {
		cri.setTotalCount(bService.totalcount());	
		System.out.println(bService.totalcount());
		model.addAttribute("list", bService.search(cri));
	}

	@Transactional
	@RequestMapping(value = "/view", method = RequestMethod.GET)
	public void view(@ModelAttribute("cri") Criteria cri, int bno, Model model) throws Exception {
		System.out.println(bno);
		bService.viewcnt(bno);
		model.addAttribute("board", bService.read(bno));
	}

	@RequestMapping(value = "/create", method = RequestMethod.GET)
	public void create() throws Exception {
	}

	@RequestMapping(value = "/create", method = RequestMethod.POST)
	public String createPost(NoticeBoardVO vo) throws Exception {
		System.out.println(vo.getTitle());
		bService.create(vo);
		return "redirect:/noticeboard/list";
	}

	@RequestMapping(value = "/modify", method = RequestMethod.GET)
	public void modify(int bno, Model model) throws Exception {
		System.out.println(bno);
		model.addAttribute("board", bService.read(bno));
	}

	@RequestMapping(value = "/modify", method = RequestMethod.POST)
	public String modifyPost(NoticeBoardVO vo) throws Exception {
		bService.update(vo);
		return "redirect:/noticeboard/list";
	}

	@RequestMapping(value = "/delete", method = RequestMethod.POST)
	public String delete(int bno) throws Exception {
		bService.delete(bno);
		System.out.println("delete complete");
		return "redirect:/noticeboard/list";
	}
	

}

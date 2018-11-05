package org.kosta.academy.controller;

import javax.annotation.Resource;

import org.kosta.academy.model.service.AcademyService;
import org.kosta.academy.model.service.SearchService;
import org.kosta.academy.model.vo.CurriculumVO;
import org.kosta.academy.model.vo.ListVO;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.servlet.ModelAndView;

@Controller
public class SearchController {
	@Resource
	private SearchService searchService;
	@Resource
	private AcademyService academyService;

	@RequestMapping("academySearch.do")
	public ModelAndView academySearch(CurriculumVO curriculumVO, String search, String pageNo, String province, String district) {
		ModelAndView mv = new ModelAndView();
		System.out.println("addr:"+curriculumVO.getAcademyVO().getAcaAddr());
		System.out.println("curname:"+curriculumVO.getCurName());
		System.out.println("search:"+search);
		ListVO lvo = searchService.search(curriculumVO, search, pageNo);
		//*******************
		System.out.println("controller"+lvo.getCurriculumList());
		//*******************
		mv.addObject("searchList",lvo.getCurriculumList());
		mv.addObject("pb", lvo.getPb());
		mv.setViewName("search/academySearch_result.tiles");

		return mv;
	}

	@RequestMapping("provinceList.do")
	@ResponseBody
	public ListVO provinceList() {
		return searchService.provinceList();
	}

	@RequestMapping("districtList.do")
	@ResponseBody
	public ListVO districtList(String province) {
		return searchService.districtList(province);
	}

}

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
	public ModelAndView academySearch(CurriculumVO curriculumVO, String search, String pageNo) {
		ModelAndView mv = new ModelAndView();
		ListVO lvo = searchService.search(curriculumVO, search, pageNo);
		mv.addObject("searchList",lvo);
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

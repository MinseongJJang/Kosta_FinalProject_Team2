package org.kosta.academy.controller;

import javax.annotation.Resource;

import org.kosta.academy.model.service.AcademyService;
import org.kosta.academy.model.service.SearchService;
import org.kosta.academy.model.vo.AcademyVO;
import org.kosta.academy.model.vo.CurriculumVO;
import org.kosta.academy.model.vo.ListVO;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseBody;

@Controller
public class SearchController {
	@Resource
	private SearchService searchService;
	@Resource
	private AcademyService academyService;
	
	@RequestMapping("academySearch.do")
	public String academySearch(CurriculumVO curriculumVO, String search, String pageNo, Model model) {
		ListVO lvo = searchService.search(curriculumVO, search, pageNo);
		System.out.println(lvo);
		return null;
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

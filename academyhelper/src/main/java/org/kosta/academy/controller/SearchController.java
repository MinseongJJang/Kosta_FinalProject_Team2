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
		System.out.println("search:"+search);
		System.out.println("curriculumVO:"+curriculumVO.getAcademyVO().getAcaAddr()+"  "+curriculumVO.getCurName());
		ListVO lvo = searchService.search(curriculumVO, search, pageNo);
		if(lvo.getCurriculumList().size()==0) {
			mv.setViewName("search/academySearch_result_fail.tiles");
			return mv;
		}
		mv.addObject("searchList",lvo.getCurriculumList());
		mv.addObject("pb", lvo.getPb());
		mv.addObject("content", lvo.getContent());
		mv.setViewName("search/academySearch_result.tiles");
		return mv;
	}

	@RequestMapping("academyHashSearch.do")
	public void academyHashSearch(String search) {
		System.out.println(search);
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

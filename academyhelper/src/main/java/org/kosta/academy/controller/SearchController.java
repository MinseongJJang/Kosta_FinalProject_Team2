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
	/*
	@RequestMapping("academySearch.do")
	public String academySearch(CurriculumVO curriculumVO, String search, String pageNo, Model model) {

		String [] data = {curriculumVO.getAcademyVO().getAcaAddr(), curriculumVO.getCurName(), search};
		int count = 0;
		for(int i=0; i<data.length; i++) {
			if(data[i] != "") {
				count++;
			}
		}
		if(count == 0) {
			String acaAddr = "";
			AcademyVO academyVO = new AcademyVO();
			academyVO.setAcaAddr(acaAddr);
			curriculumVO.setAcademyVO(academyVO);
			curriculumVO.setCurName("");
			curriculumVO.setCurContent("");
			ListVO listVO = searchService.academySearch(curriculumVO, pageNo);
			model.addAttribute("searchList", listVO.getCurriculumList());
			model.addAttribute("pagingBean", listVO.getPb());
			return "search/academySearch_result.tiles";
		}else if(count == 1) {
			//검색어X
			if(search.trim().equals("")) {
				//교육명X
				if(curriculumVO.getCurName().equals("")) {
					curriculumVO.setCurContent("뷁뷁뷁뷁뷁뷁뷁뷁뷁뷁뷁뷁뷁뷁뷁뷁뷁");
					curriculumVO.setCurName("뷁뷁뷁뷁뷁뷁뷁뷁뷁뷁뷁뷁뷁뷁뷁뷁뷁");
				}else {
					//교육명O
					String acaAddr = "뷁뷁뷁뷁뷁뷁뷁뷁뷁뷁뷁뷁뷁뷁뷁뷁뷁";
					AcademyVO academyVO = new AcademyVO();
					academyVO.setAcaAddr(acaAddr);
					curriculumVO.setAcademyVO(academyVO);
					curriculumVO.setCurContent("뷁뷁뷁뷁뷁뷁뷁뷁뷁뷁뷁뷁뷁뷁뷁뷁뷁");
				}
			}else {
				//검색어O
				curriculumVO.setCurName(search);
				curriculumVO.setCurContent(search);
				String acaAddr = search;
				AcademyVO academyVO = new AcademyVO();
				academyVO.setAcaAddr(acaAddr);
				curriculumVO.setAcademyVO(academyVO);
			}
			ListVO listVO = searchService.academySearch(curriculumVO, pageNo);
			model.addAttribute("searchList", listVO.getCurriculumList());
			model.addAttribute("pagingBean", listVO.getPb());
			return "search/academySearch_result.tiles1";
		}else if(count == 2) {
			if(search.trim().equals("")) {
				//지역&교육명 검색
				ListVO listVO = searchService.locationAndCurName(curriculumVO, pageNo);
				model.addAttribute("searchList", listVO.getCurriculumList());
				model.addAttribute("pagingBean", listVO.getPb());
				return "search/academySearch_result2.tiles";
			}else {
				if(curriculumVO.getCurName().equals("")) {
					//지역&검색어 검색
					curriculumVO.setCurName(search);
					curriculumVO.setCurContent(search);
					ListVO listVO = searchService.locationAndSearch(curriculumVO, pageNo);
					model.addAttribute("searchList", listVO.getCurriculumList());
					model.addAttribute("pagingBean", listVO.getPb());
					return "search/academySearch_result2.tiles";
				}else {
					//교육명&검색어 검색
					String acaAddr = search;
					AcademyVO academyVO = new AcademyVO();
					academyVO.setAcaAddr(acaAddr);
					curriculumVO.setAcademyVO(academyVO);
					curriculumVO.setCurContent(search);
					ListVO listVO = searchService.curNameAndSearch(curriculumVO, pageNo);
					model.addAttribute("searchList", listVO.getCurriculumList());
					model.addAttribute("pagingBean", listVO.getPb());
					return "search/academySearch_result2.tiles";
				}
			}
		}else if(count ==3) {
			curriculumVO.setCurContent(search);
			ListVO listVO = searchService.locationAndCurNameAndSearch(curriculumVO, pageNo);
			model.addAttribute("searchList", listVO.getCurriculumList());
			model.addAttribute("pagingBean", listVO.getPb());
			return "search/academySearch_result3.tiles";
		}
		return null;
	}
	*/
	
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

package org.kosta.academy.controller;

import javax.annotation.Resource;

import org.kosta.academy.model.service.SearchService;
import org.kosta.academy.model.vo.AcademyVO;
import org.kosta.academy.model.vo.CurriculumVO;
import org.kosta.academy.model.vo.ListVO;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.servlet.mvc.support.RedirectAttributes;

@Controller
public class SearchController {
	@Resource
	private SearchService searchService;
	
	@RequestMapping("academySearch.do")
	public String academySearch(CurriculumVO curriculumVO, String search, String pageNo, Model model,RedirectAttributes redirectAttr) {

		String [] data = {curriculumVO.getAcademyVO().getAcaAddr(), curriculumVO.getCurName(), search};
		int count = 0;
		for(int i=0; i<data.length; i++) {
			if(data[i] != "") {
				count++;
			}
		}
		System.out.println(count);
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
			return "search/academySearch_result.tiles";
		}else if(count == 2) {
			if(search.trim().equals("")) {
				//지역&교육명 검색
				System.out.println(curriculumVO);
				model.addAttribute("curriculumVO", curriculumVO);
				model.addAttribute("pageNo", pageNo);
				redirectAttr.addAttribute("curriculumVO",curriculumVO);
				redirectAttr.addAttribute("pageNo", pageNo);
				return "redirect:locationAndCurName.do";
			}else {
				if(curriculumVO.getCurName().equals("")) {
					//지역&검색어 검색
					curriculumVO.setCurName(search);
					curriculumVO.setCurContent(search);
					System.out.println(curriculumVO);
					return "redirect:locationAndSearch.do";
				}else {
					//교육명&검색어 검색
					String acaAddr = search;
					AcademyVO academyVO = new AcademyVO();
					academyVO.setAcaAddr(acaAddr);
					curriculumVO.setAcademyVO(academyVO);
					curriculumVO.setCurContent(search);
					System.out.println(curriculumVO);
					return "redirect:curNameAndSearch.do";
				}
			}
		}else if(count ==3) {
			//지역&교육명&검색어 검색
			return "redirect:locationAndCurNameAndSearch.do";
		}
		return "search/academySearch_result.tiles";
	}
	//지역&교육명 검색
	@RequestMapping("locationAndCurName.do")
	public String locationAndCurName(CurriculumVO curriculumVO, String pageNo, Model model) {
		System.out.println("지역O교육O"+curriculumVO.getAcademyVO().getAcaAddr()+curriculumVO.getCurName()+curriculumVO.getCurContent());
		ListVO listVO = searchService.locationAndCurName(curriculumVO, pageNo);
		model.addAttribute("searchList", listVO.getCurriculumList());
		model.addAttribute("pagingBean", listVO.getPb());
		return "search/academySearch_result.tiles";
	}
	//지역&검색어 검색
	@RequestMapping("locationAndSearch.do")
	public String locationAndSearch(CurriculumVO curriculumVO, String pageNo, Model model) {
		System.out.println("지역O검색O"+curriculumVO.getAcademyVO().getAcaAddr()+curriculumVO.getCurName()+curriculumVO.getCurContent());
		ListVO listVO = searchService.locationAndSearch(curriculumVO, pageNo);
		model.addAttribute("searchList", listVO.getCurriculumList());
		model.addAttribute("pagingBean", listVO.getPb());
		return "search/academySearch_result.tiles";
	}
	//교육명&검색어 검색
	@RequestMapping("curNameAndSearch.do")
	public String curNameAndSearch(CurriculumVO curriculumVO, String pageNo, Model model) {
		System.out.println("교육O검색O"+curriculumVO.getAcademyVO().getAcaAddr()+curriculumVO.getCurName()+curriculumVO.getCurContent());
		ListVO listVO = searchService.curNameAndSearch(curriculumVO, pageNo);
		model.addAttribute("searchList", listVO.getCurriculumList());
		model.addAttribute("pagingBean", listVO.getPb());
		return "search/academySearch_result.tiles";
	}
	//지역&교육명&검색어 검색
	@RequestMapping("locationAndCurNameAndSearch.do")
	public String locationAndCurNameAndSearch(CurriculumVO curriculumVO, String pageNo, Model model) {
		System.out.println("OOO"+curriculumVO.getAcademyVO().getAcaAddr()+curriculumVO.getCurName()+curriculumVO.getCurContent());
		ListVO listVO = searchService.locationAndCurNameAndSearch(curriculumVO, pageNo);
		model.addAttribute("searchList", listVO.getCurriculumList());
		model.addAttribute("pagingBean", listVO.getPb());
		return "search/academySearch_result.tiles";
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

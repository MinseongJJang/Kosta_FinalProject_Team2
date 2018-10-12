package org.kosta.academy.controller;

import java.util.List;

import javax.annotation.Resource;

import org.kosta.academy.model.service.AcademyService;
import org.kosta.academy.model.service.PagingBean;
import org.kosta.academy.model.vo.AcademyVO;
import org.kosta.academy.model.vo.ListVO;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;

@Controller
public class AcademyController {
	@Resource
	private AcademyService academyService;
	@RequestMapping("registerAcademy.do")
	public String registerAcademy(AcademyVO academyVO) {
		academyService.registerAcademy(academyVO);
		return "";
	}
	/*@RequestMapping("listAcademy.do")
	public List<AcademyVO> listAcademy(String pageNo){
		int totalListAcaCount = academyService.getTotalListAcaCount();
		PagingBean pagingBean = null;
		if(pageNo==null) {
			pagingBean = new PagingBean(totalListAcaCount);
		}else {
			pagingBean = new PagingBean(totalListAcaCount, Integer.parseInt(pageNo));
		}
		List<AcademyVO> academyList = academyService.listAcademy(pageNo);
		ListVO lvo = new ListVO();
		lvo.setAcademyList(academyList);
		return null;
	}*/
}

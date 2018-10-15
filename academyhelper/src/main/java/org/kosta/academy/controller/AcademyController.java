package org.kosta.academy.controller;

import java.util.HashMap;

import javax.annotation.Resource;

import org.kosta.academy.model.service.AcademyService;
import org.kosta.academy.model.vo.AcademyVO;
import org.kosta.academy.model.vo.ListVO;
import org.springframework.security.access.annotation.Secured;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;

@Controller
public class AcademyController {
	@Resource
	private AcademyService academyService;
	@Secured("ROLE_ACAUSER")
	@RequestMapping("registerAcademy.do")
	public String registerAcademy(AcademyVO academyVO) {
		academyService.registerAcademy(academyVO);
		return "";
	}
	@RequestMapping("listAcademy.do")
	public String listAcademy(String pageNo, Model model){
		ListVO listVO = academyService.listAcademy(pageNo);
		model.addAttribute("ListAcademy", listVO);
		return "views/academy/list.jsp";
	}
	@RequestMapping("listCurriculum.do")
	public String listCurriculum(HashMap<String,Object> map, Model model){
		ListVO listVO = academyService.listCurriculum(map);
		model.addAttribute("ListCurriculum", listVO.getCurriculumList());
		model.addAttribute("pb", listVO.getPb());
		return "curriculum/curList";
	}
	
	
	
}

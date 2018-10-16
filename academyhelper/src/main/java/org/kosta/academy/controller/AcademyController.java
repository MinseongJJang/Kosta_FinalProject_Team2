package org.kosta.academy.controller;

import java.util.HashMap;

import javax.annotation.Resource;

import org.kosta.academy.model.service.AcademyService;
import org.kosta.academy.model.vo.AcademyVO;
import org.kosta.academy.model.vo.ListVO;
import org.springframework.security.access.annotation.Secured;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;

@Controller
public class AcademyController {
	@Resource	
	private AcademyService academyService;
	@Secured("ROLE_ADMIN")
	@PostMapping("registerAcademy.do")
	public String registerAcademy(AcademyVO academyVO) {
		academyService.registerAcademy(academyVO);
		return "redirect:academyRegisterResult.do";
	}
	@Secured("ROLE_ADMIN")
	@RequestMapping("academyRegisterResult.do")
	public String academyRegisterResult() {
		return "academy/academy_register_result.tiles";
	}
	@Secured("ROLE_ADMIN")
	@RequestMapping("academyRegisterForm.do")
	public String academyRegisterForm() {
		return "academy/academy_register_form.tiles";
	}
	@RequestMapping("listAcademy.do")
	public String listAcademy(String pageNo, Model model){
		ListVO listVO = academyService.listAcademy(pageNo);
		model.addAttribute("ListAcademy", listVO.getAcademyList());
		model.addAttribute("pagingBean", listVO.getPb());
		return "academy/academy_list.tiles";
	}
	@RequestMapping("detailAcademy.do")
	public String detailAcademy(String acaNo, Model model) {
		AcademyVO acdemyVO = academyService.detailAcademy(acaNo);
		model.addAttribute("acaDetail", acdemyVO);
		return "academy/academy_detail.tiles";
	}
	@Secured("ROLE_ADMIN")
	@RequestMapping("updateAcademy.do")
	public String updateAcademy(AcademyVO academyVO) {
		academyService.updateAcademy(academyVO);
		String acaNo = academyVO.getAcaNo();
		return "redirect:detailAcademy.do?acaNo="+acaNo;
	}
	@Secured("ROLE_ADMIN")
	@RequestMapping("academyUpdateForm.do")
	public String academyUpdateForm(AcademyVO academyVO, Model model) {;
		model.addAttribute("test", academyVO);
		return "academy/academy_update_form.tiles";
	}
	@Secured("ROLE_ADMIN")
	@PostMapping("deleteAcademy.do")
	public String deleteAcademy(String acaNo) {
		academyService.deleteAcademy(acaNo);
		return "redirect:listAcademy.do";
	}
	@RequestMapping("listCurriculum.do")
	public String listCurriculum(HashMap<String,Object> map, Model model){
		ListVO listVO = academyService.listCurriculum(map);
		model.addAttribute("ListCurriculum", listVO.getCurriculumList());
		model.addAttribute("pb", listVO.getPb());
		return "curriculum/curList";
	}
	
}

package org.kosta.academy.controller;

import java.io.File;

import javax.annotation.Resource;
import javax.servlet.http.HttpServletRequest;

import org.kosta.academy.model.service.AcademyService;
import org.kosta.academy.model.service.ReviewService;
import org.kosta.academy.model.vo.AcaCurSatisfactionVO;
import org.kosta.academy.model.vo.AcademyVO;
import org.kosta.academy.model.vo.CurriculumAttachFileVO;
import org.kosta.academy.model.vo.CurriculumVO;
import org.kosta.academy.model.vo.ListVO;
import org.springframework.security.access.annotation.Secured;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.servlet.ModelAndView;

@Controller
public class AcademyController {
	@Resource
	private AcademyService academyService;
	@Resource
	private ReviewService reviewService;

	@Secured("ROLE_USER")
	@RequestMapping("academyCompare.do")
	public String academyCompare(Model model, HttpServletRequest request) {
		String acaNoA = request.getParameter("acaNoA");
		String curriNoA = request.getParameter("curriNoA");
		String acaNoB = request.getParameter("acaNoB");
		String curriNoB = request.getParameter("curriNoB");
		
		AcademyVO academyVOA = academyService.detailAcademy(acaNoA);
		AcademyVO academyVOB = academyService.detailAcademy(acaNoB);
		CurriculumVO curriVOA = academyService.detailCurriculum(curriNoA);
		CurriculumVO curriVOB = academyService.detailCurriculum(curriNoB);
		AcaCurSatisfactionVO satisVOA = reviewService.satisfactionByCurNo(curriNoA);
		AcaCurSatisfactionVO satisVOB = reviewService.satisfactionByCurNo(curriNoB);
		ListVO reviewlistA = reviewService.listAcaReviewPostByCurNo(curriNoA);
		ListVO reviewlistB = reviewService.listAcaReviewPostByCurNo(curriNoB);
		model.addAttribute("academyA", academyVOA);
		model.addAttribute("academyB", academyVOB);
		model.addAttribute("curriculumA", curriVOA);
		model.addAttribute("curriculumB", curriVOB);
		model.addAttribute("satisfactionA", satisVOA);
		model.addAttribute("satisfactionB", satisVOB);
		model.addAttribute("reviewListA", reviewlistA.getAcaReviewPostList());
		model.addAttribute("reviewListB", reviewlistB.getAcaReviewPostList());
		return"academy/academy_compare.tiles";
	}
	@Secured("ROLE_USER")
	@RequestMapping("listCurriculumAsAcademy.do")
	@ResponseBody
	public ListVO listCurriculumAsAcademy(Model model, String acaNo) {
		return academyService.listCurriculumAsAcademy(acaNo);
	}

	@Secured("ROLE_USER")
	@RequestMapping("academyCompareForm.do")
	public String academyCompareForm(Model model) {
		ListVO listVO = academyService.allListAcademy();
		model.addAttribute("ListAcademy", listVO.getAcademyList());
		return "academy/academy_compare_form.tiles";
	}
	
	@Secured("ROLE_ADMIN")
	@PostMapping("registerAcademy.do")
	public String registerAcademy(AcademyVO academyVO) {
		academyService.registerAcademy(academyVO);
		return "redirect:detailAcademy.do?acaNo="+academyVO.getAcaNo();
	}

	@Secured("ROLE_ADMIN")
	@RequestMapping("academyRegisterForm.do")
	public String academyRegisterForm() {
		return "academy/academy_register_form.tiles";
	}

	@RequestMapping("listAcademy.do")
	public String listAcademy(String pageNo, Model model) {
		ListVO listVO = academyService.listAcademy(pageNo);
		model.addAttribute("ListAcademy", listVO.getAcademyList());
		model.addAttribute("pagingBean", listVO.getPb());
		return "academy/academy_list.tiles";
	}
	
	@RequestMapping("detailAcademy.do")
	public String detailAcademy(String acaNo, Model model, String pageNo) {
		AcademyVO acdemyVO = academyService.detailAcademy(acaNo);
		ListVO listVO = academyService.listCurriculum(acaNo, pageNo);
		model.addAttribute("ListCurriculum", listVO.getCurriculumList());
		model.addAttribute("pb", listVO.getPb());
		model.addAttribute("acaDetail", acdemyVO);
		System.out.println(listVO.getCurriculumList());
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

/*	@RequestMapping("listCurriculum.do")
	public String listCurriculum(String acaNo, String pageNo, Model model) {
		ListVO listVO = academyService.listCurriculum(acaNo, pageNo);
		model.addAttribute("ListCurriculum", listVO.getCurriculumList());
		model.addAttribute("pb", listVO.getPb());
		return "curriculum/curriculum_list";
	}*/



	@RequestMapping("detailCurriculum.do")
	public String detailCurriculum(String curNo, Model model) {
		CurriculumVO detailCurriculum = academyService.detailCurriculum(curNo);
		model.addAttribute("DetailCurriculum", detailCurriculum);
		return "curriculum/curriculum_detail.tiles";
	}
	@Secured("ROLE_ADMIN")
	@RequestMapping("registerCurriculumForm.do")
	public String registerCurriculumForm(String acaNo, Model model) {
		model.addAttribute("acaNo",acaNo);
		return "curriculum/curriculum_register_form.tiles";
	}
	
	@Secured("ROLE_ADMIN")
	@PostMapping("registerCurriculum.do")
	public ModelAndView registerCurriculum(CurriculumVO curriculumVO, CurriculumAttachFileVO curriculumAttachFileVO
			,String[] curtime,String[] curtime1) {
		ModelAndView mv = new ModelAndView();
/*	String registerCurriculum(CurriculumVO curriculumVO, RedirectAttributes redirectAttributes) {
		academyService.registerCurriculum(curriculumVO);
		redirectAttributes.addAttribute("curNo", curriculumVO.getCurNo());
		return "redirect:register-curriculum.do";
		}
*/
		String curriculumUpload = "C:\\java-kosta\\finalproject\\finalproject\\resources\\curriculumUpload\\";
		File curriculumFile = new File(curriculumUpload);
		String[] fileNames = curriculumFile.list();
		
		for(int i=0;i<curtime1.length;i++) {
			for(int j=0;j<fileNames.length;j++) {
				if(fileNames[j].substring(fileNames[j].length()-8,fileNames[j].length()-4).equals("!!@@")) {	
					if(fileNames[j].substring(fileNames[j].length()-14,fileNames[j].length()-8).equals("@main@")&&fileNames[j].contains(curtime1[i])) {
						StringBuilder builderFile = new StringBuilder(fileNames[j]); // StringBuilder에 파일이름을 담는다
						File oldFile = new File(curriculumUpload+fileNames[j]);
						File newFile = new File(curriculumUpload+builderFile.replace(builderFile.length()-8, builderFile.length()-4, ""));
						curriculumVO.setCurMainPic("/academy/resources/curriculumUpload/"+builderFile);
						academyService.registerCurriculum(curriculumVO,curriculumAttachFileVO);
						oldFile.renameTo(newFile);
						curriculumVO.setCurMainPic(curriculumUpload+builderFile);
					}
				}
			}
		}
		CurriculumAttachFileVO curriculumAttach = new CurriculumAttachFileVO();
		for(int i=0;i<curtime.length;i++) {
			for(int j=0;j<fileNames.length;j++) {
				if(fileNames[j].substring(fileNames[j].length()-8,fileNames[j].length()-4).equals("!!@@")) {
					if(fileNames[j].contains(curtime[i])) {
						StringBuilder builderFile = new StringBuilder(fileNames[j]); // StringBuilder에 파일이름을 담는다
						File oldFile = new File(curriculumUpload+fileNames[j]);
						File newFile = new File(curriculumUpload+builderFile.replace(builderFile.length()-8, builderFile.length()-4, ""));
						//아직업데이트 되지 않았다는 상태값인 1을 0으로 변경
						//StringBuilder로 0으로 변경 후 파일도 변경
						oldFile.renameTo(newFile);
						curriculumAttach.setCurriculumVO(curriculumVO);
						curriculumAttach.setCurriculumFilepath(curriculumUpload+builderFile);
						academyService.registerCurriculumAttach(curriculumAttach);			
					}
				}
			}
		}
		String curNo=curriculumVO.getCurNo();
		mv.setViewName("redirect:detailCurriculum.do?curNo="+curNo);
		return mv;

	}
		
		
	@Secured("ROLE_ADMIN")
	@RequestMapping("register-curriculum.do")
	public String postDetailNoHits(String curNo) {
		return "redirect:detailCurriculum.do?curNo="+curNo;
	}
	
	@Secured("ROLE_ADMIN")
	@PostMapping("updateCurriculumForm.do")
	public ModelAndView updateCurriculumForm(String curNo) {
		return new ModelAndView("curriculum/curriculum_update_form.tiles", "DetailCurriculum",
				academyService.detailCurriculum(curNo));
	}
	
	@Secured("ROLE_ADMIN")
	@PostMapping("updateCurriculum.do")
	public ModelAndView updateCurriculum(CurriculumVO curriculumVO) {
		academyService.updateCurriculum(curriculumVO);
		return new ModelAndView("redirect:detailCurriculum.do?curNo=" + curriculumVO.getCurNo());
	}
	@Secured("ROLE_ADMIN")
	@PostMapping("deleteCurriculum.do")
	public ModelAndView deleteCurriculum(String curNo) {
		CurriculumVO curVO=academyService.detailCurriculum(curNo);
		String acaNo=curVO.getAcademyVO().getAcaNo();
		academyService.deleteCurriculum(curNo);
		return new ModelAndView("redirect:detailAcademy.do?acaNo="+acaNo);
		
	}

}

	
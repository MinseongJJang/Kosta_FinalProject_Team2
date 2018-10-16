package org.kosta.academy.controller;

import javax.annotation.Resource;

import org.kosta.academy.model.mapper.AcademyMapper;
import org.kosta.academy.model.service.AcademyService;
import org.kosta.academy.model.vo.AcademyVO;
import org.kosta.academy.model.vo.CurriculumVO;
import org.kosta.academy.model.vo.ListVO;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.security.access.annotation.Secured;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.servlet.ModelAndView;
import org.springframework.web.servlet.mvc.support.RedirectAttributes;

@Controller
public class AcademyController {
	@Resource
	private AcademyService academyService;
	@Autowired
	private AcademyMapper academyMapper;

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
	public String listAcademy(String pageNo, Model model) {
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
	public String listCurriculum(String acaNo, String pageNo, Model model) {
		ListVO listVO = academyService.listCurriculum(acaNo, pageNo);
		model.addAttribute("ListCurriculum", listVO.getCurriculumList());
		model.addAttribute("pb", listVO.getPb());
		return "curriculum/curriculum_list.tiles";
	}


	@RequestMapping("detailCurriculum.do")
	public String detailCurriculum(String curNo, Model model) {
		CurriculumVO detailCurriculum = academyService.detailCurriculum(curNo);
		model.addAttribute("DetailCurriculum", detailCurriculum);
		return "curriculum/curriculum_detail.tiles";
	}

	@RequestMapping("registerCurriculumForm.do")
	public String writeForm() {
		return "curriculum/curriculum_register.tiles";
	}
	
	@Secured("ROLE_ADMIN")
	@PostMapping("registerCurriculum.do")
	public String registerCurriculum(/* HttpSession session, */ CurriculumVO curriculumVO,
			RedirectAttributes redirectAttributes) {
		/*
		 * MemberVO mvo = (MemberVO) session.getAttribute("mvo"); if (mvo != null) {
		 * postVO.setMemberVO(mvo); }
		 */
		AcademyVO academyVO = academyMapper.detailAcademy("1");
		curriculumVO.setAcademyVO(academyVO);
		academyService.registerCurriculum(curriculumVO);

		redirectAttributes.addAttribute("no", curriculumVO.getCurNo());
		String no = curriculumVO.getCurNo();
		return "redirect:register-curriculum.do";
		/*
		 * return new ModelAndView("curriculum/curriculum_detail", "pvo",
		 * academyService.detailCurriculum(no));
		 */ }
	
	@Secured("ROLE_ADMIN")
	@RequestMapping("register-curriculum.do")
	public ModelAndView postDetailNoHits(String no) {
		System.out.println(no);
		return new ModelAndView("curriculum/curriculum_detail.tiles", "DetailCurriculum",
				academyService.detailCurriculum(no));
	}
	
	@Secured("ROLE_ADMIN")
	@PostMapping("updateCurriculum.do")
	public ModelAndView updateView(String curNo) {
		return new ModelAndView("curriculum/curriculum_update.tiles", "DetailCurriculum",
				academyService.detailCurriculum(curNo));
	}
	
	@Secured("ROLE_ADMIN")
	@PostMapping("updateCurriculumPost.do")
	public ModelAndView updatePost(CurriculumVO curriculumVO) {
		System.out.println(curriculumVO);
		AcademyVO academyVO = academyMapper.detailAcademy("1");
		curriculumVO.setAcademyVO(academyVO);
		System.out.println(curriculumVO);
		academyService.updateCurriculum(curriculumVO);
		// return new ModelAndView("board/post_detail", "pvo",
		// boardService.getPostDetailNoHits(pvo.getNo()));
		return new ModelAndView("redirect:detailCurriculum.do?curNo=" + curriculumVO.getCurNo());
	}
	@Secured("ROLE_ADMIN")
	@PostMapping("deleteCurriculum.do")
	public ModelAndView deletePost(String curNo) {
		academyService.deleteCurriculum(curNo);
		//return new ModelAndView("board/list", "lvo", boardService.getPostList());
		return new ModelAndView("redirect:listCurriculum.do");
	}



}

	
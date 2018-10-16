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

	@Secured("ROLE_ACAUSER")
	@RequestMapping("registerAcademy.do")
	public String registerAcademy(AcademyVO academyVO) {
		academyService.registerAcademy(academyVO);
		return "";
	}

	@RequestMapping("listAcademy.do")
	public String listAcademy(String pageNo, Model model) {
		ListVO listVO = academyService.listAcademy(pageNo);
		model.addAttribute("ListAcademy", listVO.getAcademyList());
		model.addAttribute("pagingBean", listVO.getPb());
		return "academy/academy_list";
	}

	@RequestMapping("detailAcademy.do")
	public String detailAcademy(String acaNo, Model model) {
		AcademyVO acdemyVO = academyService.detailAcademy(acaNo);
		model.addAttribute("acaDetail", acdemyVO);
		return "academy/academy_detail";
	}

	@RequestMapping("listCurriculum.do")
	public String listCurriculum(String acaNo, String pageNo, Model model) {
		ListVO listVO = academyService.listCurriculum(acaNo, pageNo);
		model.addAttribute("ListCurriculum", listVO.getCurriculumList());
		model.addAttribute("pb", listVO.getPb());
		return "curriculum/curriculum_list";
	}

	@RequestMapping("detailCurriculum.do")
	public String detailCurriculum(String curNo, Model model) {
		CurriculumVO detailCurriculum = academyService.detailCurriculum(curNo);
		model.addAttribute("DetailCurriculum", detailCurriculum);
		return "curriculum/curriculum_detail";
	}

	@RequestMapping("registerCurriculumForm.do")
	public String writeForm() {
		return "curriculum/curriculum_register";
	}

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

	@RequestMapping("register-curriculum.do")
	public ModelAndView postDetailNoHits(String no) {
		System.out.println(no);
		return new ModelAndView("curriculum/curriculum_detail", "DetailCurriculum",
				academyService.detailCurriculum(no));
	}

	@PostMapping("updateCurriculum.do")
	public ModelAndView updateView(String curNo) {
		return new ModelAndView("curriculum/curriculum_update", "DetailCurriculum",
				academyService.detailCurriculum(curNo));
	}

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
	@PostMapping("deleteCurriculum.do")
	public ModelAndView deletePost(String curNo) {
		academyService.deleteCurriculum(curNo);
		//return new ModelAndView("board/list", "lvo", boardService.getPostList());
		return new ModelAndView("redirect:listCurriculum.do");
	}


}

	
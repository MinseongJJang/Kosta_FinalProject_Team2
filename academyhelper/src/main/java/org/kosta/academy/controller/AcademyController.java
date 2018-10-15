package org.kosta.academy.controller;

import java.util.HashMap;

import javax.annotation.Resource;
import javax.servlet.http.HttpSession;

import org.kosta.academy.model.service.AcademyService;
import org.kosta.academy.model.vo.AcademyVO;
import org.kosta.academy.model.vo.CurriculumVO;
import org.kosta.academy.model.vo.ListVO;
import org.springframework.security.access.annotation.Secured;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.servlet.mvc.support.RedirectAttributes;

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
	public String listCurriculum(HashMap<String, Object> map, Model model) {
		ListVO listVO = academyService.listCurriculum(map);
		model.addAttribute("ListCurriculum", listVO.getCurriculumList());
		model.addAttribute("pb", listVO.getPb());
		return "curriculum/curList";
	}

	@RequestMapping("detailCurriculum.do")
	public String detailCurriculum(String curNo, Model model) {
		CurriculumVO detailCurriculum = academyService.detailCurriculum(curNo);
		model.addAttribute("DetailCurriculum", detailCurriculum);
		return "curriculum/curDetail";
	}

	@RequestMapping("registerAcademyForm.do")
	public String writeForm() {
		return "curriculum/registerForm";
	}

	@PostMapping("registerAcademy.do")
	public String write(HttpSession session, PostVO postVO, RedirectAttributes redirectAttributes) {
		/*MemberVO mvo = (MemberVO) session.getAttribute("mvo");
		if (mvo != null) {
			postVO.setMemberVO(mvo);
		}*/
		academyService.registerAcademy(postVO);
		redirectAttributes.addAttribute("no", +postVO.getNo());
		return "redirect:post-detail-no-hits.do";
	}

}

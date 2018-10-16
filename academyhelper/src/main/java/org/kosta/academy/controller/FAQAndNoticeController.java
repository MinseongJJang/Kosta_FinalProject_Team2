package org.kosta.academy.controller;

import javax.annotation.Resource;

import org.kosta.academy.model.service.FAQAndNotiAndSugService;
import org.kosta.academy.model.vo.FAQVO;
import org.kosta.academy.model.vo.ListVO;
import org.kosta.academy.model.vo.UserVO;
import org.kosta.academy.model.vo.SuggestionPostVO;
import org.springframework.security.access.annotation.Secured;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;

@Controller
public class FAQAndNoticeController {
	@Resource
	FAQAndNotiAndSugService fAQAndNotiAndSugService;

	@RequestMapping("listFAQ.do")
	public String listFAQ(Model model,String pageNo) {
		ListVO lvo = fAQAndNotiAndSugService.listFAQ(pageNo);
		model.addAttribute("lvo", lvo);
		return "faq/faqList.tiles";
	}
	@RequestMapping("deleteFAQ.do")
	public String deleteFAQ(String faqNo) {
		fAQAndNotiAndSugService.deleteFAQ(faqNo);
		return "redirect:listFAQ.do";
	}
	@RequestMapping("updateFAQForm.do")
	public String updateFAQForm(String faqNo,Model model) {
		model.addAttribute("fvo", fAQAndNotiAndSugService.detailFAQ(faqNo));
		return "faq/update_faq_form.tiles";
	}
	@RequestMapping("updateFAQ.do")
	public String updateFAQ(FAQVO fAQVO,Model model) {
		fAQAndNotiAndSugService.updateFAQ(fAQVO);
		return "redirect:listFAQ.do";
	}
	@RequestMapping("registerFAQForm.do")
	public String registerFAQForm() {
		return "faq/register_faq_form.tiles";
	}
	@RequestMapping("registerFAQ.do")
	public String registerFAQ(FAQVO faqVO) {
		UserVO userVO=new UserVO();
		userVO.setUsrId("admin");
		faqVO.setUserVO(userVO);
		fAQAndNotiAndSugService.registerFAQ(faqVO);
		return "redirect:listFAQ.do";
	}
	@Secured("ROLE_USER")
	@RequestMapping("suggestionRegisterForm.do")
	public String suggestionRegisterForm() {
		return "suggestion_register_form.tiles";
	}
	@Secured("ROLE_USER")
	@PostMapping("suggestionRegister.do")
	public String suggestionRegister(SuggestionPostVO suggestionPostVO) {
		fAQAndNotiAndSugService.registerSuggestionPost(suggestionPostVO);
		return "redirect:home.do";
	}
	@RequestMapping("listSuggestionPost.do")
	public String listSuggestionPost(String pageNo,Model model) {
		ListVO list=fAQAndNotiAndSugService.listSuggestionPost(pageNo);
		model.addAttribute("list",list);
		return "suggestion/list_suggestion.tiles";
	}
	@RequestMapping("detailSuggestionPost.do")
	public String detailSuggestionPost(String sugNo,Model model) {
		SuggestionPostVO vo=fAQAndNotiAndSugService.detailSuggestionPost(sugNo);
		model.addAttribute("vo",vo);
		return "suggestion/detailSuggestionPost.tiles";
	}
	@PostMapping("updateSuggestionPostForm")
	public String updateSuggestionPostForm() {
		return "";
	}
	@RequestMapping("updateSuggestionPost")
	public String updateSuggestionPost() {
		return "";
	}
	@RequestMapping("deleteSuggestionPost")
	public String deleteSuggestionPost() {
		return "";
	}
}

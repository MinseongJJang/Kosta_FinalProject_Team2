package org.kosta.academy.controller;

import javax.annotation.Resource;

import org.kosta.academy.model.service.FAQAndNotiAndSugService;
import org.kosta.academy.model.vo.ListVO;
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
		return "faq/faqList";
	}
	@RequestMapping("deleteFAQ.do")
	public String deleteFAQ(String faqNo) {
		fAQAndNotiAndSugService.deleteFAQ(faqNo);
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
		return "suggestion/listSuggestionPost.tiles";
	}
	@RequestMapping("detailSuggestionPost.do")
	public String detailSuggestionPost(String sugNo,Model model) {
		SuggestionPostVO vo=fAQAndNotiAndSugService.detailSuggestionPost(sugNo);
		model.addAttribute("vo",vo);
		return "suggestion/detailSuggestionPost.tiles";
	}
}

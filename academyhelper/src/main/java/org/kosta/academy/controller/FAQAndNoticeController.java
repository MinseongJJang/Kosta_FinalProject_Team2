package org.kosta.academy.controller;

import javax.annotation.Resource;

import org.kosta.academy.model.service.FAQAndNotiAndSugService;
import org.kosta.academy.model.vo.ListVO;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
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
}

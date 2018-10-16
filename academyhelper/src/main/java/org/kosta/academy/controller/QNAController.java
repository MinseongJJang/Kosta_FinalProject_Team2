package org.kosta.academy.controller;

import javax.annotation.Resource;

import org.kosta.academy.model.service.QNAService;
import org.kosta.academy.model.vo.ListVO;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;

@Controller
public class QNAController {
	@Resource
	private QNAService qnaService;
	@RequestMapping("listAcaQNA.do")
	public String listQna(String pageNo, Model model) {
		ListVO list = qnaService.listAcaQNA(pageNo);
		model.addAttribute("listQNA", list.getAcaQNAList());
		model.addAttribute("pagingBean", list.getPb());
		return "qna/qna_list.tiles";
	}
}

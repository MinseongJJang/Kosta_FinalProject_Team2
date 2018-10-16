package org.kosta.academy.controller;

import javax.annotation.Resource;

import org.kosta.academy.model.service.QNAService;
import org.kosta.academy.model.vo.AcaQNAVO;
import org.kosta.academy.model.vo.ListVO;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.PostMapping;
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
	
	@RequestMapping("detailAcaQNA.do")
	public String detailQna(String qnaNo, Model model) {
		AcaQNAVO qnaVO = qnaService.detailAcaQNA(qnaNo);
		model.addAttribute("detailQNA", qnaVO);
		return "qna/qna_detail.tiles";
	}
	
	@PostMapping("deleteAcaQNA.do")
	public String deleteQna(String qnaNo, Model model) {
		qnaService.deleteAcaQNA(qnaNo);
		return "redirect:listAcaQNA.do";
	}
	@PostMapping("updateAcaQNAForm")
	public String updateQnaForm(String qnaNo, Model model) {
		AcaQNAVO qnaVO = qnaService.detailAcaQNA(qnaNo);
		model.addAttribute("detailQNA", qnaVO);
		return "qna/qna_update.tiles";
	}
	@PostMapping("updateAcaQNA.do")
	public String updateQna(AcaQNAVO acaQnaVO, Model model) {
		qnaService.updateAcaQNA(acaQnaVO);
		return "redirect:detailAcaQNA.do?qnaNo="+acaQnaVO.getQnaNo();
	}
	@PostMapping("registerQNAForm.do")
	public String registerQnaForm() {
		return "qna/qna_register.tiles";
	}
	@PostMapping("registerQNA.do")
	public String registerQna(AcaQNAVO acaQnaVO) {
		System.out.println(acaQnaVO.getUserVO().getUsrId());
		qnaService.registerAcaQNA(acaQnaVO);
		return "redirect:listAcaQNA.do";
	}
}

package org.kosta.academy.controller;

import javax.annotation.Resource;

import org.kosta.academy.model.service.QNAService;
import org.kosta.academy.model.vo.AcaQNAReplyVO;
import org.kosta.academy.model.vo.AcaQNAVO;
import org.kosta.academy.model.vo.ListVO;
import org.springframework.security.access.annotation.Secured;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseBody;

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
	public String detailQna(String qnaNo, String pageNo, Model model) {
		if(pageNo==null) {
			pageNo="1";
		}
		System.out.println(pageNo);
		ListVO listReply = qnaService.listAcaQNAReply(qnaNo,pageNo);
		model.addAttribute("listQNAReply", listReply);
		AcaQNAVO qnaVO = qnaService.detailAcaQNA(qnaNo);
		model.addAttribute("detailQNA", qnaVO);
		model.addAttribute("pageNo",pageNo);
		return "qna/qna_detail.tiles";
	}
	
/*	@RequestMapping("listAcaQNAReply.do")
	public String listQnaReply(String pageNo, Model model) {
		ListVO listReply = qnaService.listAcaQNAReply(pageNo);
		
		 * ArrayList<Aca> rvoList = new ArrayList<ReplyVO>(); rvoList =
		 * ReplyDAO.getInstance().getDReplyListBydNo(dno);
		 * request.setAttribute("rvoList", rvoList);
		 
		model.addAttribute("listQNAReply", listReply.getAcaQNAList());
		model.addAttribute("pagingBean", listReply.getPb());
		return "qna/qna_detail.tiles";
	}*/


	@Secured("ROLE_USER")
	@PostMapping("deleteAcaQNA.do")
	public String deleteQna(String qnaNo, Model model) {
		qnaService.deleteAcaQNA(qnaNo);
		return "redirect:listAcaQNA.do";
	}

	@Secured("ROLE_USER")
	@PostMapping("updateAcaQNAForm")
	public String updateQnaForm(String qnaNo, Model model) {
		AcaQNAVO qnaVO = qnaService.detailAcaQNA(qnaNo);
		model.addAttribute("detailQNA", qnaVO);
		return "qna/qna_update.tiles";
	}

	@Secured("ROLE_USER")
	@PostMapping("updateAcaQNA.do")
	public String updateQna(AcaQNAVO acaQnaVO, Model model) {
		qnaService.updateAcaQNA(acaQnaVO);
		return "redirect:detailAcaQNA.do?qnaNo=" + acaQnaVO.getQnaNo();
	}

	@Secured("ROLE_USER")
	@PostMapping("registerQNAForm.do")
	public String registerQnaForm() {
		return "qna/qna_register.tiles";
	}

	@Secured("ROLE_USER")
	@PostMapping("registerQNA.do")
	public String registerQna(AcaQNAVO acaQnaVO) {
		qnaService.registerAcaQNA(acaQnaVO);
		return "redirect:detailAcaQNA.do?qnaNo="+acaQnaVO.getQnaNo();
	}
	@Secured("ROLE_USER")
	@PostMapping("registerAcaQnAReply.do")
	public String registerAcaQnAReply(AcaQNAReplyVO acaQNAVOReplyVO) {
		qnaService.registerAcaQNAReply(acaQNAVOReplyVO);
		return "redirect:detailAcaQNA.do?qnaNo="+acaQNAVOReplyVO.getAcaQNAVO().getQnaNo();
	}
	@Secured("ROLE_USER")
	@PostMapping("deleteAcaQnAReply.do")
	@ResponseBody
	public ListVO deleteAcaQnAReply(String qnaRepNo, String qnaNo, String pageNo) {
		try{
			System.out.println("deleteAcaQnAReply");
		System.out.println(qnaRepNo);
		System.out.println(qnaNo);
		System.out.println(pageNo);
		qnaService.deleteAcaQNAReply(qnaRepNo);
		ListVO listQNAReply=qnaService.listAcaQNAReply(qnaNo, pageNo);
		System.out.println("deleteAcaQnAReply list "+listQNAReply);
		return listQNAReply;
		}catch(Exception e) {
			e.printStackTrace();
			return null;
		}
		
	}
	@Secured("ROLE_USER")
	@PostMapping("updateAcaQnAReply.do")
	@ResponseBody
	public String updateAcaQnAReply(AcaQNAReplyVO acaQNAVOReplyVO) {
		try {
		if(acaQNAVOReplyVO.getQnaRepContent()==" "||acaQNAVOReplyVO.getQnaRepContent()=="") {
			return null;
		}else {
			qnaService.updateAcaQnAReply(acaQNAVOReplyVO);
			String qnaRepNo=acaQNAVOReplyVO.getQnaRepNo();
			String content=qnaService.getAcaQnAReply(qnaRepNo);
			return content;
		}
		
		}catch(Exception e) {
			return null;
		}
		
	}
	
}

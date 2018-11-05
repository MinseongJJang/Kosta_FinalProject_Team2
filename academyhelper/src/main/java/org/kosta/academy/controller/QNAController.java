package org.kosta.academy.controller;

import java.io.File;

import javax.annotation.Resource;

import org.kosta.academy.model.service.QNAService;
import org.kosta.academy.model.vo.AcaQNAReplyVO;
import org.kosta.academy.model.vo.AcaQNAVO;
import org.kosta.academy.model.vo.AcaQNQAttachFileVO;
import org.kosta.academy.model.vo.ListVO;
import org.springframework.security.access.annotation.Secured;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.servlet.ModelAndView;

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
		ListVO listReply = qnaService.listAcaQNAReply(qnaNo,pageNo);
		model.addAttribute("listQNAReply", listReply);
		AcaQNAVO qnaVO = qnaService.detailAcaQNA(qnaNo);
		model.addAttribute("detailQNA", qnaVO);
		model.addAttribute("pageNo",pageNo);
		return "qna/qna_detail.tiles";
	}
	
	@PostMapping("listAcaQNAReply.do")
	@ResponseBody
	public ListVO listQnaReply(String qnaNo, String pageNo, Model model) {
		System.out.println(qnaNo);
		if(pageNo==null) {
			pageNo="1";
		}
		ListVO listReply = qnaService.listAcaQNAReply(qnaNo,pageNo);
		return listReply;
	}

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
	public ModelAndView registerQna(AcaQNAVO acaQnaVO,AcaQNQAttachFileVO acaQnaAttachFileVO
			,String[] curtime) {
		//qnaService.registerAcaQNA(acaQnaVO);
		
		ModelAndView mv = new ModelAndView();
		qnaService.registerAcaQNA(acaQnaVO,acaQnaAttachFileVO);
		try {
		String qnaUpload = "C:\\java-kosta\\finalproject\\finalproject\\resources\\qnaUpload\\";
		File qnaFile = new File(qnaUpload);
		//Filepath를 받아와서 해당 경로에 이미지 파일이 있는 지확인
		String[] fileNames = qnaFile.list();
		/*
		 * curtime hidden 값을 받아와 해당 디렉토리에 파일이름에 해당 이름이 들어가는 것이 있으면서
		 * 맨마지막의 값이 1인 파일은 attach 테이블에 업로드 시킨다. 그후 마지막1을 0으로 변경 시킴.
		 */
		
		AcaQNQAttachFileVO qnaAttach = new AcaQNQAttachFileVO();
		for(int i=0;i<curtime.length;i++) {
			for(int j=0;j<fileNames.length;j++) {
				System.out.println(fileNames[j]);
				if(fileNames[j].substring(fileNames[j].length()-8,fileNames[j].length()-4).equals("!!@@")) {
					if(fileNames[j].contains(curtime[i])) {
						StringBuilder builderFile = new StringBuilder(fileNames[j]); // StringBuilder에 파일이름을 담는다
						File oldFile = new File(qnaUpload+fileNames[j]);
						File newFile = new File(qnaUpload+builderFile.replace(builderFile.length()-8, builderFile.length()-4, ""));
						//아직업데이트 되지 않았다는 상태값인 1을 0으로 변경
						//StringBuilder로 0으로 변경 후 파일도 변경
						oldFile.renameTo(newFile);
						qnaAttach.setAcademyQNAVO(acaQnaVO);
						qnaAttach.setQnaFilepath(qnaUpload+builderFile);
						qnaService.registerAcaQnaAttach(qnaAttach);
					}
				}
			}
		}
	}catch(Exception e){

	}finally {
		
	}
		mv.setViewName("redirect:detailAcaQNA.do?qnaNo="+acaQnaVO.getQnaNo());
		return mv;
	}
	@Secured("ROLE_USER")
	@PostMapping("registerAcaQnAReply.do")
	@ResponseBody
	public ListVO registerAcaQnAReply(AcaQNAReplyVO acaQNAVOReplyVO) {
		String pageNo="1";
		String qnaNo=acaQNAVOReplyVO.getAcaQNAVO().getQnaNo();
		System.out.println(qnaNo);
		System.out.println(acaQNAVOReplyVO);
		qnaService.registerAcaQNAReply(acaQNAVOReplyVO);
		ListVO listQNAReply=qnaService.listAcaQNAReply(qnaNo, pageNo);
		return listQNAReply;
	}
	@Secured("ROLE_USER")
	@PostMapping("deleteAcaQnAReply.do")
	@ResponseBody
	public ListVO deleteAcaQnAReply(String qnaRepNo, String qnaNo, String pageNo) {
		if(pageNo==null) {
			pageNo="1";
		}
		try{
		qnaService.deleteAcaQNAReply(qnaRepNo);
		ListVO listQNAReply=qnaService.listAcaQNAReply(qnaNo, pageNo);
		return listQNAReply;
		}catch(Exception e) {
			e.printStackTrace();
			return null;
		}
	}
	@Secured("ROLE_USER")
	@PostMapping("updateAcaQnAReply.do")
	@ResponseBody
	public ListVO updateAcaQnAReply(AcaQNAReplyVO acaQNAVOReplyVO, String pageNo, String qnaNo) {
		ListVO listQNAReply=null;
		ListVO list=null;
		if(pageNo==null) {
			pageNo="1";
		}
		try {
			qnaService.updateAcaQnAReply(acaQNAVOReplyVO);
			listQNAReply=qnaService.listAcaQNAReply(qnaNo, pageNo);
			return listQNAReply;
		}catch(Exception i) {
			i.getStackTrace();
			return list;
		}
		
	}
}

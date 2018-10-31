package org.kosta.academy.controller;

import java.io.File;
import java.util.List;
import java.util.Queue;

import javax.annotation.Resource;
import javax.servlet.http.HttpServletRequest;

import org.kosta.academy.model.service.AcademyService;
import org.kosta.academy.model.service.ReviewService;
import org.kosta.academy.model.vo.AcaCurSatisfactionVO;
import org.kosta.academy.model.vo.AcaReviewAttachFileVO;
import org.kosta.academy.model.vo.AcaReviewPostVO;
import org.kosta.academy.model.vo.AcaReviewReplyVO;
import org.kosta.academy.model.vo.AcademyVO;
import org.kosta.academy.model.vo.CurriculumVO;
import org.kosta.academy.model.vo.HashTagVO;
import org.kosta.academy.model.vo.ListVO;
import org.springframework.security.access.annotation.Secured;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.servlet.ModelAndView;

@Controller
public class ReviewController {
	@Resource
	public ReviewService reviewService;
	@Resource
	public AcademyService academyService;
	@Secured("ROLE_USER")
	@RequestMapping("acaReviewList.do")
	public ModelAndView listAcaReviewPost(String pageNo) {
		ModelAndView mv = new ModelAndView();
		ListVO review = reviewService.listAcaReviewPost(pageNo);
		mv.addObject("review",review);
		mv.setViewName("review/aca_review_list.tiles");
		return mv;
	}
	
	@Secured("ROLE_USER")
	@RequestMapping("registerReviewPostForm.do")
	public ModelAndView registerReviewPostForm() {
		ModelAndView mv = new ModelAndView();
		List<AcademyVO> academyList = academyService.getAcademyList();
		mv.addObject("academy",academyList);
		mv.setViewName("review/aca_review_register_form.tiles");
		return mv;
	}
	@Secured("ROLE_USER")
	@PostMapping("getCurriculumList.do")
	@ResponseBody
	public List<CurriculumVO> getCurriculumList(String acaNo) {
		List<CurriculumVO> curriculumList = academyService.getCurriculumList(acaNo);
		
		return curriculumList;
	}
	@SuppressWarnings("unchecked")
	@Secured("ROLE_USER")
	@RequestMapping("detailAcaReviewPost.do")
	public ModelAndView detailAcaReviewPost(String acaRevNo, String pageNo) {
		ModelAndView mv = new ModelAndView();
		Queue<Object> queue = reviewService.detailAcaReviewPost(acaRevNo,pageNo);
		int size = queue.size();
		
		AcaReviewPostVO acaReviewPostVO = (AcaReviewPostVO) queue.poll();
		List<HashTagVO> hashList = (List<HashTagVO>) queue.poll();
		AcaCurSatisfactionVO satisfactionVO = (AcaCurSatisfactionVO) queue.poll();
		ListVO lvo = null;
		if(size==4) {
			lvo = (ListVO)queue.poll();
		}
		mv.addObject("review",acaReviewPostVO);
		mv.addObject("hashList",hashList);
		mv.addObject("satisfaction",satisfactionVO);
		if(lvo!=null) {
			mv.addObject("reply",lvo);
		}else {
			mv.addObject("reply","null");
		}
		mv.setViewName("review/aca_review_detail.tiles");
		return mv;
	}
	@Secured("ROLE_USER")
	@PostMapping("registerAcaReviewPost.do")
	public ModelAndView registerAcaReviewPost(AcaReviewPostVO acaReviewPostVO,CurriculumVO curriculumVO,
			HashTagVO hashTagVO,AcaCurSatisfactionVO acaCurSatisfactionVO,AcademyVO academyVO,
			String[] curtime,HttpServletRequest request) {
		ModelAndView mv = new ModelAndView();
		acaReviewPostVO.setCurriculumVO(curriculumVO);
		acaCurSatisfactionVO.setAcaReviewPostVO(acaReviewPostVO);
		hashTagVO.setAcaReviewPostVO(acaReviewPostVO);
		curriculumVO.setAcademyVO(academyVO);
		reviewService.registerAcaReviewPost(acaReviewPostVO,curriculumVO,
				hashTagVO,acaCurSatisfactionVO);
		String 	reviewUpload = "C:\\java-kosta\\finalproject\\finalproject\\resources\\reviewUpload\\";
		File reviewFile = new File(reviewUpload);
		//Filepath를 받아와서 해당 경로에 이미지 파일이 있는 지확인
		String[] fileNames = reviewFile.list();
		/*
		 * curtime hidden 값을 받아와 해당 디렉토리에 파일이름에 해당 이름이 들어가는 것이 있으면서
		 * 맨마지막의 값이 1인 파일은 attach 테이블에 업로드 시킨다. 그후 마지막1을 0으로 변경 시킴.
		 */
		AcaReviewAttachFileVO reviewAttach = new AcaReviewAttachFileVO();
		for(int i=0;i<curtime.length;i++) {
			for(int j=0;j<fileNames.length;j++) {
				if(fileNames[j].substring(fileNames[j].length()-8,fileNames[j].length()-4).equals("!!@@")) {
					if(fileNames[j].contains(curtime[i])) {
						StringBuilder builderFile = new StringBuilder(fileNames[j]); // StringBuilder에 파일이름을 담는다
						File oldFile = new File(reviewUpload+fileNames[j]);
						File newFile = new File(reviewUpload+builderFile.replace(builderFile.length()-8, builderFile.length()-4, ""));
						//아직업데이트 되지 않았다는 상태값인 1을 0으로 변경
						//StringBuilder로 0으로 변경 후 파일도 변경
						oldFile.renameTo(newFile);
						reviewAttach.setAcaReviewPostVO(acaReviewPostVO);
						reviewAttach.setAcaRevFilepath(reviewUpload+builderFile);
						reviewService.registerAcaReviewAttach(reviewAttach);
						
					}
				}
			}
		}
		mv.setViewName("redirect:detailAcaReviewPost.do?acaRevNo="+acaReviewPostVO.getAcaRevNo());
		return mv;
	}
	@Secured("ROLE_USER")
	@RequestMapping("updateReviewForm.do")
	public ModelAndView updateReviewForm(String acaRevNo,String pageNo) {
		ModelAndView mv = new ModelAndView();
		Queue<Object> queue = reviewService.detailAcaReviewPost(acaRevNo,pageNo);
		AcaReviewPostVO acaReviewPostVO = (AcaReviewPostVO) queue.poll();
		@SuppressWarnings("unchecked")
		List<HashTagVO> hashList = (List<HashTagVO>) queue.poll();
		String hashName = "";
		int count = 0;
		for(int i=0;i<hashList.size();i++) {
			hashList.get(i).setAcaReviewPostVO(acaReviewPostVO);
			if(count == 0) {
				hashName += hashList.get(i).getHashTagName();
				count++;
			}else if(count > 0) {
				hashName += "," + hashList.get(i).getHashTagName();
			}
		}
		mv.addObject("review",acaReviewPostVO);
		mv.addObject("hashList",hashName);
		mv.setViewName("review/aca_review_update_form.tiles");
		return mv;
	}
	@PostMapping("updateAcaReviewPost.do")
	public ModelAndView updateAcaReviewPost(AcaReviewPostVO acaReviewPostVO,HashTagVO hashTagVO) {
		ModelAndView mv = new ModelAndView();
		hashTagVO.setAcaReviewPostVO(acaReviewPostVO);
		reviewService.updateAcaReviewPost(acaReviewPostVO,hashTagVO);
		mv.setViewName("redirect:detailAcaReviewPost.do?acaRevNo="+acaReviewPostVO.getAcaRevNo());
		return mv;
	}
	
	@RequestMapping("deleteReview.do")
	public ModelAndView deleteReview(String acaRevNo) {
		ModelAndView mv = new ModelAndView();
		reviewService.deleteAcaReviewPost(acaRevNo);
		mv.setViewName("redirect:acaReviewList.do");
		return mv;
	}
	
	@PostMapping("registerReviewReply.do")
	@ResponseBody
	public ListVO registerAcaReviewReply(AcaReviewReplyVO acaReviewReplyVO,String pageNo) {
		reviewService.registerAcaReviewReply(acaReviewReplyVO);
		ListVO reply = reviewService.listAcaReviewReply(acaReviewReplyVO, pageNo);
		return reply;
	}

	@PostMapping("deleteReviewReply.do")
	@ResponseBody
	public ListVO deleteAcaReviewReply(AcaReviewReplyVO acaReviewReplyVO , String pageNo) {
		reviewService.deleteAcaReviewReply(acaReviewReplyVO.getAcaRevRepNo());
		ListVO reply = reviewService.listAcaReviewReply(acaReviewReplyVO, pageNo);
		return reply;
	}

	@PostMapping("updateReviewReply.do")
	@ResponseBody
	public ListVO updateAcaReviewReply(AcaReviewReplyVO acaReviewReplyVO,String pageNo) {
		reviewService.updateAcaReviewReply(acaReviewReplyVO);
		ListVO reply = reviewService.listAcaReviewReply(acaReviewReplyVO, pageNo);
		return reply;
	}
	@PostMapping("listReviewReply.do")
	@ResponseBody
	public ListVO listAcaReviewReply(AcaReviewReplyVO acaReviewReplyVO,String pageNo) {
		System.out.println(pageNo);
		ListVO reply = reviewService.listAcaReviewReply(acaReviewReplyVO, pageNo);
		return reply;
	}
}

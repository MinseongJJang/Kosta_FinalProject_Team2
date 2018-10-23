package org.kosta.academy.controller;

import java.util.List;
import java.util.Queue;

import javax.annotation.Resource;

import org.kosta.academy.model.service.AcademyService;
import org.kosta.academy.model.service.ReviewService;
import org.kosta.academy.model.vo.AcaCurSatisfactionVO;
import org.kosta.academy.model.vo.AcaReviewPostVO;
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
	@Secured("ROLE_USER")
	@RequestMapping("detailAcaReviewPost.do")
	public ModelAndView detailAcaReviewPost(String acaRevNo) {
		ModelAndView mv = new ModelAndView();
		Queue<Object> queue = reviewService.detailAcaReviewPost(acaRevNo);
		AcaReviewPostVO acaReviewPostVO = (AcaReviewPostVO) queue.poll();
		@SuppressWarnings("unchecked")
		List<HashTagVO> hashList = (List<HashTagVO>) queue.poll();
		AcaCurSatisfactionVO satisfactionVO = (AcaCurSatisfactionVO) queue.poll();
		mv.addObject("review",acaReviewPostVO);
		mv.addObject("hashList",hashList);
		mv.addObject("satisfaction",satisfactionVO);
		mv.setViewName("review/aca_review_detail.tiles");
		return mv;
	}
	@Secured("ROLE_USER")
	@PostMapping("registerAcaReviewPost.do")
	public ModelAndView registerAcaReviewPost(AcaReviewPostVO acaReviewPostVO,CurriculumVO curriculumVO,
			HashTagVO hashTagVO,AcaCurSatisfactionVO acaCurSatisfactionVO,AcademyVO academyVO) {
		ModelAndView mv = new ModelAndView();
		acaReviewPostVO.setCurriculumVO(curriculumVO);
		acaCurSatisfactionVO.setAcaReviewPostVO(acaReviewPostVO);
		hashTagVO.setAcaReviewPostVO(acaReviewPostVO);
		curriculumVO.setAcademyVO(academyVO);
		reviewService.registerAcaReviewPost(acaReviewPostVO,curriculumVO,
				hashTagVO,acaCurSatisfactionVO);
		mv.setViewName("redirect:detailAcaReviewPost.do?acaRevNo="+acaReviewPostVO.getAcaRevNo());
		return mv;
	}
	@Secured("ROLE_USER")
	@RequestMapping("updateReviewForm.do")
	public ModelAndView updateReviewForm(String acaRevNo) {
		ModelAndView mv = new ModelAndView();
		Queue<Object> queue = reviewService.detailAcaReviewPost(acaRevNo);
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
	
}

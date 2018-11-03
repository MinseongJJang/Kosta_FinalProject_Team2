package org.kosta.academy.controller;

import java.io.File;

import javax.annotation.Resource;

import org.kosta.academy.model.service.PromotionService;
import org.kosta.academy.model.vo.AcaPromoAttachFileVO;
import org.kosta.academy.model.vo.AcaPromoPostVO;
import org.kosta.academy.model.vo.ListVO;
import org.springframework.security.access.annotation.Secured;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.servlet.ModelAndView;

@Controller
public class PromotionController {
	@Resource
	public PromotionService promotionService;
	@Secured("ROLE_USER")
	@RequestMapping("acaPromoList.do")
	public ModelAndView acaPromoList(String pageNo) {
		ModelAndView mv = new ModelAndView();
		ListVO promotion = promotionService.listAcaPromoPost(pageNo);
		mv.addObject("promotion",promotion);
		mv.setViewName("promotion/aca_promo_list.tiles");
		return mv;
	}
	@Secured("ROLE_USER")
	@RequestMapping("detailAcaPromoPost.do")
	public ModelAndView detailAcaPromoPost(String acaPromoNo) {
		ModelAndView mv = new ModelAndView();
		AcaPromoPostVO acaPromoPostVO = promotionService.detailAcaPromoPost(acaPromoNo);
		mv.addObject("acaPromo",acaPromoPostVO);
		mv.setViewName("promotion/aca_promo_detail.tiles");
		return mv;
	}
	@Secured("ROLE_ACADEMY")
	@RequestMapping("registerAcaPromoPost.do")
	public ModelAndView registerAcaPromoPost(AcaPromoPostVO acaPromoPostVO,AcaPromoAttachFileVO acaPromoAttachFileVO
			,String[] curtime) {
		ModelAndView mv = new ModelAndView();
		promotionService.registerAcaPromoPost(acaPromoPostVO,acaPromoAttachFileVO);
		String promotionUpload = "C:\\java-kosta\\finalproject\\finalproject\\resources\\promotionUpload\\";
		File promotionFile = new File(promotionUpload);
		//Filepath를 받아와서 해당 경로에 이미지 파일이 있는 지확인
		String[] fileNames = promotionFile.list();
		/*
		 * curtime hidden 값을 받아와 해당 디렉토리에 파일이름에 해당 이름이 들어가는 것이 있으면서
		 * 맨마지막의 값이 1인 파일은 attach 테이블에 업로드 시킨다. 그후 마지막1을 0으로 변경 시킴.
		 */
		AcaPromoAttachFileVO promoAttach = new AcaPromoAttachFileVO();
		for(int i=0;i<curtime.length;i++) {
			for(int j=0;j<fileNames.length;j++) {
				System.out.println(fileNames[j]);
				if(fileNames[j].substring(fileNames[j].length()-8,fileNames[j].length()-4).equals("!!@@")) {
					if(fileNames[j].contains(curtime[i])) {
						StringBuilder builderFile = new StringBuilder(fileNames[j]); // StringBuilder에 파일이름을 담는다
						File oldFile = new File(promotionUpload+fileNames[j]);
						File newFile = new File(promotionUpload+builderFile.replace(builderFile.length()-8, builderFile.length()-4, ""));
						//아직업데이트 되지 않았다는 상태값인 1을 0으로 변경
						//StringBuilder로 0으로 변경 후 파일도 변경
						oldFile.renameTo(newFile);
						promoAttach.setAcaPromoPostVO(acaPromoPostVO);
						promoAttach.setAcaPromoFilepath(promotionUpload+builderFile);
						promotionService.registerAcaPromoAttach(promoAttach);
					}
				}
			}
		}
		mv.setViewName("redirect:detailAcaPromoPost.do?acaPromoNo="+acaPromoPostVO.getAcaPromoNo());
		return mv;
	}
	@Secured("ROLE_ACADEMY")
	@RequestMapping("registerAcaPromoPostForm.do")
	public ModelAndView registerAcaPromoPostForm() {
		ModelAndView mv = new ModelAndView();
		mv.setViewName("promotion/aca_promo_register_form.tiles");
		return mv;
	}
	@Secured("ROLE_ACADEMY")
	@PostMapping("deleteAcaPromoPost.do")
	public String deleteAcaPromoPost(String acaPromoNo) {
		promotionService.deleteAcaPromoPost(acaPromoNo);
		return "redirect:acaPromoList.do";
	}
	@Secured("ROLE_ACADEMY")
	@PostMapping("updateAcaPromoPost.do")
	public ModelAndView updateAcaPromoPost(AcaPromoPostVO acaPromoPostVO,AcaPromoAttachFileVO acaPromoAttachFileVO
			,String[] curtime) {
		ModelAndView mv = new ModelAndView();
		promotionService.updateAcaPromoPost(acaPromoPostVO,acaPromoAttachFileVO);
		String promotionUpload = "C:\\java-kosta\\finalproject\\finalproject\\resources\\promotionUpload\\";
		File promotionFile = new File(promotionUpload);
		//Filepath를 받아와서 해당 경로에 이미지 파일이 있는 지확인
		String[] fileNames = promotionFile.list();
		/*
		 * curtime hidden 값을 받아와 해당 디렉토리에 파일이름에 해당 이름이 들어가는 것이 있으면서
		 * 맨마지막의 값이 1인 파일은 attach 테이블에 업로드 시킨다. 그후 마지막1을 0으로 변경 시킴.
		 */
		AcaPromoAttachFileVO promoAttach = new AcaPromoAttachFileVO();
		for(int i=0;i<curtime.length;i++) {
			for(int j=0;j<fileNames.length;j++) {
				System.out.println(fileNames[j]);
				if(fileNames[j].substring(fileNames[j].length()-8,fileNames[j].length()-4).equals("!!@@")) {
					if(fileNames[j].contains(curtime[i])) {
						StringBuilder builderFile = new StringBuilder(fileNames[j]); // StringBuilder에 파일이름을 담는다
						File oldFile = new File(promotionUpload+fileNames[j]);
						File newFile = new File(promotionUpload+builderFile.replace(builderFile.length()-8, builderFile.length()-4, ""));
						//아직업데이트 되지 않았다는 상태값인 1을 0으로 변경
						//StringBuilder로 0으로 변경 후 파일도 변경
						oldFile.renameTo(newFile);
						promoAttach.setAcaPromoPostVO(acaPromoPostVO);
						promoAttach.setAcaPromoFilepath(promotionUpload+builderFile);
						promotionService.registerAcaPromoAttach(promoAttach);
					}
				}
			}
		}
		mv.setViewName("redirect:detailAcaPromoPost.do?acaPromoNo="+acaPromoPostVO.getAcaPromoNo());
		return mv;
	}
	@Secured("ROLE_ACADEMY")
	@RequestMapping("updateAcaPromoPostForm.do")
	public ModelAndView updateAcaPromoPostForm(String acaPromoNo) {
		ModelAndView mv = new ModelAndView();
		mv.setViewName("promotion/aca_promo_update_form.tiles");
		mv.addObject("de", promotionService.detailAcaPromoPost(acaPromoNo));
		return mv;
	}
}

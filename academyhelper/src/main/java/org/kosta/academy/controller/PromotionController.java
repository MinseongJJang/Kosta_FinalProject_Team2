package org.kosta.academy.controller;

import javax.annotation.Resource;

import org.kosta.academy.model.service.PromotionService;
import org.kosta.academy.model.vo.AcaPromoAttachFileVO;
import org.kosta.academy.model.vo.AcaPromoPostVO;
import org.kosta.academy.model.vo.ListVO;
import org.springframework.security.access.annotation.Secured;
import org.springframework.stereotype.Controller;
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
		System.out.println(promotion);
		mv.addObject("promotion",promotion);
		mv.setViewName("promotion/aca_promo_list.tiles");
		return mv;
	}
	@Secured("ROLE_USER")
	@RequestMapping("detailAcaPromoPost.do")
	public ModelAndView detailAcaPromoPost(String acaPromoNo) {
		System.out.println(acaPromoNo);
		ModelAndView mv = new ModelAndView();
		AcaPromoPostVO acaPromoPostVO = promotionService.detailAcaPromoPost(acaPromoNo);
		mv.addObject("acaPromo",acaPromoPostVO);
		mv.setViewName("promotion/aca_promo_detail.tiles");
		return mv;
	}
	@Secured("ROLE_ACADEMY")
	@RequestMapping("registerAcaPromoPost.do")
	public ModelAndView registerAcaPromoPost(AcaPromoPostVO acaPromoPostVO,AcaPromoAttachFileVO acaPromoAttachFileVO) {
		ModelAndView mv = new ModelAndView();
		System.out.println(acaPromoPostVO);
		System.out.println(acaPromoAttachFileVO);
		promotionService.registerAcaPromoPost(acaPromoPostVO,acaPromoAttachFileVO);
		mv.setViewName("redirect:acaPromoList.do");
		return mv;
	}
	@Secured("ROLE_ACADEMY")
	@RequestMapping("registerAcaPromoPostForm.do")
	public ModelAndView registerAcaPromoPostForm() {
		ModelAndView mv = new ModelAndView();
		mv.setViewName("promotion/aca_promo_register_form.tiles");
		return mv;
	}
}

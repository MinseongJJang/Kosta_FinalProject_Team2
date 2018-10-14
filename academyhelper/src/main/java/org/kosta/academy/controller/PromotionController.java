package org.kosta.academy.controller;

import javax.annotation.Resource;

import org.kosta.academy.model.service.PromotionService;
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
		mv.setViewName("academy_promotion/aca_promo_list.tiles");
		return mv;
	}
	@Secured("ROLE_USER")
	@RequestMapping("detailAcaPromoPost.do")
	public ModelAndView detailAcaPromoPost(String acaPromoNo) {
		System.out.println(acaPromoNo);
		ModelAndView mv = new ModelAndView();
		AcaPromoPostVO acaPromoPostVO = promotionService.detailAcaPromoPost(acaPromoNo);
		mv.addObject("acaPromo",acaPromoPostVO);
		mv.setViewName("academy_promotion/aca_promo_detail.tiles");
		return mv;
	}
	@Secured("ROLE_ACADEMY")
	@RequestMapping("registerAcaPromoPost.do")
	public ModelAndView registerAcaPromoPost(AcaPromoPostVO acaPromoPostVO) {
		ModelAndView mv = new ModelAndView();
		promotionService.registerAcaPromoPost(acaPromoPostVO);
		return mv;
	}
}

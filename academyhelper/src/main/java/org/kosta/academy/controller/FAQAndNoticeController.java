package org.kosta.academy.controller;

import javax.annotation.Resource;

import org.kosta.academy.model.service.FAQAndNotiAndSugService;
import org.kosta.academy.model.vo.FAQVO;
import org.kosta.academy.model.vo.ListVO;
import org.kosta.academy.model.vo.NoticeVO;
import org.kosta.academy.model.vo.SuggestionPostVO;
import org.kosta.academy.model.vo.UserVO;
import org.springframework.security.access.annotation.Secured;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;

@Controller
public class FAQAndNoticeController {
	@Resource
	FAQAndNotiAndSugService fAQAndNotiAndSugService;

	@RequestMapping("listFAQ.do")
	public String listFAQ(Model model,String pageNo) {
		ListVO lvo = fAQAndNotiAndSugService.listFAQ(pageNo);
		model.addAttribute("lvo", lvo);
		return "faq/faqList.tiles";
	}
	@Secured("ROLE_ADMIN")
	@RequestMapping("deleteFAQ.do")
	public String deleteFAQ(String faqNo) {
		fAQAndNotiAndSugService.deleteFAQ(faqNo);
		return "redirect:listFAQ.do";
	}
	@Secured("ROLE_ADMIN")
	@RequestMapping("updateFAQForm.do")
	public String updateFAQForm(String faqNo,Model model) {
		model.addAttribute("fvo", fAQAndNotiAndSugService.detailFAQ(faqNo));
		return "faq/update_faq_form.tiles";
	}
	@Secured("ROLE_ADMIN")
	@RequestMapping("updateFAQ.do")
	public String updateFAQ(FAQVO fAQVO,Model model) {
		fAQAndNotiAndSugService.updateFAQ(fAQVO);
		return "redirect:listFAQ.do";
	}
	@Secured("ROLE_ADMIN")
	@RequestMapping("registerFAQForm.do")
	public String registerFAQForm() {
		return "faq/register_faq_form.tiles";
	}
	@Secured("ROLE_ADMIN")
	@RequestMapping("registerFAQ.do")
	public String registerFAQ(FAQVO faqVO) {
		UserVO userVO=new UserVO();
		userVO.setUsrId("admin");
		faqVO.setUserVO(userVO);
		fAQAndNotiAndSugService.registerFAQ(faqVO);
		return "redirect:listFAQ.do";
	}
	@Secured("ROLE_ADMIN")
	@PostMapping("registerNotice.do")
	public String registerNotice(NoticeVO noticeVO) {
		UserVO userVO=new UserVO();
		userVO.setUsrId("admin");
		noticeVO.setUserVO(userVO);
		fAQAndNotiAndSugService.registerNotice(noticeVO);
		return "redirect:listNotice.do";
	}
	@Secured("ROLE_ADMIN")
	@RequestMapping("registerNoticeForm.do")
	public String registerNoticeForm() {
		return "notice/register_notice_form.tiles";
	}
	@RequestMapping("listNotice.do")
	public String listNotice(String pageNo,Model model) {
		ListVO lvo = fAQAndNotiAndSugService.listNotice(pageNo);
		model.addAttribute("lvo", lvo);
		return "notice/noticeList.tiles";
	}
	@RequestMapping("detailNotice.do")
	public String detailNotice(String noticeNo,Model model) {
		NoticeVO nvo=fAQAndNotiAndSugService.detailNotice(noticeNo);
		model.addAttribute("nvo", nvo);
		return "notice/notice_detail.tiles";
	}
	@Secured("ROLE_ADMIN")
	@RequestMapping("updateNoticeForm.do")
	public String updateNoticeForm(String noticeNo,Model model) {
		model.addAttribute("nvo", fAQAndNotiAndSugService.detailNotice(noticeNo));
		return "notice/update_notice_form.tiles";
	}
	@Secured("ROLE_ADMIN")
	@RequestMapping("updateNotice.do")
	public String updateNotice(NoticeVO noticeVO) {
		fAQAndNotiAndSugService.updateNotice(noticeVO);
		return "redirect:listNotice.do";
	}
	@Secured("ROLE_ADMIN")
	@RequestMapping("deleteNotice.do")
	public String deleteNotice(String noticeNo) {
		fAQAndNotiAndSugService.deleteNotice(noticeNo);
		return "redirect:listNotice.do";
	}
	@Secured("ROLE_USER")
	@RequestMapping("suggestionRegisterForm.do")
	public String suggestionRegisterForm() {
		return "suggestion/suggestion_register_form.tiles";
	}
	@Secured("ROLE_USER")
	@PostMapping("suggestionRegister.do")
	public String suggestionRegister(SuggestionPostVO suggestionPostVO) {
		fAQAndNotiAndSugService.registerSuggestionPost(suggestionPostVO);
		String sugNo=suggestionPostVO.getSugNo();
		return "redirect:detailSuggestionPost.do?sugNo="+sugNo;
	}
	@RequestMapping("listSuggestionPost.do")
	public String listSuggestionPost(String pageNo,Model model) {
		ListVO list=fAQAndNotiAndSugService.listSuggestionPost(pageNo);
		model.addAttribute("list",list.getSuggestionPostList());
		model.addAttribute("pb",list.getPb());
		return "suggestion/list_suggestion.tiles";
	}
	@RequestMapping("detailSuggestionPost.do")
	public String detailSuggestionPost(String sugNo,Model model) {
		SuggestionPostVO vo=fAQAndNotiAndSugService.detailSuggestionPost(sugNo);
		model.addAttribute("vo",vo);
		return "suggestion/detail_suggestion_post.tiles";
	}
	@Secured("ROLE_USER")
	@PostMapping("updateSuggestionPostForm.do")
	public String updateSuggestionPostForm(SuggestionPostVO suggestionPostVO,Model model) {
		model.addAttribute("vo",suggestionPostVO);
		return "suggestion/update_suggestion_post_form.tiles";
	}
	@Secured("ROLE_USER")
	@PostMapping("updateSuggestionPost.do")
	public String updateSuggestionPost(SuggestionPostVO suggestionPostVO) {
		fAQAndNotiAndSugService.updateSuggestionPost(suggestionPostVO);
		String sugNo=suggestionPostVO.getSugNo();
		return "redirect:detailSuggestionPost.do?sugNo="+sugNo;
	}
	@Secured("ROLE_USER")
	@PostMapping("deleteSuggestionPost.do")
	public String deleteSuggestionPost(String sugNo) {
		fAQAndNotiAndSugService.deleteSuggestionPost(sugNo);
		return "redirect:listSuggestionPost.do";
	}
}
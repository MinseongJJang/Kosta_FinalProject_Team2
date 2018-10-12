package org.kosta.academy.model.vo;

import java.util.List;

import org.kosta.academy.model.service.PagingBean;
/**
 * ListVO 페이징 처리시 view에 반환할 때 ListVO에 
 * paging bean과 해당객체 넣어 보내준다.
 * @author kms
 *
 */
public class ListVO {
	private List<AcaUserVO> acaUserList;
	private List<AcademyVO> academyList;
	private List<CurriculumVO> curriculumList;
	private List<AcaQNAVO> acaQNAList;
	private List<FAQVO> faqList;
	private List<NoticeVO> noticeList;
	private List<AcaReviewPostVO> acaReviewPostList; 
	private List<SuggestionPostVO> suggestionPostList;
	private List<AcaPromoPostVO> acaPromoPostList;	
	private PagingBean pb;

	public ListVO() {
		super();
		// TODO Auto-generated constructor stub
	}

	public List<AcaUserVO> getAcaUserList() {
		return acaUserList;
	}
	public void setAcaUserList(List<AcaUserVO> acaUserList) {
		this.acaUserList = acaUserList;
	}
	public List<AcademyVO> getAcademyList() {
		return academyList;
	}
	public void setAcademyList(List<AcademyVO> academyList) {
		this.academyList = academyList;
	}
	public List<CurriculumVO> getCurriculumList() {
		return curriculumList;
	}
	public void setCurriculumList(List<CurriculumVO> curriculumList) {
		this.curriculumList = curriculumList;
	}
	public List<AcaQNAVO> getAcaQNAList() {
		return acaQNAList;
	}
	public void setAcaQNAList(List<AcaQNAVO> acaQNAList) {
		this.acaQNAList = acaQNAList;
	}
	public List<FAQVO> getFaqList() {
		return faqList;
	}
	public void setFaqList(List<FAQVO> faqList) {
		this.faqList = faqList;
	}
	public List<NoticeVO> getNoticeList() {
		return noticeList;
	}
	public void setNoticeList(List<NoticeVO> noticeList) {
		this.noticeList = noticeList;
	}
	public List<AcaReviewPostVO> getAcaReviewPostList() {
		return acaReviewPostList;
	}
	public void setAcaReviewPostList(List<AcaReviewPostVO> acaReviewPostList) {
		this.acaReviewPostList = acaReviewPostList;
	}
	public List<SuggestionPostVO> getSuggestionPostList() {
		return suggestionPostList;
	}
	public void setSuggestionPostList(List<SuggestionPostVO> suggestionPostList) {
		this.suggestionPostList = suggestionPostList;
	}
	public List<AcaPromoPostVO> getAcaPromoPostList() {
		return acaPromoPostList;
	}
	public void setAcaPromoPostList(List<AcaPromoPostVO> acaPromoPostList) {
		this.acaPromoPostList = acaPromoPostList;
	}
	public PagingBean getPb() {
		return pb;
	}
	public void setPb(PagingBean pb) {
		this.pb = pb;
	}

}

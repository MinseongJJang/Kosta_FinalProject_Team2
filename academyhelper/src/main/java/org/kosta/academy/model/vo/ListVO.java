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
	private List<UserVO> userList;
	private List<AcaUserVO> acaUserList;
	private List<AcademyVO> academyList;
	private List<CurriculumVO> curriculumList;
	private List<AcaQNAVO> acaQNAList;
	private List<AcaQNAReplyVO> acaQNAReplyList;
	private List<FAQVO> faqList;
	private List<NoticeVO> noticeList;
	private List<AcaReviewPostVO> acaReviewPostList; 
	private List<AcaReviewReplyVO> acaReviewReplyList; 
	private List<SuggestionPostVO> suggestionPostList;
	private List<AcaPromoPostVO> acaPromoPostList;
	private List<LocationVO> locationList;
	private PagingBean pb;
	public ListVO() {
		super();
		// TODO Auto-generated constructor stub
	}
	public ListVO(List<UserVO> userList, List<AcaUserVO> acaUserList, List<AcademyVO> academyList,
			List<CurriculumVO> curriculumList, List<AcaQNAVO> acaQNAList, List<AcaQNAReplyVO> acaQNAReplyList,
			List<FAQVO> faqList, List<NoticeVO> noticeList, List<AcaReviewPostVO> acaReviewPostList,
<<<<<<< HEAD
			List<SuggestionPostVO> suggestionPostList, List<AcaPromoPostVO> acaPromoPostList,
			List<LocationVO> locationList, PagingBean pb) {
=======
			List<AcaReviewReplyVO> acaReviewReplyList, List<SuggestionPostVO> suggestionPostList,
			List<AcaPromoPostVO> acaPromoPostList, PagingBean pb) {
>>>>>>> branch 'master' of https://github.com/MinseongJJang/Kosta_FinalProject_Team2.git
		super();
		this.userList = userList;
		this.acaUserList = acaUserList;
		this.academyList = academyList;
		this.curriculumList = curriculumList;
		this.acaQNAList = acaQNAList;
		this.acaQNAReplyList = acaQNAReplyList;
		this.faqList = faqList;
		this.noticeList = noticeList;
		this.acaReviewPostList = acaReviewPostList;
		this.acaReviewReplyList = acaReviewReplyList;
		this.suggestionPostList = suggestionPostList;
		this.acaPromoPostList = acaPromoPostList;
		this.locationList = locationList;
		this.pb = pb;
	}
	public List<UserVO> getUserList() {
		return userList;
	}
	public void setUserList(List<UserVO> userList) {
		this.userList = userList;
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
	public List<AcaQNAReplyVO> getAcaQNAReplyList() {
		return acaQNAReplyList;
	}
	public void setAcaQNAReplyList(List<AcaQNAReplyVO> acaQNAReplyList) {
		this.acaQNAReplyList = acaQNAReplyList;
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
	public List<AcaReviewReplyVO> getAcaReviewReplyList() {
		return acaReviewReplyList;
	}
	public void setAcaReviewReplyList(List<AcaReviewReplyVO> acaReviewReplyList) {
		this.acaReviewReplyList = acaReviewReplyList;
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
	public List<LocationVO> getLocationList() {
		return locationList;
	}
	public void setLocationList(List<LocationVO> locationList) {
		this.locationList = locationList;
	}
	public PagingBean getPb() {
		return pb;
	}
	public void setPb(PagingBean pb) {
		this.pb = pb;
	}
	@Override
	public String toString() {
		return "ListVO [userList=" + userList + ", acaUserList=" + acaUserList + ", academyList=" + academyList
				+ ", curriculumList=" + curriculumList + ", acaQNAList=" + acaQNAList + ", acaQNAReplyList="
				+ acaQNAReplyList + ", faqList=" + faqList + ", noticeList=" + noticeList + ", acaReviewPostList="
<<<<<<< HEAD
				+ acaReviewPostList + ", suggestionPostList=" + suggestionPostList + ", acaPromoPostList="
				+ acaPromoPostList + ", locationList=" + locationList + ", pb=" + pb + "]";
=======
				+ acaReviewPostList + ", acaReviewReplyList=" + acaReviewReplyList + ", suggestionPostList="
				+ suggestionPostList + ", acaPromoPostList=" + acaPromoPostList + ", pb=" + pb + "]";
>>>>>>> branch 'master' of https://github.com/MinseongJJang/Kosta_FinalProject_Team2.git
	}
	
}

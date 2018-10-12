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
	
}

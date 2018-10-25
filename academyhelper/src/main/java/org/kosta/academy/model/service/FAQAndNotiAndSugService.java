package org.kosta.academy.model.service;

import org.kosta.academy.model.vo.FAQVO;
import org.kosta.academy.model.vo.ListVO;
import org.kosta.academy.model.vo.NoticeVO;
import org.kosta.academy.model.vo.SuggestionPostAttachFileVO;
import org.kosta.academy.model.vo.SuggestionPostVO;
import org.springframework.stereotype.Service;

/**
 * FAQ 및 Notice
 * @author kms
 *
 */
@Service
public interface FAQAndNotiAndSugService {
	/**
	 * 자주묻는 질문을 등록하는 메소드
	 * @param faqVO
	 */
	public void registerFAQ(FAQVO faqVO);
	/**
	 * 자주묻는 질문 목록을 불러오는 메소드
	 * 페이징빈을 인자값으로 받아와 페이지 정보를 불러온다
	 * @param pageNo
	 * @return
	 */
	public ListVO listFAQ(String pageNo);
	/**
	 * 자주묻는 질문 상세보기 메소드
	 * @param faqNo
	 * @return
	 */
	public FAQVO detailFAQ(String faqNo);
	/**
	 * 자주묻는 질문 수정하는 메소드
	 * @param faqVO
	 */
	public void updateFAQ(FAQVO faqVO);
	/**
	 * 자주묻는 질문을 삭제하는 메소드
	 * @param faqNo
	 */
	public void deleteFAQ(String faqNo);
	/**
	 * 공지사항을 등록하는 메소드
	 * @param noticeVO
	 */
	public void registerNotice(NoticeVO noticeVO);
	/**
	 * 공지사항 목록을 불러오는 메소드
	 * 페이징빈을 인자값으로 받아와 페이지 정보를 불러온다
	 * @param pageNo
	 * @return
	 */
	public ListVO listNotice(String pageNo);
	/**
	 * 공지사항 상세보기 메소드
	 * @param noticeNo
	 * @return
	 */
	public NoticeVO detailNotice(String noticeNo);
	/**
	 * 공지사항을 수정하는 메소드
	 * @param noticeVO
	 */
	public void updateNotice(NoticeVO noticeVO);
	/**
	 * 공지사항을 삭제하는 메소드
	 * @param noticeNo
	 */
	public void deleteNotice(String noticeNo);
	/**
	 * 건의사항을 등록하는 메소드
	 * @param suggestionPostVO
	 */
	public void registerSuggestionPost(SuggestionPostVO suggestionPostVO,SuggestionPostAttachFileVO suggestionPostAttachFileVO);
	/**
	 * 건의사항 목록을 불러오는 메소드
	 * 페이징빈을 인자값으로 받아와 페이지 정보를 불러온다
	 * @param pageNo
	 * @return
	 */
	public ListVO listSuggestionPost(String pageNo);
	/**
	 * 건의사항 상세보기 메소드
	 * 페이징빈을 인자값으로 받아와 페이지 정보를 불러온다
	 * @param sugNo
	 * @return
	 */
	public SuggestionPostVO detailSuggestionPost(String sugNo);
	/**
	 * 건의사항을 수정하는 메소드
	 * @param suggestionPostVO
	 */
	public void updateSuggestionPost(SuggestionPostVO suggestionPostVO);
	/**
	 * 건의사항을 삭제하는 메소드
	 * @param sugNo
	 */
	public void deleteSuggestionPost(String sugNo);
}

package org.kosta.academy.model.mapper;

import java.util.List;

import org.apache.ibatis.annotations.Mapper;
import org.kosta.academy.model.service.PagingBean;
import org.kosta.academy.model.vo.FAQVO;
import org.kosta.academy.model.vo.NoticeVO;

@Mapper
public interface FAQAndNoticeMapper {
	public void registerFAQ(FAQVO faqVO);
	public List<FAQVO> listFAQ(PagingBean pagingBean);
	public FAQVO detailFAQ(String faqNo);
	public void updateFAQ(FAQVO faqVO);
	public void deleteFAQ(String faqNo);
	public void registerNotice(NoticeVO noticeVO);
	public int getTotalFaqCount();
	public int getTotalNoticeCount();
	public List<NoticeVO> listNotice(PagingBean pb);
	public NoticeVO detailNotice(String noticeNo);
	public void updateNotice(NoticeVO noticeVO);
	public void deleteNotice(String noticeNo);
}

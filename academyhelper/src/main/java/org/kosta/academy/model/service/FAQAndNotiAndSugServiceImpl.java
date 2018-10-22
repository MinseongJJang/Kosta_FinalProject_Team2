package org.kosta.academy.model.service;

import java.util.List;

import javax.annotation.Resource;

import org.kosta.academy.model.mapper.FAQAndNoticeMapper;
import org.kosta.academy.model.mapper.SuggestionMapper;
import org.kosta.academy.model.vo.FAQVO;
import org.kosta.academy.model.vo.ListVO;
import org.kosta.academy.model.vo.NoticeVO;
import org.kosta.academy.model.vo.SuggestionPostVO;
import org.springframework.stereotype.Service;

@Service
public class FAQAndNotiAndSugServiceImpl implements FAQAndNotiAndSugService {
	
	@Resource
	FAQAndNoticeMapper faqAndNoticeMapper;
	@Resource
	SuggestionMapper suggestionMapper;
	
	@Override
	public void registerFAQ(FAQVO faqVO) {
		faqAndNoticeMapper.registerFAQ(faqVO);
	}

	@Override
	public ListVO listFAQ(String pageNo) {
		int totalPostCount=faqAndNoticeMapper.getTotalFaqCount();
		PagingBean pb=null;
		if(pageNo==null) {
			pb=new PagingBean(totalPostCount);
		}else {
			pb= new PagingBean(totalPostCount,Integer.parseInt(pageNo));
		}
		List<FAQVO> list=faqAndNoticeMapper.listFAQ(pb);
		ListVO listVO=new ListVO();
		listVO.setFaqList(list);
		listVO.setPb(pb);
		return listVO;

	}

	@Override
	public FAQVO detailFAQ(String faqNo) {
		FAQVO fAQVO=faqAndNoticeMapper.detailFAQ(faqNo);
		return fAQVO;
	}

	@Override
	public void updateFAQ(FAQVO faqVO) {
		faqAndNoticeMapper.updateFAQ(faqVO);
	}

	@Override
	public void deleteFAQ(String faqNo) {
		faqAndNoticeMapper.deleteFAQ(faqNo);
	}

	@Override
	public void registerNotice(NoticeVO noticeVO) {
		faqAndNoticeMapper.registerNotice(noticeVO);
	}

	@Override
	public ListVO listNotice(String pageNo) {
		int totalPostCount=faqAndNoticeMapper.getTotalNoticeCount();
		PagingBean pb=null;
		if(pageNo==null) {
			pb=new PagingBean(totalPostCount);
		}else {
			pb= new PagingBean(totalPostCount,Integer.parseInt(pageNo));
		}
		List<NoticeVO> list=faqAndNoticeMapper.listNotice(pb);
		ListVO listVO=new ListVO();
		listVO.setNoticeList(list);
		listVO.setPb(pb);
		System.out.println(listVO);
		return listVO;
	}

	@Override
	public NoticeVO detailNotice(String noticeNo) {
		NoticeVO nvo=faqAndNoticeMapper.detailNotice(noticeNo);
		return nvo;
	}

	@Override
	public void updateNotice(NoticeVO noticeVO) {
		faqAndNoticeMapper.updateNotice(noticeVO);
		
	}

	@Override
	public void deleteNotice(String noticeNo) {
		faqAndNoticeMapper.deleteNotice(noticeNo);
		
	}

	@Override
	public void registerSuggestionPost(SuggestionPostVO suggestionPostVO) {
		suggestionMapper.registerSuggestionPost(suggestionPostVO);
	}

	@Override
	public ListVO listSuggestionPost(String pageNo) {
		int totalPostCount=suggestionMapper.getTotalSuggestionPostCount();
		PagingBean pb=null;
		if(pageNo==null) {
			pb=new PagingBean(totalPostCount);
		}else {
			pb= new PagingBean(totalPostCount,Integer.parseInt(pageNo));
		}
		List<SuggestionPostVO> list=suggestionMapper.listSuggestionPost(pb);
		ListVO listVO=new ListVO();
		listVO.setSuggestionPostList(list);
		listVO.setPb(pb);
		return listVO;
	}

	@Override
	public SuggestionPostVO detailSuggestionPost(String sugNo) {
		return suggestionMapper.detailSuggestionPost(sugNo);
	}

	@Override
	public void updateSuggestionPost(SuggestionPostVO suggestionPostVO) {
		suggestionMapper.updateSuggestionPost(suggestionPostVO);
	}

	@Override
	public void deleteSuggestionPost(String sugNo) {
		suggestionMapper.deleteSuggestionPost(sugNo);
	}

}

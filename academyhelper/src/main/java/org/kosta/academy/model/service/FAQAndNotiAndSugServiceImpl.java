package org.kosta.academy.model.service;

import java.util.List;

import javax.annotation.Resource;

import org.kosta.academy.model.mapper.FAQAndNoticeMapper;
import org.kosta.academy.model.vo.FAQVO;
import org.kosta.academy.model.vo.ListVO;
import org.kosta.academy.model.vo.NoticeVO;
import org.kosta.academy.model.vo.SuggestionPostVO;
import org.springframework.stereotype.Service;

@Service
public class FAQAndNotiAndSugServiceImpl implements FAQAndNotiAndSugService {
	
	@Resource
	FAQAndNoticeMapper faqAndNoticeMapper;
	@Override
	public void registerFAQ(FAQVO faqVO) {
		// TODO Auto-generated method stub
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
		// TODO Auto-generated method stub
		return null;
	}

	@Override
	public NoticeVO detailNotice(String noticeNo) {
		// TODO Auto-generated method stub
		return null;
	}

	@Override
	public void updateNotice(NoticeVO noticeVO) {
		// TODO Auto-generated method stub
		
	}

	@Override
	public void deleteNotice(String noticeNo) {
		// TODO Auto-generated method stub
		
	}

	@Override
	public void registerSuggestionPost(SuggestionPostVO suggestionPostVO) {
		// TODO Auto-generated method stub
		
	}

	@Override
	public ListVO listSuggestionPost(String pageNo) {
		// TODO Auto-generated method stub
		return null;
	}

	@Override
	public SuggestionPostVO detailSuggestionPost(String sugNo) {
		// TODO Auto-generated method stub
		return null;
	}

	@Override
	public void updateSuggestionPost(SuggestionPostVO suggestionPostVO) {
		// TODO Auto-generated method stub
		
	}

	@Override
	public void deleteSuggestionPost(String sugNo) {
		// TODO Auto-generated method stub
		
	}

}

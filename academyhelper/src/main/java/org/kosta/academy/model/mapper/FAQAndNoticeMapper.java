package org.kosta.academy.model.mapper;

import java.util.List;

import org.apache.ibatis.annotations.Mapper;
import org.kosta.academy.model.service.PagingBean;
import org.kosta.academy.model.vo.FAQVO;

@Mapper
public interface FAQAndNoticeMapper {
	public void registerFAQ(FAQVO faqVO);
	public List<FAQVO> listFAQ(PagingBean pagingBean);
}

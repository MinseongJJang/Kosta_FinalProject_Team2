package org.kosta.academy.model.mapper;

import java.util.List;

import org.apache.ibatis.annotations.Mapper;
import org.kosta.academy.model.service.PagingBean;
import org.kosta.academy.model.vo.SuggestionPostVO;

@Mapper
public interface SuggestionMapper {

	void registerSuggestionPost(SuggestionPostVO suggestionPostVO);

	int getTotalSuggestionPostCount();

	List<SuggestionPostVO> listSuggestionPost(PagingBean pb);

	SuggestionPostVO detailSuggestionPost(String sugNo);

}

package org.kosta.academy.model.mapper;

import java.util.List;

import org.apache.ibatis.annotations.Mapper;
import org.kosta.academy.model.service.PagingBean;
import org.kosta.academy.model.vo.AcaQNAReplyVO;

@Mapper
public interface QNAReplyMapper {
	public List<AcaQNAReplyVO> listAcaQnAReply(PagingBean pagingBean);
	public int getTotalQNAReplyCount();
	 
}

package org.kosta.academy.model.mapper;

import java.util.HashMap;
import java.util.List;

import org.apache.ibatis.annotations.Mapper;
import org.kosta.academy.model.vo.AcaQNAReplyVO;

@Mapper
public interface QNAReplyMapper {
	public List<AcaQNAReplyVO> listAcaQnAReply(HashMap<String,Object> map);
	public int getTotalQNAReplyCount(String qnaNo);
	public void registerAcaQnAReply(AcaQNAReplyVO acaQNAReplyVO);
	public void updateAcaQnAReply(AcaQNAReplyVO acaQNAReplyVO);
	public void deleteAcaQnAReply(String qnaRepNo);
	
}

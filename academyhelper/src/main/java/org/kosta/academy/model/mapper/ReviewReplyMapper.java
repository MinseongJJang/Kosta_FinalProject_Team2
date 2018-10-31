package org.kosta.academy.model.mapper;

import java.util.List;
import java.util.Map;

import org.apache.ibatis.annotations.Mapper;
import org.kosta.academy.model.vo.AcaReviewReplyVO;

@Mapper
public interface ReviewReplyMapper {
	public List<AcaReviewReplyVO> listAcaReviewReply(Map<String,Object> map);
	public int getTotalAcaReviewReplyCount(String acaRevNo);
	public void registerAcaReviewReply(AcaReviewReplyVO acaReviewReplyVO);
	public void updateAcaReviewReply(AcaReviewReplyVO acaReviewReplyVO);
	public void deleteAcaReviewReply(String acaRevRepNo);
	public String getAcaReviewReply(String acaRevRepNo);
}

package org.kosta.academy.model.mapper;

import java.util.List;
import java.util.Map;

import org.apache.ibatis.annotations.Mapper;
import org.kosta.academy.model.service.PagingBean;
import org.kosta.academy.model.vo.AcaCurSatisfactionVO;
import org.kosta.academy.model.vo.AcaReviewAttachFileVO;
import org.kosta.academy.model.vo.AcaReviewPostVO;
import org.kosta.academy.model.vo.HashTagVO;

@Mapper
public interface ReviewMapper {
	public List<AcaReviewPostVO> listAcaReviewPost(PagingBean pb);
	public int getAcaReviewTotalCount();
	public AcaReviewPostVO detailAcaReivewPost(String acaRevNo);
	public void registerAcaReviewPost(AcaReviewPostVO acaReviewPostVO);
	public void registerHashTag(Map<String,String> hashtag);
	public void registerAcaCurSatisfaction(AcaCurSatisfactionVO acaCurSatisfactionVO);
	public List<HashTagVO> hashtagListByAcaRevNo(String acaRevNo);
	public AcaCurSatisfactionVO satisfactionByAcaRevNo(String acaRevNo);
	public void deleteHashTag(String acaRevNo);
	public void updateAcaReviewPost(AcaReviewPostVO acaReviewPostVO);
	public void deleteAcaReviewPost(String acaRevNo);
	public void registerAcaReviewAttach(AcaReviewAttachFileVO reviewAttach);
	
}

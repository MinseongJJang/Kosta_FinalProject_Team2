package org.kosta.academy.model.mapper;

import java.util.List;
import java.util.Map;

import org.apache.ibatis.annotations.Mapper;
import org.kosta.academy.model.service.PagingBean;
import org.kosta.academy.model.vo.AcaPromoAttachFileVO;
import org.kosta.academy.model.vo.AcaPromoPostVO;

@Mapper
public interface PromotionMapper {
	int getTotalPromoPostCount();
	void registerAcaPromoPost(AcaPromoPostVO acaPromoPostVO);
	List<AcaPromoPostVO> listAcaPromoPost(PagingBean pb);
	List<AcaPromoPostVO> listAcaPromoPost(Map<String,Object> map);
	AcaPromoPostVO detailAcaPromoPost(String acaPromoNo);
	void updateAcaPromoPost(AcaPromoPostVO acaPromoPostVO);
	void deleteAcaPromoPost(AcaPromoPostVO acaPromoPostVO);
	void registerAcaPromoFile(AcaPromoAttachFileVO acaPromoAttachFileVO);
	List<AcaPromoAttachFileVO> listAcaPromoFile(AcaPromoAttachFileVO acaPromoAttachFileVO);
	void registerAcaReviewAttach(AcaPromoAttachFileVO promoAttach);
}

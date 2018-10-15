package org.kosta.academy.model.service;

import java.util.List;

import javax.annotation.Resource;

import org.kosta.academy.model.mapper.PromotionMapper;
import org.kosta.academy.model.vo.AcaPromoPostVO;
import org.kosta.academy.model.vo.ListVO;
import org.springframework.stereotype.Service;

@Service
public class PromotionServiceImpl implements PromotionService {
	@Resource
	public PromotionMapper promotionMapper;
	
	@Override
	public void registerAcaPromoPost(AcaPromoPostVO acaPromoPostVO) {
		// TODO Auto-generated method stub
		
	}

	@Override
	public ListVO listAcaPromoPost(String pageNo) {
		PagingBean pb = null;
		int totalPostCount = promotionMapper.getTotalPromoPostCount();
		if(pageNo == null) {
			pb = new PagingBean(totalPostCount); 
		}else {
			pb = new PagingBean(totalPostCount, Integer.parseInt(pageNo)); 
		}
		List<AcaPromoPostVO> promoList = promotionMapper.listAcaPromoPost(pb);
		ListVO promotion = new ListVO();
		promotion.setAcaPromoPostList(promoList);
		promotion.setPb(pb);
		return promotion;
	}

	@Override
	public AcaPromoPostVO detailAcaPromoPost(String acaPromoNo) {
		AcaPromoPostVO acaPromoPostVO =promotionMapper.detailAcaPromoPost(acaPromoNo);
		return acaPromoPostVO;
	}

	@Override
	public void updateAcaPromoPost(AcaPromoPostVO acaPromoPostVO) {
		// TODO Auto-generated method stub
		
	}

	@Override
	public void deleteAcaPromoPost(String acaPromoNo) {
		// TODO Auto-generated method stub
		
	}

}

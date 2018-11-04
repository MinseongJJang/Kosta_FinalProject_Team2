package org.kosta.academy.model.service;

import java.util.List;

import javax.annotation.Resource;

import org.kosta.academy.model.mapper.PromotionMapper;
import org.kosta.academy.model.vo.AcaPromoAttachFileVO;
import org.kosta.academy.model.vo.AcaPromoPostVO;
import org.kosta.academy.model.vo.ListVO;
import org.springframework.stereotype.Service;

@Service
public class PromotionServiceImpl implements PromotionService {
	@Resource
	public PromotionMapper promotionMapper;
	
	@Override
	public void registerAcaPromoPost(AcaPromoPostVO acaPromoPostVO,AcaPromoAttachFileVO acaPromoAttachFileVO) {
		/*
		 * DB에 정보를 저장할 때 파일이 정상적으로 추가되었는 지 여부를 판단하기 위해 추가했던 !!@@를 지우고 추가한다.
		 */
		acaPromoPostVO.setAcaPromoContent(acaPromoPostVO.getAcaPromoContent().replaceAll("!!@@", ""));
		promotionMapper.registerAcaPromoPost(acaPromoPostVO);
		acaPromoAttachFileVO.setAcaPromoPostVO(acaPromoPostVO);
		if(acaPromoAttachFileVO.getAcaPromoFilepath() !=null) {
			promotionMapper.registerAcaPromoFile(acaPromoAttachFileVO);
		}
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
	public void updateAcaPromoPost(AcaPromoPostVO acaPromoPostVO,AcaPromoAttachFileVO acaPromoAttachFileVO) {
		acaPromoPostVO.setAcaPromoContent(acaPromoPostVO.getAcaPromoContent().replaceAll("!!@@", ""));
		System.out.println(acaPromoPostVO);
		promotionMapper.updateAcaPromoPost(acaPromoPostVO);
		acaPromoAttachFileVO.setAcaPromoPostVO(acaPromoPostVO);
		if(acaPromoAttachFileVO.getAcaPromoFilepath() !=null) {
			promotionMapper.registerAcaPromoFile(acaPromoAttachFileVO);
		}		
	}

	@Override
	public void deleteAcaPromoPost(String acaPromoNo) {
		promotionMapper.deleteAcaPromoPost(acaPromoNo);		
	}

	@Override
	public void registerAcaPromoAttach(AcaPromoAttachFileVO promoAttach) {
		promotionMapper.registerAcaPromoAttach(promoAttach);
	}

}

package org.kosta.academy.model.service;

import org.kosta.academy.model.vo.AcaPromoAttachFileVO;
import org.kosta.academy.model.vo.AcaPromoPostVO;
import org.kosta.academy.model.vo.ListVO;
import org.springframework.stereotype.Service;

@Service
public interface PromotionService {
	/**
	 * 학원 홍보글을 등록하는 메소드
	 * @param acaPromoPostVO
	 */
	public void registerAcaPromoPost(AcaPromoPostVO acaPromoPostVO,AcaPromoAttachFileVO acaPromoAttachFileVO);
	/**
	 * 학원 홍보글 목록을 불러오는 메소드
	 * 페이징빈을 인자값으로 받아와 페이지 정보를 불러온다
	 * @param pageNo
	 * @return
	 */
	public ListVO listAcaPromoPost(String pageNo);
	/**
	 * 학원 홍보글 상세보기 메소드
	 * @param acaPromoNo
	 * @return
	 */
	public AcaPromoPostVO detailAcaPromoPost(String acaPromoNo);
	/**
	 * 학원 홍보글을 수정하는 메소드
	 * @param acaPromoPostVO
	 */
	public void updateAcaPromoPost(AcaPromoPostVO acaPromoPostVO);
	/**
	 * 학원 홍보글을 삭제하는 메소드
	 * @param acaPromoNo
	 */
	public void deleteAcaPromoPost(String acaPromoNo);
	public void registerAcaPromoAttach(AcaPromoAttachFileVO promoAttach);
}

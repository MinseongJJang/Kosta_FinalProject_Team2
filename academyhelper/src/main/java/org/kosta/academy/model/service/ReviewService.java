package org.kosta.academy.model.service;
import java.util.Queue;

import org.kosta.academy.model.vo.AcaCurSatisfactionVO;
import org.kosta.academy.model.vo.AcaReviewAttachFileVO;
import org.kosta.academy.model.vo.AcaReviewPostVO;
import org.kosta.academy.model.vo.AcaReviewReplyVO;
import org.kosta.academy.model.vo.CurriculumVO;
import org.kosta.academy.model.vo.HashTagVO;
import org.kosta.academy.model.vo.ListVO;
import org.springframework.stereotype.Service;

@Service
public interface ReviewService {
	/**
	 * 학원후기를 등록하는 메소드
	 * @param acaReviewPostVO
	 */
	public void registerAcaReviewPost(AcaReviewPostVO acaReviewPostVO,CurriculumVO curriculumVO,
			HashTagVO hashTagVO,AcaCurSatisfactionVO acaCurSatisfactionVO);
	/**
	 * 학원후기목록을 불러오는 메소드
	 * 페이징빈을 인자값으로 받아와 페이지 정보를 불러온다
	 * @param pageNo
	 * @return
	 */
	public ListVO listAcaReviewPost(String pageNo);
	/**
	 * 학원후기 상세보기 메소드
	 * @param acaRevNo
	 * @return
	 */
	public Queue<Object> detailAcaReviewPost(String acaRevNo);
	/**
	 * 학원후기를 수정하는 메소드
	 * @param acaReviewPostVO
	 */
	public void updateAcaReviewPost(AcaReviewPostVO acaReviewPostVO,HashTagVO hashTagVO);
	/**
	 * 학원후기를 삭제하는 메소드
	 * @param acaRevNo
	 */
	public void deleteAcaReviewPost(String acaRevNo);
	/**
	 * 학원후기 댓글을 등록하는 메소드
	 * @param acaReviewReplyVO
	 */
	public void registerAcaReviewReply(AcaReviewReplyVO acaReviewReplyVO);
	/**
	 * 학원후기 댓글 목록을 불러오는 메소드
	 * 페이징빈을 인자값으로 받아와 페이지 정보를 불러온다
	 * @param pageNo
	 * @return
	 */
	public ListVO listAcaReviewReply(String pageNo);
	/**
	 * 학원후기 댓글을 수정하는 메소드
	 * @param acaReviewReplyVO
	 */
	public void updateAcaReviewReply(AcaReviewReplyVO acaReviewReplyVO);
	/**
	 * 학원후기 댓글을 삭제하는 메소드
	 * @param acaRevRepNo
	 */
	public void deleteAcaReviewReply(String acaRevRepNo);
	public void registerAcaReviewAttach(AcaReviewAttachFileVO reviewAttach);
}

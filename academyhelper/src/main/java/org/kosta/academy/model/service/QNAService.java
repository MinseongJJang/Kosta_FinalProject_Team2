package org.kosta.academy.model.service;

import org.kosta.academy.model.vo.AcaQNAReplyVO;
import org.kosta.academy.model.vo.AcaQNAVO;
import org.kosta.academy.model.vo.ListVO;
import org.springframework.stereotype.Service;

@Service
public interface QNAService {
	/**
	 * QNA를 등록하는 메소드
	 * @param acaQNAVO
	 */
	public void registerAcaQNA(AcaQNAVO acaQNAVO);
	/**
	 * QNA 목록을 불러오는 메소드
	 * 페이징빈을 인자값으로 받아와 페이지 정보를 불러온다
	 * @param pageNo
	 * @return
	 */
	public ListVO listAcaQNA(String pageNo);
	/**
	 * QNA 상세보기 메소드
	 * @param qnaNo
	 * @return
	 */
	public AcaQNAVO detailAcaQNA(String qnaNo);
	/**
	 * QNA를 수정하는 메소드
	 * @param acaQNAVO
	 */
	public void updateAcaQNA(AcaQNAVO acaQNAVO);
	/**
	 * QNA를 삭제하는 메소드
	 * @param acaQNAVO
	 */
	public void deleteAcaQNA(String qnaNo);
	/**
	 * QNA 댓글을 등록하는 메소드
	 * @param acaQNAReplyVO
	 */
	public void registerAcaQNAReply(AcaQNAReplyVO acaQNAReplyVO);
	/**
	 * QNA 댓글 목록을 불러오는 메소드
	 * 페이징빈을 인자값으로 받아와 페이지 정보를 불러온다
	 * @param pageNo
	 * @return
	 */
	public ListVO listAcaQNAReply(String qnaNo, String pageNo);
	/**
	 * QNA 댓글을 수정하는 메소드
	 * @param acaQNAReplyVO
	 */
	public void updateAcaQnAReply(AcaQNAReplyVO acaQNAReplyVO);
	/**
	 * QNA 댓글을 삭제하는 메소드
	 * @param qnaRepNo
	 */
	public void deleteAcaQNAReply(String qnaRepNo);
	
	public String getAcaQnAReply(String qnaRepNo);
	}

package org.kosta.academy.model.service;

import java.util.HashMap;
import java.util.List;

import javax.annotation.Resource;

import org.kosta.academy.model.mapper.QNAMapper;
import org.kosta.academy.model.mapper.QNAReplyMapper;
import org.kosta.academy.model.vo.AcaQNAReplyVO;
import org.kosta.academy.model.vo.AcaQNAVO;
import org.kosta.academy.model.vo.AcaQNQAttachFileVO;
import org.kosta.academy.model.vo.ListVO;
import org.springframework.stereotype.Service;

@Service
public class QNAServiceImpl implements QNAService {
	@Resource
	private QNAMapper qnaMapper;
	@Resource
	private QNAReplyMapper qnaReplyMapper;

	@Override
	public void registerAcaQNA(AcaQNAVO acaQnaVO, AcaQNQAttachFileVO acaQnaAttachFileVO) {
		
		/*
		 * DB에 정보를 저장할 때 파일이 정상적으로 추가되었는 지 여부를 판단하기 위해 추가했던 !!@@를 지우고 추가한다.
		 */
		acaQnaVO.setQnaContent(acaQnaVO.getQnaContent().replaceAll("!!@@", ""));
		qnaMapper.registerAcaQNA(acaQnaVO);
		acaQnaAttachFileVO.setAcademyQNAVO(acaQnaVO);
		System.out.println(acaQnaAttachFileVO.getQnaFilepath());
		if(acaQnaAttachFileVO.getQnaFilepath() !=null) {
			qnaMapper.registerAcaQNAFile(acaQnaAttachFileVO);
		}
	}
	@Override
	public ListVO listAcaQNA(String pageNo) {
		int totalCount = qnaMapper.getTotalQNACount();
		PagingBean pagingBean = null;
		if (pageNo == null)
			pagingBean = new PagingBean(totalCount);
		else
			pagingBean = new PagingBean(totalCount, Integer.parseInt(pageNo));
		ListVO vo = new ListVO();
		vo.setAcaQNAList(qnaMapper.listAcaQNA(pagingBean));
		vo.setPb(pagingBean);
		return vo;
	}

	@Override
	public AcaQNAVO detailAcaQNA(String qnaNO) {
		AcaQNAVO qnaVO = qnaMapper.detailAcaQNA(qnaNO);
		return qnaVO;
	}

	@Override
	public void updateAcaQNA(AcaQNAVO acaQNAVO) {
		qnaMapper.updateAcaQNA(acaQNAVO);
	}

	@Override
	public void deleteAcaQNA(String qnaNo) {
		qnaMapper.deleteAcaQNA(qnaNo);
	}

	@Override
	public void registerAcaQNAReply(AcaQNAReplyVO acaQNAReplyVO) {
		qnaReplyMapper.registerAcaQnAReply(acaQNAReplyVO);
	}

	@Override
	public ListVO listAcaQNAReply(String qnaNo, String pageNo) {
		HashMap<String, Object> map = new HashMap<String, Object>();
		int totalCount = qnaReplyMapper.getTotalQNAReplyCount(qnaNo);
		PagingBean pagingBean = null;
		if (pageNo == null) {
				pagingBean = new PagingBean(totalCount);
			map.put("qnaNo", qnaNo);
			map.put("start", pagingBean.getStartRowNumber());
			map.put("end", pagingBean.getEndRowNumber());
		} else {
			pagingBean = new PagingBean(totalCount, Integer.parseInt(pageNo));
			map.put("qnaNo", qnaNo);
			map.put("start", pagingBean.getStartRowNumber());
			map.put("end", pagingBean.getEndRowNumber());
			map.put("pageNo", pagingBean.getNowPage());
	}
	List<AcaQNAReplyVO> QNAReplyList = qnaReplyMapper.listAcaQnAReply(map);
	ListVO vo = new ListVO();
	vo.setAcaQNAReplyList(QNAReplyList);
	vo.setPb(pagingBean);
	return vo;
	}

	@Override
	public void updateAcaQnAReply(AcaQNAReplyVO acaQNAReplyVO) throws Exception {
		try {
		qnaReplyMapper.updateAcaQnAReply(acaQNAReplyVO);
		}catch(Exception i) {
			throw new Exception("내용을 입력하세요");
		}
	}

	@Override
	public void deleteAcaQNAReply(String qnaRepNo) throws Exception {
		try {
		qnaReplyMapper.deleteAcaQnAReply(qnaRepNo);
		}catch(Exception e) {
			throw new Exception("삭제 실패");
		}
	}

	@Override
	public String getAcaQnAReply(String qnaRepNo) {
		return qnaReplyMapper.getAcaQnAReply(qnaRepNo);
	}
	@Override
	public void registerAcaQnaAttach(AcaQNQAttachFileVO acaQnaAttachFileVO) {
		qnaMapper.registerAcaQnaAttach(acaQnaAttachFileVO);
	}

	
	
}

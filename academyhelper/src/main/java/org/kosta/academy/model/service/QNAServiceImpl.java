package org.kosta.academy.model.service;

import java.util.HashMap;
import java.util.List;

import javax.annotation.Resource;

import org.kosta.academy.model.mapper.QNAMapper;
import org.kosta.academy.model.mapper.QNAReplyMapper;
import org.kosta.academy.model.vo.AcaQNAReplyVO;
import org.kosta.academy.model.vo.AcaQNAVO;
import org.kosta.academy.model.vo.ListVO;
import org.springframework.stereotype.Service;

@Service
public class QNAServiceImpl implements QNAService {
	@Resource
	private QNAMapper qnaMapper;
	@Resource
	private QNAReplyMapper qnaReplyMapper;

	@Override
	public void registerAcaQNA(AcaQNAVO acaQNAVO) {
		qnaMapper.registerAcaQNA(acaQNAVO);
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
		// TODO Auto-generated method stub

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
	vo.setPb(pagingBean);/*
	System.out.println(map);
	System.out.println(QNAReplyList);*/
	return vo;
	}

	@Override
	public void updateAcaQNAReply(AcaQNAReplyVO acaQNAReplyVO) {
		// TODO Auto-generated method stub

	}

	@Override
	public void deleteAcaQNAReply(String qnaRepNo) {
		// TODO Auto-generated method stub

	}

}

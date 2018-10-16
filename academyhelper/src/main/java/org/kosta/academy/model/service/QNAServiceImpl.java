package org.kosta.academy.model.service;

import javax.annotation.Resource;

import org.kosta.academy.model.mapper.QNAMapper;
import org.kosta.academy.model.vo.AcaQNAReplyVO;
import org.kosta.academy.model.vo.AcaQNAVO;
import org.kosta.academy.model.vo.ListVO;
import org.springframework.stereotype.Service;

@Service
public class QNAServiceImpl implements QNAService {
	@Resource
	private QNAMapper qnaMapper;
	@Override
	public void registerAcaQNA(AcaQNAVO acaQNAVO) {
		
	}

	@Override
	public ListVO listAcaQNA(String pageNo) {
		int totalCount=qnaMapper.getTotalQNACount();
		PagingBean pagingBean=null;
		if(pageNo==null)
			pagingBean=new PagingBean(totalCount);
		else
			pagingBean=new PagingBean(totalCount,Integer.parseInt(pageNo));		
		ListVO vo=new ListVO();
		vo.setAcaQNAList(qnaMapper.listAcaQNA(pagingBean));
		vo.setPb(pagingBean);
		return vo;
	}

	@Override
	public AcaQNAVO detailAcaQNA(String qnaNo) {
		// TODO Auto-generated method stub
		return null;
	}

	@Override
	public void updateAcaQNA(AcaQNAVO acaQNAVO) {
		// TODO Auto-generated method stub
		
	}

	@Override
	public void deleteAcaQNA(AcaQNAVO acaQNAVO) {
		// TODO Auto-generated method stub
		
	}

	@Override
	public void registerAcaQNAReply(AcaQNAReplyVO acaQNAReplyVO) {
		// TODO Auto-generated method stub
		
	}

	@Override
	public ListVO listAcaQNAReply(String pageNo) {
		// TODO Auto-generated method stub
		return null;
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

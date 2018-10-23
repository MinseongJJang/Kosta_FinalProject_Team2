package org.kosta.academy.model.service;

import java.util.HashMap;
import java.util.LinkedList;
import java.util.List;
import java.util.Map;
import java.util.Queue;

import javax.annotation.Resource;

import org.kosta.academy.model.mapper.AcademyMapper;
import org.kosta.academy.model.mapper.ReviewMapper;
import org.kosta.academy.model.mapper.ReviewReplyMapper;
import org.kosta.academy.model.vo.AcaCurSatisfactionVO;
import org.kosta.academy.model.vo.AcaReviewAttachFileVO;
import org.kosta.academy.model.vo.AcaReviewPostVO;
import org.kosta.academy.model.vo.AcaReviewReplyVO;
import org.kosta.academy.model.vo.CurriculumVO;
import org.kosta.academy.model.vo.HashTagVO;
import org.kosta.academy.model.vo.ListVO;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

@Service
public class ReviewServiceImpl implements ReviewService {
	@Resource
	public ReviewMapper reviewMapper;
	@Resource
	public AcademyMapper academyMapper;
	@Resource
	public ReviewReplyMapper reviewReplyMapper;

	@Transactional
	@Override
	public void registerAcaReviewPost(AcaReviewPostVO acaReviewPostVO,CurriculumVO curriculumVO,
			HashTagVO hashTagVO,AcaCurSatisfactionVO acaCurSatisfactionVO) {
		reviewMapper.registerAcaReviewPost(acaReviewPostVO);
		String[] hashtagNames = hashTagVO.getHashTagName().split(",");
		
		for(int i=0; i<hashtagNames.length;i++) {
			Map<String,String> map = new HashMap<String,String>();
			map.put("ACAREVNO",acaReviewPostVO.getAcaRevNo() );
			map.put("HASHTAGNAME", hashtagNames[i]);
			reviewMapper.registerHashTag(map);
		}
		reviewMapper.registerAcaCurSatisfaction(acaCurSatisfactionVO);
	}

	@Override
	public ListVO listAcaReviewPost(String pageNo) {
		int totalPostCount = reviewMapper.getAcaReviewTotalCount();
		PagingBean pb = null;
		if(pageNo == null) {
			pb = new PagingBean(totalPostCount);
		}else {
			pb = new PagingBean(totalPostCount, Integer.parseInt(pageNo));
		}
		List<AcaReviewPostVO> rlist = reviewMapper.listAcaReviewPost(pb);
		ListVO listVO = new ListVO();
		listVO.setPb(pb);
		listVO.setAcaReviewPostList(rlist);
		return listVO;
	}
	public ListVO listAcaReviewPostByCurNo(String curNo) {
		List<AcaReviewPostVO> reviewlist = reviewMapper.listAcaReviewPostByCurNo(curNo);
		ListVO listVO = new ListVO();
		listVO.setAcaReviewPostList(reviewlist);
		return listVO;
	}
	
	@Transactional
	@Override
	public Queue<Object> detailAcaReviewPost(String acaRevNo) {
		AcaReviewPostVO reviewVO = reviewMapper.detailAcaReivewPost(acaRevNo);
		List<HashTagVO> hashList = reviewMapper.hashtagListByAcaRevNo(acaRevNo);
		AcaCurSatisfactionVO satisfactionVO = reviewMapper.satisfactionByAcaRevNo(acaRevNo);
		Queue<Object> queue = new LinkedList<Object>();
		queue.offer(reviewVO);
		queue.offer(hashList);
		queue.offer(satisfactionVO);
		return queue;
	}
	@Transactional
	@Override
	public void updateAcaReviewPost(AcaReviewPostVO acaReviewPostVO,HashTagVO hashTagVO) {
		reviewMapper.updateAcaReviewPost(acaReviewPostVO);
			reviewMapper.deleteHashTag(acaReviewPostVO.getAcaRevNo());
			String[] hashtagNames = hashTagVO.getHashTagName().split(",");
			for(int i=0; i<hashtagNames.length;i++) {
				Map<String,String> map = new HashMap<String,String>();
				map.put("ACAREVNO",acaReviewPostVO.getAcaRevNo() );
				map.put("HASHTAGNAME", hashtagNames[i]);
				reviewMapper.registerHashTag(map);
			}
	}

	@Override
	public void deleteAcaReviewPost(String acaRevNo) {
		reviewMapper.deleteAcaReviewPost(acaRevNo);
	}

	@Override
	public void registerAcaReviewReply(AcaReviewReplyVO acaReviewReplyVO) {
		reviewReplyMapper.registerAcaReviewReply(acaReviewReplyVO);
	}

	@Override
	public ListVO listAcaReviewReply(String acaRevNo, String pageNo) {
		HashMap<String, Object> map = new HashMap<String, Object>();
		int totalCount = reviewReplyMapper.getTotalAcaReviewReplyCount(acaRevNo);
		PagingBean pagingBean = null;
		if (pageNo == null) {
			pagingBean = new PagingBean(totalCount);
			map.put("acaRevNo", acaRevNo);
			map.put("start", pagingBean.getStartRowNumber());
			map.put("end", pagingBean.getEndRowNumber());
		} else {
			pagingBean = new PagingBean(totalCount, Integer.parseInt(pageNo));
			map.put("acaRevNo", acaRevNo);
			map.put("start", pagingBean.getStartRowNumber());
			map.put("end", pagingBean.getEndRowNumber());
			map.put("pageNo", pagingBean.getNowPage());
		}
		List<AcaReviewReplyVO> QNAReplyList = reviewReplyMapper.listAcaReviewReply(map);
		ListVO vo = new ListVO();
		vo.setAcaReviewReplyList(QNAReplyList);
		vo.setPb(pagingBean);
		return vo;
	}

	@Override
	public void updateAcaReviewReply(AcaReviewReplyVO acaReviewReplyVO) {
		reviewReplyMapper.updateAcaReviewReply(acaReviewReplyVO);
	}

	@Override
	public void deleteAcaReviewReply(String acaRevRepNo) {
		reviewReplyMapper.deleteAcaReviewReply(acaRevRepNo);
	}

	@Override
	public AcaCurSatisfactionVO satisfactionByCurNo(String curNo) {
		AcaCurSatisfactionVO satisVO = reviewMapper.satisfactionByCurNo(curNo);
		return satisVO;
	}
	
	public void registerAcaReviewAttach(AcaReviewAttachFileVO reviewAttach) {
		reviewMapper.registerAcaReviewAttach(reviewAttach);
	}

	@Override
	public String getAcaReviewReply(String acaRevRepNo) {
		return reviewReplyMapper.getAcaReviewReply(acaRevRepNo);
	}
}

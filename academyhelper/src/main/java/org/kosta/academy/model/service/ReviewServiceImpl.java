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
	private ReviewMapper reviewMapper;
	@Resource
	private AcademyMapper academyMapper;
	@Resource
	private ReviewReplyMapper reviewReplyMapper;

	@Transactional
	@Override
	public void registerAcaReviewPost(AcaReviewPostVO acaReviewPostVO,CurriculumVO curriculumVO,
			HashTagVO hashTagVO,AcaCurSatisfactionVO acaCurSatisfactionVO) {
		acaReviewPostVO.setAcaRevContent(acaReviewPostVO.getAcaRevContent().replaceAll("!!@@", ""));
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
	
	@Override
	public Queue<Object> detailAcaReviewPost(String acaRevNo,String pageNo) {
		AcaReviewPostVO reviewVO = reviewMapper.detailAcaReivewPost(acaRevNo);
		List<HashTagVO> hashList = reviewMapper.hashtagListByAcaRevNo(acaRevNo);
		AcaCurSatisfactionVO satisfactionVO = reviewMapper.satisfactionByAcaRevNo(acaRevNo);
		Queue<Object> queue = new LinkedList<Object>();
		queue.offer(reviewVO);
		queue.offer(hashList);
		queue.offer(satisfactionVO);
		
		Map<String, Object> map = new HashMap<String, Object>();
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
		}
		List<AcaReviewReplyVO> acaReviewReplyList = reviewReplyMapper.listAcaReviewReply(map);
		ListVO vo = new ListVO();
		if(!acaReviewReplyList.isEmpty()) {
			vo.setAcaReviewReplyList(acaReviewReplyList);
			vo.setPb(pagingBean);
		}
		if(acaReviewReplyList!=null) {
			queue.offer(vo);
		}
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

	@Override
	public ListVO listAcaReviewReply(AcaReviewReplyVO acaReviewReplyVO,String pageNo) {
		PagingBean pb = null;
		int totalCount =reviewReplyMapper.getTotalAcaReviewReplyCount(acaReviewReplyVO.getAcaReviewPostVO().getAcaRevNo());
		Map<String,Object> map = new HashMap<String,Object>();
		if(pageNo==null) {
			pb = new PagingBean(totalCount);
			map.put("acaRevNo", acaReviewReplyVO.getAcaReviewPostVO().getAcaRevNo());
			map.put("start", pb.getStartRowNumber());
			map.put("end", pb.getEndRowNumber());
		} else {
			pb = new PagingBean(totalCount, Integer.parseInt(pageNo));
			map.put("acaRevNo", acaReviewReplyVO.getAcaReviewPostVO().getAcaRevNo());
			map.put("start", pb.getStartRowNumber());
			map.put("end", pb.getEndRowNumber());
		}
		List<AcaReviewReplyVO> list = reviewReplyMapper.listAcaReviewReply(map);
		ListVO replyList = new ListVO();
		replyList.setPb(pb);
		replyList.setAcaReviewReplyList(list);
		return replyList;
		
	}
}

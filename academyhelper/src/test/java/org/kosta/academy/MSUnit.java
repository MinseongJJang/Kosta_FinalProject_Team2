package org.kosta.academy;

import javax.annotation.Resource;

import org.apache.commons.logging.Log;
import org.apache.commons.logging.impl.SLF4JLogFactory;
import org.junit.Test;
import org.junit.runner.RunWith;
import org.kosta.academy.model.mapper.AcademyMapper;
import org.kosta.academy.model.mapper.CurriculumMapper;
import org.kosta.academy.model.mapper.PromotionMapper;
import org.kosta.academy.model.mapper.ReviewMapper;
import org.kosta.academy.model.mapper.UserMapper;
import org.springframework.test.context.ContextConfiguration;
import org.springframework.test.context.junit4.SpringJUnit4ClassRunner;

@RunWith(SpringJUnit4ClassRunner.class)
@ContextConfiguration(locations= {"file:src/main/webapp/WEB-INF/spring-model.xml","file:src/main/webapp/WEB-INF/spring-security.xml"})
public class MSUnit {
	Log log = SLF4JLogFactory.getLog(getClass());
	//member 단위 테스트
	@Resource
	AcademyMapper academyMapper;
	@Resource
	UserMapper userMapper;
	@Resource
	PromotionMapper promoMapper;
	@Resource
	ReviewMapper reviewMapper;
	@Resource
	CurriculumMapper curriculumMapper;
	public void testLog() {
		log.debug("로그테스트");
		
	}
	@Test
	public void test() {
		/*UserVO vo = mapper.findUserById("admin");
		System.out.println(vo);*/
		/*List<Authority> list = mapper.selectAuthorityById("admin");
		System.out.println(list);*/
		//System.out.println(promoMapper.getTotalPromoPostCount());
		/*UserVO userVO = userMapper.getUserInfo("java");
		AcaUserVO acaUserVO = new AcaUserVO();
		acaUserVO.setUserVO(userVO);*/
		/*AcaPromoPostVO acaPromoPostVO = new AcaPromoPostVO();
		acaPromoPostVO.setAcaPromoTitle("kosta2");
		acaPromoPostVO.setAcaPromoContent("kosta2");
		acaPromoPostVO.setAcaUserVO(acaUserVO);
		promoMapper.registerAcaPromoPost(acaPromoPostVO);*/
		
		/*AcaPromoPostVO acaPromoPostVO = new AcaPromoPostVO();
		acaPromoPostVO.setAcaPromoNo("4");
		Map<String,Object> map = new HashMap<String,Object>();
		map.put("USR_ID", acaUserVO.getUserVO().getUsrId());
		map.put("PROMO_NO", acaPromoPostVO.getAcaPromoNo());
		AcaPromoPostVO promo = promoMapper.detailAcaPromoPost(map);
		System.out.println(promo);
		AcaPromoAttachFileVO acaPromoAttachFileVO = new AcaPromoAttachFileVO();
		acaPromoAttachFileVO.setAcaPromoFilepath("c://sss");
		acaPromoAttachFileVO.setAcaPromoPostVO(promo);
		promoMapper.registerAcaPromoFile(acaPromoAttachFileVO);
		List<AcaPromoAttachFileVO> fileList = promoMapper.listAcaPromoFile(acaPromoAttachFileVO);
		for(AcaPromoAttachFileVO file : fileList) {
			System.out.println(file);
		}
		System.out.println(promoMapper.detailAcaPromoPost(map));*/
		/*int totalCount = promoMapper.getTotalPromoPostCount();
		PagingBean pb = new PagingBean(totalCount);
		List<AcaPromoPostVO> promoList = promoMapper.listAcaPromoPost(pb);
		for(AcaPromoPostVO promo : promoList) {
			System.out.println(promo);
		}*/
		
		//System.out.println(reviewMapper.detailAcaReivewPost("5"));
	/*	int totalPostCount = reviewMapper.getAcaReviewTotalCount();
		PagingBean pb = new PagingBean(totalPostCount);
		List<AcaReviewPostVO> reviewList = reviewMapper.listAcaReviewPost(pb);
		for(AcaReviewPostVO post : reviewList) {
			System.out.println(post);
		}*/
		/*List<CurriculumVO> curriculumList = curriculumMapper.getCurriculumList("3");
		for(CurriculumVO cur : curriculumList) {
			System.out.println(cur); 
		}*/
		/*UserVO userVO = new UserVO();
		userVO.setUsrId("java1");
		CurriculumVO curriculumVO = new CurriculumVO();
		curriculumVO.setCurNo("4");
		AcaReviewPostVO acaReviewPostVO = new AcaReviewPostVO();
		acaReviewPostVO.setAcaRevTitle("후기123456789");
		acaReviewPostVO.setAcaRevContent("후기내용");
		acaReviewPostVO.setCurriculumVO(curriculumVO);
		acaReviewPostVO.setUserVO(userVO);
		reviewMapper.registerAcaReviewPost(acaReviewPostVO);*/
		//System.out.println(acaReviewPostVO.getAcaRevNo());
		//AcaReviewPostVO acaReview = reviewMapper.detailAcaReivewPost(acaReviewPostVO.getAcaRevNo());
		//System.out.println(acaReview);
		/*AcaReviewPostVO acaReviewPostVO = new AcaReviewPostVO();
		acaReviewPostVO.setAcaRevContent("sdfsdfsdfsdf");
		acaReviewPostVO.setAcaRevTitle("dsfsdew32423423");*/
		/*HashTagVO hash = new HashTagVO();
		hash.setAcaReviewPostVO(acaReviewPostVO);
		hash.setHashTagName("#sfsdfsdfsdfsdfsdf");
		Map<String,String> map = new HashMap<String,String>();
		map.put("ACAREVNO", acaReviewPostVO.getAcaRevNo());
		map.put("HASHTAGNAME", hash.getHashTagName());
		System.out.println("map : " + map);
		reviewMapper.registerHashTag(map);*/
		/*AcaCurSatisfactionVO acaCurSatisfactionVO = new AcaCurSatisfactionVO();
		acaCurSatisfactionVO.setAcaReviewPostVO(acaReviewPostVO);
		acaCurSatisfactionVO.setAmentiesSatis("10");
		acaCurSatisfactionVO.setCurSatis("10");
		acaCurSatisfactionVO.setEmpLinksSatis("10");
		acaCurSatisfactionVO.setLecturerSatis("10");
		acaCurSatisfactionVO.setTrafficSatis("10");
		reviewMapper.registerAcaCurSatisfaction(acaCurSatisfactionVO);*/
		/*List<HashTagVO> hashList = reviewMapper.hashtagListByAcaRevNo(acaReviewPostVO.getAcaRevNo());
		AcaCurSatisfactionVO satisfaction = reviewMapper.satisfactionByAcaRevNo(acaReviewPostVO.getAcaRevNo());
		Queue<Object> queue = new LinkedList<Object>();
		queue.offer(hashList);
		queue.offer(satisfaction);
		queue.offer(acaReviewPostVO);
		
		
		@SuppressWarnings("unchecked")
		List<HashTagVO> hash = (List<HashTagVO>) queue.poll();
		AcaCurSatisfactionVO satis = (AcaCurSatisfactionVO) queue.poll();
		AcaReviewPostVO review = (AcaReviewPostVO) queue.poll();
		
		System.out.println(review);
		for(HashTagVO hashs : hash) {
			System.out.println(hashs);
		}
		System.out.println(satis);*/
		
		/*AcademyVO academy = academyMapper.getAcademyByAcaNo("3");
		System.out.println(academy);*/
		/*AcaReviewPostVO review = reviewMapper.detailAcaReivewPost("14");
		System.out.println(review);*/
		MSUnit ms = new MSUnit();
		ms.testLog();
	}
}

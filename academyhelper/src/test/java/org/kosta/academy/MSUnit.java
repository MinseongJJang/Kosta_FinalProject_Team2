package org.kosta.academy;

import java.util.List;

import javax.annotation.Resource;

import org.junit.Test;
import org.junit.runner.RunWith;
import org.kosta.academy.model.mapper.PromotionMapper;
import org.kosta.academy.model.mapper.UserMapper;
import org.kosta.academy.model.service.PagingBean;
import org.kosta.academy.model.vo.AcaPromoPostVO;
import org.kosta.academy.model.vo.AcaUserVO;
import org.kosta.academy.model.vo.UserVO;
import org.springframework.test.context.ContextConfiguration;
import org.springframework.test.context.junit4.SpringJUnit4ClassRunner;

@RunWith(SpringJUnit4ClassRunner.class)
@ContextConfiguration(locations= {"file:src/main/webapp/WEB-INF/spring-model.xml","file:src/main/webapp/WEB-INF/spring-security.xml"})
public class MSUnit {
	//member 단위 테스트
	@Resource
	UserMapper userMapper;
	@Resource
	PromotionMapper promoMapper;
	@Test
	public void test() {
		/*UserVO vo = mapper.findUserById("admin");
		System.out.println(vo);*/
		/*List<Authority> list = mapper.selectAuthorityById("admin");
		System.out.println(list);*/
		//System.out.println(promoMapper.getTotalPromoPostCount());
		UserVO userVO = userMapper.getUserInfo("java");
		AcaUserVO acaUserVO = new AcaUserVO();
		acaUserVO.setUserVO(userVO);
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
		int totalCount = promoMapper.getTotalPromoPostCount();
		PagingBean pb = new PagingBean(totalCount);
		List<AcaPromoPostVO> promoList = promoMapper.listAcaPromoPost(pb);
		for(AcaPromoPostVO promo : promoList) {
			System.out.println(promo);
		}
	}
}

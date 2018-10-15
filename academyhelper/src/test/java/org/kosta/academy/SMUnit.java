package org.kosta.academy;

import javax.annotation.Resource;

import org.junit.Test;
import org.junit.runner.RunWith;
import org.kosta.academy.model.service.FAQAndNotiAndSugService;
import org.kosta.academy.model.vo.FAQVO;
import org.kosta.academy.model.vo.UserVO;
import org.springframework.test.context.ContextConfiguration;
import org.springframework.test.context.junit4.SpringJUnit4ClassRunner;

@RunWith(SpringJUnit4ClassRunner.class)
@ContextConfiguration(locations= {"file:src/main/webapp/WEB-INF/spring-model.xml","file:src/main/webapp/WEB-INF/spring-security.xml"})
public class SMUnit {
	@Resource
	FAQAndNotiAndSugService faqService;
	@Test
	public void test() {
		UserVO userVO=new UserVO();
		userVO.setUsrId("java");
		FAQVO faqVO=new FAQVO();
		faqVO.setFaqTitle("교육기관 알려주세요");
		faqVO.setFaqContent("kosta 알려주세요");
		faqVO.setUserVO(userVO);
		faqService.registerFAQ(faqVO);
		System.out.println(faqVO);
	}
}

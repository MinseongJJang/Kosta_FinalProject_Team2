package org.kosta.academy;

import javax.annotation.Resource;

import org.junit.Test;
import org.junit.runner.RunWith;
import org.kosta.academy.model.service.FAQAndNotiAndSugService;
import org.kosta.academy.model.service.PagingBean;
import org.kosta.academy.model.vo.ListVO;
import org.springframework.test.context.ContextConfiguration;
import org.springframework.test.context.junit4.SpringJUnit4ClassRunner;

@RunWith(SpringJUnit4ClassRunner.class)
@ContextConfiguration(locations= {"file:src/main/webapp/WEB-INF/spring-model.xml","file:src/main/webapp/WEB-INF/spring-security.xml"})
public class SMUnit {
	@Resource
	FAQAndNotiAndSugService faqService;
	@Resource
	FAQAndNotiAndSugService notiService;
	@Resource
	FAQAndNotiAndSugService sugService;
	@Test
	public void test() {
		/*UserVO userVO=new UserVO();
		userVO.setUsrId("java");
		FAQVO faqVO=new FAQVO();
		faqVO.setFaqTitle("교육기관 알려주세요");
		faqVO.setFaqContent("kosta 알려주세요");
		faqVO.setUserVO(userVO);
		faqService.registerFAQ(faqVO);
		System.out.println(faqVO);*/
		
		PagingBean pb=new PagingBean();
		/*List<FAQVO> list = mapper.listFAQ(pb);
		for(int i=0; i<list.size();i++) {
			System.out.println(list.get(i));
		}*
		ListVO listVO=faqService.listFAQ(pb);
		for(int i=0;i<listVO.getFaqList().size();i++) {
			System.out.println(listVO.getFaqList().get(i));
		}
		FAQVO fAQVO=faqService.detailFAQ("10");
		System.out.println(fAQVO);
		FAQVO fAQVO=new FAQVO();
		fAQVO.setFaqNo("5");
		fAQVO.setFaqTitle("이름 수정");
		fAQVO.setFaqContent("내용 수정");
		faqService.updateFAQ(fAQVO);*/
		//faqService.deleteFAQ("5");
		ListVO lvo=faqService.listFAQ("2");
		System.out.println(lvo.getPb().getStartRowNumber());
		System.out.println(lvo.getPb().getEndRowNumber());
	}
}

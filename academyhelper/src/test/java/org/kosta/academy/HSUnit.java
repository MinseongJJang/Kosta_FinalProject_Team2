package org.kosta.academy;

import javax.annotation.Resource;

import org.junit.Test;
import org.junit.runner.RunWith;
import org.kosta.academy.model.mapper.QNAMapper;
import org.kosta.academy.model.service.QNAService;
import org.kosta.academy.model.vo.AcaQNAVO;
import org.springframework.test.context.ContextConfiguration;
import org.springframework.test.context.junit4.SpringJUnit4ClassRunner;

@RunWith(SpringJUnit4ClassRunner.class)
@ContextConfiguration(locations= {"file:src/main/webapp/WEB-INF/spring-model.xml","file:src/main/webapp/WEB-INF/spring-security.xml"})
public class HSUnit {
	@Resource
	QNAMapper qnaMapper;
	@Resource
	QNAService qnaService;
	@Test
	public void test() {
		//총 게시물 수
		/*int totalCount = qnaMapper.getTotalQNACount();
		System.out.println(totalCount);
		
		//QNA목록
		PagingBean pagingBean = new PagingBean(totalCount);
		List<AcaQNAVO> listQNA = qnaMapper.listAcaQNA(pagingBean);
		ListVO lvo = new ListVO();
		lvo.setAcaQNAList(listQNA);
		for(int i=0; i<lvo.getAcaQNAList().size();i++) {
			System.out.println(lvo.getAcaQNAList().get(i));
		}*/
		/*String pageNo="1";
		ListVO list=qnaService.listAcaQNA(pageNo);

		System.out.println(list.getAcaQNAList());*/
		//QNA 상세보기
		AcaQNAVO qnaVO = qnaMapper.detailAcaQNA("12");
		System.out.println(qnaVO);
	}
}

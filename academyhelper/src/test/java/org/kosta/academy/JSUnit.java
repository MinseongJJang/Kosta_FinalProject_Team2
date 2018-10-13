package org.kosta.academy;

import java.util.List;

import org.junit.Test;
import org.junit.runner.RunWith;
import org.kosta.academy.model.mapper.CurriculumMapper;
import org.kosta.academy.model.service.PagingBean;
import org.kosta.academy.model.vo.CurriculumVO;
import org.kosta.academy.model.vo.ListVO;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.test.context.ContextConfiguration;
import org.springframework.test.context.junit4.SpringJUnit4ClassRunner;

@RunWith(SpringJUnit4ClassRunner.class)
@ContextConfiguration(locations = { "file:src/main/webapp/WEB-INF/spring-model.xml",
		"file:src/main/webapp/WEB-INF/spring-security.xml" })
public class JSUnit {
	@Autowired
	private CurriculumMapper curriculumMapper;

	@Test
	public void test() {
		int totalPostCount = curriculumMapper.getTotalCurriculumCount();
		/*
		 * System.out.println(totalPostCount);
		 */ 
		PagingBean pagingBean = new PagingBean(totalPostCount);

		List<CurriculumVO> curriculumList = curriculumMapper.listCurriculum("1", pagingBean);
		ListVO lvo = new ListVO();
		lvo.setCurriculumList(curriculumList);
		for(int i=0; i<lvo.getCurriculumList().size();i++) {
			System.out.println(lvo.getCurriculumList().get(i));
		}
		/*
		 * String address="판교"; CurriculumVO curriculmVO = {};
		 * curriculumMapper.registerCurriculum(curriculmVO));
		 */

	}
}

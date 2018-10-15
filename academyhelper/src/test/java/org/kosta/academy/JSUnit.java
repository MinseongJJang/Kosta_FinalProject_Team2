package org.kosta.academy;

import java.util.HashMap;
import java.util.List;
import java.util.Map;

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
		
		/*CurriculumVO curriculumVO = new CurriculumVO();
		
		curriculumMapper.write(curriculumVO);
		*/
		
		//리스트 상세
		/*String curNo="1";
		CurriculumVO detailCurriculum = curriculumMapper.detailCurriculum(curNo);
		System.out.println(detailCurriculum);
*/		
		
	//리스트 출력
	 /*int totalCurCount = curriculumMapper.getTotalCurriculumCount();
	
	
		PagingBean pagingBean = new PagingBean(totalCurCount);
		HashMap<String,Object> map = new HashMap<String,Object>();
		map.put("acaNo", "1");
		map.put("start", pagingBean.getStartRowNumber());
		map.put("end", pagingBean.getEndRowNumber());
		map.put("pageNo", pagingBean.getNowPage());
		String pageno=(String) map.get("pageNo");
		if(pageno==null) {
			pagingBean = new PagingBean(totalCurCount);
		}else {
			pagingBean = new PagingBean(totalCurCount, Integer.parseInt(pageno));
		}
		System.out.println(map.get("acaNo"));
		System.out.println(map.get("start"));
		System.out.println(map.get("end"));
		System.out.println(map.get("pageNo"));

		
		List<CurriculumVO> curriculumList = curriculumMapper.listCurriculum(map);
		
		ListVO lvo = new ListVO();
		lvo.setCurriculumList(curriculumList);
		lvo.setPb(pagingBean);
		for (int i = 0; i < lvo.getCurriculumList().size(); i++) {
			System.out.println(lvo.getCurriculumList().get(i));
		}*/
		/*
		 * String address="판교"; CurriculumVO curriculmVO = {};
		 * curriculumMapper.registerCurriculum(curriculmVO));
		 */

	}
}

package org.kosta.academy;

import java.util.HashMap;
import java.util.List;

import org.junit.Test;
import org.junit.runner.RunWith;
import org.kosta.academy.model.mapper.AcademyMapper;
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
	@Autowired
	private AcademyMapper academyMapper;
	@Test
	public void test() {
	/*	AcademyVO academyVO = academyMapper.detailAcademy("1");
		CurriculumVO curriculumVO = new CurriculumVO();
//		curriculumVO.setCurNo("7");
		curriculumVO.setAcademyVO(academyVO);
		curriculumVO.setCurName("n");
		curriculumVO.setCurLecturer("n");
		curriculumVO.setLimitMem("5");
		curriculumVO.setCurContent("c");
		curriculumVO.setCurTextbook("t");
		curriculumMapper.registerCurriculum(curriculumVO);
		*/
/*		curriculumVO = ("7",academyVO,"n","n","5","c","t");
*/		/*CurriculumVO curriculumVO = new CurriculumVO();
		
		curriculumMapper.write(curriculumVO);
		*/
		
		//리스트 상세
		/*String curNo="1";
		CurriculumVO detailCurriculum = curriculumMapper.detailCurriculum(curNo);
		System.out.println(detailCurriculum);
*/		
		
	//리스트 출력
	 int totalCurCount = curriculumMapper.getTotalCurriculumCount();
	
	
		PagingBean pagingBean = new PagingBean(totalCurCount);
		HashMap<String,Object> map = new HashMap<String,Object>();
		map.put("acaNo", "1");
		map.put("start", pagingBean.getStartRowNumber());
		map.put("end", pagingBean.getEndRowNumber());
		//map.put("pageNo", pagingBean.getNowPage());
		String pageno=null;
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
		}
		/*
		 * String address="판교"; CurriculumVO curriculmVO = {};
		 * curriculumMapper.registerCurriculum(curriculmVO));
		 */

	}

}

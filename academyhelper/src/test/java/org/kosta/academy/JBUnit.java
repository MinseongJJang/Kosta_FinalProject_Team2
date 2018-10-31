package org.kosta.academy;

import java.util.HashMap;
import java.util.List;

import javax.annotation.Resource;

import org.junit.Test;
import org.junit.runner.RunWith;
import org.kosta.academy.model.mapper.AcademyMapper;
import org.kosta.academy.model.mapper.SearchMapper;
import org.kosta.academy.model.service.AcademyService;
import org.kosta.academy.model.service.PagingBean;
import org.kosta.academy.model.vo.CurriculumVO;
import org.kosta.academy.model.vo.ListVO;
import org.kosta.academy.model.vo.LocationVO;
import org.springframework.test.context.ContextConfiguration;
import org.springframework.test.context.junit4.SpringJUnit4ClassRunner;

@RunWith(SpringJUnit4ClassRunner.class)
@ContextConfiguration(locations= {"file:src/main/webapp/WEB-INF/spring-model.xml","file:src/main/webapp/WEB-INF/spring-security.xml"})
public class JBUnit {
	@Resource
	AcademyMapper academyMapper;
	@Resource
	AcademyService academyService;
	@Resource
	SearchMapper searchMapper;
	@Test
	public void test() {
		//기관정보등록
		/*
		UserVO userVO = new UserVO();
		userVO.setUsrId("아이디");
		AcademyVO academyVO = new AcademyVO();
		academyVO.setAcaName("학원명9");
		academyVO.setAcaAddr("주소");
		academyVO.setAcaTel("010");
		academyVO.setUserVO(userVO);
		System.out.println(academyVO);
		academyMapper.registerAcademy(academyVO);
		*/
		
		//기관정보목록
		/*
		List<AcademyVO> academyList = academyMapper.listAcademy(null);
		ListVO lvo = new ListVO();
		lvo.setAcademyList(academyList);
		for(int i=0; i<lvo.getAcademyList().size();i++) {
			System.out.println(lvo.getAcademyList().get(i));
		}
		*/
		//페이징 확인
		/*
		ListVO lvo = academyService.listAcademy("1");
		System.out.println(lvo.getAcademyList());
		*/
		//기관상세정보
		/*
		AcademyVO acdemyVO = academyMapper.detailAcademy("id");
		System.out.println(acdemyVO);
		*/
		//기관정보수정
		/*
		AcademyVO vo = new AcademyVO();
		vo.setAcaTel("111");
		academyMapper.updateAcademy(vo);
		*/
		//기관정보삭제
		//academyMapper.deleteAcademy("8");
		//기관 검색
		/*CurriculumVO cvo = new CurriculumVO();
		PagingBean pagingBean = null;
		cvo.setCurName("ja");
		int totalCurCount = searchMapper.getTotalListAcaCount(cvo.getCurName());
		HashMap<String, Object> map =new HashMap<String, Object>();
		pagingBean = new PagingBean(totalCurCount);
		map.put("curName", cvo.getCurName());
		map.put("startRowNumber", pagingBean.getStartRowNumber());
		map.put("endRowNumber", pagingBean.getEndRowNumber());
		List<CurriculumVO> searchAcademyList = searchMapper.academySearch(map);
		ListVO lvo = new ListVO();
		lvo.setCurriculumList(searchAcademyList);
		for(int i=0; i<lvo.getCurriculumList().size();i++) {
			System.out.println(lvo.getCurriculumList().get(i));
		}*/
		List<LocationVO> list = searchMapper.provinceList();
		System.out.println(list);
	}
}

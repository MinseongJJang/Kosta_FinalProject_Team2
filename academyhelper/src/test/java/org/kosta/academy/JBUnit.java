package org.kosta.academy;

import java.util.List;

import javax.annotation.Resource;

import org.junit.Test;
import org.junit.runner.RunWith;
import org.kosta.academy.model.mapper.AcademyMapper;
import org.kosta.academy.model.vo.AcademyVO;
import org.kosta.academy.model.vo.ListVO;
import org.springframework.test.context.ContextConfiguration;
import org.springframework.test.context.junit4.SpringJUnit4ClassRunner;

@RunWith(SpringJUnit4ClassRunner.class)
@ContextConfiguration(locations= {"file:src/main/webapp/WEB-INF/spring-model.xml","file:src/main/webapp/WEB-INF/spring-security.xml"})
public class JBUnit {
	@Resource
	AcademyMapper academyMapper;
	@Test
	public void test() {
		//기관정보등록
		/*
		UserVO userVO = new UserVO();
		userVO.setUsrId("아이디");
		AcademyVO academyVO = new AcademyVO();
		academyVO.setAcaName("학원명");
		academyVO.setAcaAddr("주소");
		academyVO.setAcaTel("010");
		academyVO.setUserVO(userVO);
		System.out.println(academyVO);
		academyMapper.registerAcademy(academyVO);
		*/
		
		//기관정보목록
		List<AcademyVO> academyList = academyMapper.listAcademy();
		ListVO lvo = new ListVO();
		lvo.setAcademyList(academyList);
		for(int i=0; i<lvo.getAcademyList().size();i++) {
			System.out.println(lvo.getAcademyList().get(i));
		}
	}
}

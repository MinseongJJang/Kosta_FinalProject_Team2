package org.kosta.academy;

import javax.annotation.Resource;

import org.junit.Test;
import org.junit.runner.RunWith;
import org.kosta.academy.model.mapper.UserMapper;
import org.springframework.test.context.ContextConfiguration;
import org.springframework.test.context.junit4.SpringJUnit4ClassRunner;

@RunWith(SpringJUnit4ClassRunner.class)
@ContextConfiguration(locations= {"file:src/main/webapp/WEB-INF/spring-model.xml","file:src/main/webapp/WEB-INF/spring-security.xml"})
public class MSUnit {
	//member 단위 테스트
	@Resource
	UserMapper mapper;
	@Test
	public void test() {
		/*UserVO vo = mapper.findUserById("admin");
		System.out.println(vo);*/
		/*List<Authority> list = mapper.selectAuthorityById("admin");
		System.out.println(list);*/
		
	}
}

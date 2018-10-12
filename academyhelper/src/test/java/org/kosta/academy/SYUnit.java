package org.kosta.academy;

import javax.annotation.Resource;

import org.junit.Test;
import org.junit.runner.RunWith;
import org.kosta.academy.model.mapper.UserMapper;
import org.kosta.academy.model.service.UserService;
import org.kosta.academy.model.vo.UserVO;
import org.springframework.test.context.ContextConfiguration;
import org.springframework.test.context.junit4.SpringJUnit4ClassRunner;

@RunWith(SpringJUnit4ClassRunner.class)
@ContextConfiguration(locations= {"file:src/main/webapp/WEB-INF/spring-model.xml","file:src/main/webapp/WEB-INF/spring-security.xml"})
public class SYUnit {
	@Resource
	private UserMapper userMapper;
	@Resource
	private UserService userService;
@Test
	public void test() {
		String usrId="java";
		UserVO userVO=userService.getUserInfo(usrId);
		System.out.println(userVO);
		
	}
}

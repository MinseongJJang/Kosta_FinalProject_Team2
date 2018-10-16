package org.kosta.academy;

import javax.annotation.Resource;

import org.junit.Test;
import org.junit.runner.RunWith;
import org.kosta.academy.model.mapper.UserMapper;
import org.kosta.academy.model.service.FAQAndNotiAndSugService;
import org.kosta.academy.model.service.UserService;
import org.kosta.academy.model.vo.SuggestionPostVO;
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
	@Resource
	private FAQAndNotiAndSugService fnsService;
@Test
	public void test() {
		/*String usrId="java";
		UserVO userVO=userService.getUserInfo(usrId);
		System.out.println(userVO);*/
		/*String pageNo="1";
		ListVO list=userService.userList(pageNo);
		
			System.out.println(list.getUserList());*/
	//SuggestionPostVO suggestionPostVO = new SuggestionPostVO("하이", "이하이", "2018", new UserVO("java"));
	//suggestionPostVO.setSugNo("1");
	//suggestionPostVO.setSugTitle("하이");
	//suggestionPostVO.setSugContent("이하이");
	//suggestionPostVO.setSugRegdate("2018");
	/*System.out.println(suggestionPostVO);
	System.out.println(suggestionPostVO);
	fnsService.registerSuggestionPost(suggestionPostVO);*/
	
	}
}

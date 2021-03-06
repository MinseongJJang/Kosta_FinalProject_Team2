package org.kosta.academy.controller;

import java.util.List;

import javax.annotation.Resource;

import org.kosta.academy.model.service.AcademyService;
import org.kosta.academy.model.vo.CurriculumVO;
import org.kosta.academy.model.vo.ListVO;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;

@Controller
public class HomeController {
	@Resource
	private AcademyService academyService;
	@RequestMapping("home.do")
	public String home(Model model) {
		ListVO academy = academyService.allListAcademy();
		model.addAttribute("academy",academy);
		List<CurriculumVO> list=academyService.bestCurriculumList();
		System.out.println(list);
		model.addAttribute("list",list);
		return "home.tiles";
	}
/*	@RequestMapping("{viewName}.do")
	public String showView(@PathVariable String viewName){
		//System.out.println("1.@PathVariable:"+viewName);
		return viewName+".tiles";
	}*/
	/*@RequestMapping("{dirName}/{viewName}.do")
	public String showView(@PathVariable String dirName,@PathVariable String viewName){
		//System.out.println("2.@PathVariable:"+dirName+"/"+viewName);
		return dirName+"/"+viewName+".tiles";
	}	*/
	/*	spring-security.xml에 아래와 같이 설정되어 있음 
		로그인 하였으나 권한이 없는 요청을 하였을 경우 보여지는 페이지를 지정  
		<security:access-denied-handler error-page="/accessDeniedView.do"/>
	 */
	@RequestMapping("accessDeniedView.do")
	public String accessDeniedView() {
		return "auth/accessDeniedView";
	}
	
}

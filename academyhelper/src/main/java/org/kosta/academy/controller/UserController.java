package org.kosta.academy.controller;

import javax.annotation.Resource;

import org.kosta.academy.model.service.UserService;
import org.kosta.academy.model.vo.AcaUserVO;
import org.kosta.academy.model.vo.ListVO;
import org.kosta.academy.model.vo.UserVO;
import org.springframework.security.access.annotation.Secured;
import org.springframework.security.core.context.SecurityContextHolder;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.servlet.ModelAndView;

@Controller
public class UserController {
	@Resource
	private UserService userService;
	
	@RequestMapping("findUserById.do")
	public ModelAndView findUserById(String Id) {
		UserVO vo = userService.findUserById(Id);
		if (vo == null) {
			return new ModelAndView("user/loginForm.do");
		}
		else {
			return new ModelAndView("home.do","vo",vo);
		}
	}
	@RequestMapping("login_fail.do")
	public String loginFail() {
		return "redirect:loginForm.do";
	}
	@RequestMapping("loginForm.do")
	public String updateForm() {
		return "user/login_form.tiles";
	}
	
	@RequestMapping(value = "registerUser.do", method = RequestMethod.POST)
	public String register(UserVO userVO) {
		userService.registerUser(userVO);
		return "redirect:home.do";
	}
	@PostMapping("acaRegisterUser.do")
	public String acaRegister(AcaUserVO acaUserVO) {
		userService.registerUser(acaUserVO);
		return "redirect:home.do";
	}
	

	@PostMapping("idcheckAjax.do")
	@ResponseBody
	public String idcheckAjax(String usrId) {
		return userService.idcheck(usrId);
	}
	@Secured("ROLE_USER")
	@RequestMapping("userInfo.do")
	public ModelAndView userInfo(String usrId) {
		AcaUserVO acaUserVO=userService.getUserInfo(usrId);
		return new ModelAndView("user/user_info.tiles","acaUserVO",acaUserVO);
	}
	@Secured("ROLE_USER")
	@RequestMapping("updateUserForm.do")
	public String updateUserForm() {
		return "user/update_user_form.tiles";
	}
	@Secured("ROLE_USER")
	@PostMapping("updateUser.do")
	public ModelAndView updateUser(UserVO userVO) {
		UserVO mvo=(UserVO) SecurityContextHolder.getContext().getAuthentication().getPrincipal();
		userService.updateUser(userVO);
		mvo.setUsrPass(userVO.getUsrPass());
		mvo.setUsrName(userVO.getUsrName());
		mvo.setUsrAddr(userVO.getUsrAddr());
		mvo.setNickname(userVO.getNickname());
		mvo.setUsrEmail(userVO.getUsrEmail());
		mvo.setUsrTel(userVO.getUsrTel());
		return new ModelAndView("redirect:userInfo.do","usrId",mvo.getUsrId());
	}
	@Secured("ROLE_USER")
	@PostMapping("deleteUser.do")
	public String deleteUser() {
		UserVO mvo=(UserVO) SecurityContextHolder.getContext().getAuthentication().getPrincipal();
		String usrId=mvo.getUsrId();
		userService.deleteUser(usrId);
		SecurityContextHolder.clearContext();
		return "redirect:home.do";
	}
	@RequestMapping("findUserId")
	public ModelAndView findUserIdByNameAndTel(UserVO userVO) {
		String usrId=userService.findUserIdByNameAndTel(userVO);
		return new ModelAndView("find_user_id.tiles","usrId",usrId);
	}
	@RequestMapping("findUserPass")
	public ModelAndView findUserPasswordByIdAndEmail(UserVO userVO) {
		String usrPass=userService.findUserIdByNameAndTel(userVO);
		return new ModelAndView("find_user_pass.tiles","usrPass",usrPass);
	}
	@Secured("ROLE_ADMIN")
	@RequestMapping("adminMain.do")
	public String adminMain() {
		return "admin/admin_main.tiles";
	}
	@Secured("ROLE_ADMIN")
	@RequestMapping("userList.do")
	public String userList(String pageNo, Model model) {
		ListVO list=userService.userList(pageNo);
		model.addAttribute("list",list.getUserList());
		model.addAttribute("pb",list.getPb());
		return "admin/user_list.tiles";
	}
}

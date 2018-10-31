package org.kosta.academy.controller;

import java.net.Authenticator;

import javax.annotation.Resource;
import javax.servlet.http.HttpServletResponse;

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
public class UserController extends Authenticator {
	@Resource
	private UserService userService;

	@RequestMapping("findUserById.do")
	public ModelAndView findUserById(String Id) {
		UserVO vo = userService.findUserById(Id);
		if (vo == null) {
			return new ModelAndView("user/loginForm.do");
		} else {
			return new ModelAndView("home.do", "vo", vo);
		}
	}

	@RequestMapping("findIdForm.do")
	public ModelAndView findIdForm() {
		return new ModelAndView("user/find_id_form.tiles");
	}
	
	@PostMapping("findId.do")
	public String findId(UserVO userVO, Model model) {
		String id = userService.findId(userVO);
		model.addAttribute("id", id);
		if (id == null) {
			return "user/find_id_fail.tiles";
		} else {
			return "user/find_id_ok.tiles";
		}
	}
	@RequestMapping("findPasswordForm.do")
	public ModelAndView findPasswordForm() {
		return new ModelAndView("user/find_password_form.tiles");
	}

	// 비밀번호 찾기
	@PostMapping("find_pw.do")
	public void find_pw(UserVO userVO, HttpServletResponse response) throws Exception{
		userService.find_pw(response, userVO);
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
		UserVO userVO = userService.getUserInfo(usrId);
		return new ModelAndView("user/user_info.tiles", "userVO", userVO);
	}

	@Secured("ROLE_ACADEMY")
	@RequestMapping("acaUserInfo.do")
	public ModelAndView acaUserInfo(String usrId) {
		AcaUserVO acaUserVO = userService.getAcaUserInfo(usrId);
		return new ModelAndView("user/aca_user_info.tiles", "acaUserVO", acaUserVO);
	}

	@Secured("ROLE_USER")
	@RequestMapping("updateUserForm.do")
	public String updateUserForm() {
		return "user/update_user_form.tiles";
	}

	@Secured("ROLE_USER")
	@PostMapping("updateUser.do")
	public ModelAndView updateUser(UserVO userVO) {
		UserVO mvo = (UserVO) SecurityContextHolder.getContext().getAuthentication().getPrincipal();
		userService.updateUser(userVO);
		mvo.setUsrPass(userVO.getUsrPass());
		mvo.setUsrName(userVO.getUsrName());
		mvo.setUsrAddr(userVO.getUsrAddr());
		mvo.setNickname(userVO.getNickname());
		mvo.setUsrEmail(userVO.getUsrEmail());
		mvo.setUsrTel(userVO.getUsrTel());
		return new ModelAndView("redirect:userInfo.do", "usrId", mvo.getUsrId());
	}

	@Secured("ROLE_USER")
	@PostMapping("deleteUser.do")
	public String deleteUser() {
		UserVO mvo = (UserVO) SecurityContextHolder.getContext().getAuthentication().getPrincipal();
		String usrId = mvo.getUsrId();
		userService.deleteUser(usrId);
		SecurityContextHolder.clearContext();
		return "redirect:home.do";
	}

	@Secured("ROLE_ADMIN")
	@RequestMapping("adminMain.do")
	public String adminMain() {
		return "admin/admin_main.tiles";
	}

	@Secured("ROLE_ADMIN")
	@RequestMapping("userList.do")
	public String userList(String pageNo, Model model) {
		ListVO list = userService.userList(pageNo);
		model.addAttribute("list", list.getUserList());
		model.addAttribute("pb", list.getPb());
		return "user/user_list.tiles";
	}
	@RequestMapping("registerForm.do")
	public String registerForm() {
		return "user/register_form.tiles";
	}
	@RequestMapping("acaRegisterForm.do")
	public String acaRegisterForm() {
		return "user/aca_register_form.tiles";
	}
	@ResponseBody
	@PostMapping("loginCheck.do")
	public int loginCheck(UserVO userVO) {
		int loginCheck = userService.loginCheck(userVO);
		return loginCheck;
	}

	
}

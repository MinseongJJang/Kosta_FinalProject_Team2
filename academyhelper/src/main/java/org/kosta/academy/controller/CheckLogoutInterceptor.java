package org.kosta.academy.controller;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.apache.commons.logging.Log;
import org.apache.commons.logging.impl.SLF4JLogFactory;
import org.kosta.academy.model.vo.UserVO;
import org.springframework.security.core.context.SecurityContextHolder;
import org.springframework.web.servlet.handler.HandlerInterceptorAdapter;

public class CheckLogoutInterceptor extends HandlerInterceptorAdapter{
	
	private Log log = SLF4JLogFactory.getLog(getClass());
	@Override
	public boolean preHandle(HttpServletRequest request, HttpServletResponse response, Object handler)
			throws Exception {
		UserVO user = (UserVO)SecurityContextHolder.getContext().getAuthentication().getPrincipal();
		log.warn("["+user.getUsrId()+","+user.getUsrName()+"]님 로그아웃");
		return true;
	}
}

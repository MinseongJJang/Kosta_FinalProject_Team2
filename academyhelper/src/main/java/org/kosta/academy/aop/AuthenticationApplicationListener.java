package org.kosta.academy.aop;

import java.util.List;

import org.apache.commons.logging.Log;
import org.apache.commons.logging.impl.SLF4JLogFactory;
import org.kosta.academy.model.vo.UserVO;
import org.springframework.context.event.EventListener;
import org.springframework.security.authentication.AnonymousAuthenticationToken;
import org.springframework.security.core.Authentication;
import org.springframework.security.core.context.SecurityContext;
import org.springframework.security.core.session.SessionDestroyedEvent;
import org.springframework.stereotype.Component;

@Component
public class AuthenticationApplicationListener {
	private Log log = SLF4JLogFactory.getLog(getClass());
	
	@EventListener
	public void handleSessionDestroyedEvent(SessionDestroyedEvent event) {
		List<SecurityContext> lstSecurityContext = event.getSecurityContexts();
		for (SecurityContext securityContext : lstSecurityContext) {
			Authentication auth = securityContext.getAuthentication();
			if (auth == null || !auth.isAuthenticated() || auth instanceof AnonymousAuthenticationToken) {
				return;
			}
			UserVO user = (UserVO) auth.getPrincipal();
			log.warn("[" + user.getUsrId() + "," + user.getUsrName() + "]님 로그아웃");
		}
	}
}
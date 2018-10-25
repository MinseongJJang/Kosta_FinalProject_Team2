package org.kosta.academy.aop;

import org.apache.commons.logging.Log;
import org.apache.commons.logging.impl.SLF4JLogFactory;
import org.aspectj.lang.ProceedingJoinPoint;
import org.aspectj.lang.annotation.Around;
import org.aspectj.lang.annotation.Aspect;
import org.kosta.academy.model.vo.UserVO;
import org.springframework.security.core.Authentication;
import org.springframework.stereotype.Component;

/*
 * 사용자의 행위를 Log로 남겨주는
 * aop class
 */
@Component
@Aspect
public class CommonLoggingAspect {
	UserVO user = null;
	private Log log = SLF4JLogFactory.getLog(getClass());
	//|| execution(public * org.kosta.academy.security *(..))
	//@Around("execution(public java.util.List org.kosta..*Service.find*List*(..))")
	@Around("execution(public * org.kosta.academy.model.service.*.*(..)) or execution(public * org.kosta.academy.security.*.authenticate(..))")
	public Object aroundLogging(ProceedingJoinPoint point) throws Throwable{
		Object retValue=null;		
		
		long start = System.currentTimeMillis();
		retValue=point.proceed(); //실제 대상 메서드 호출 
		long end = System.currentTimeMillis();
		if(point.getSignature().getName().equals("authenticate")) {
			Authentication auth = (Authentication)retValue;
			user = (UserVO) auth.getPrincipal();
			System.out.println("authenticate 결과 :" + user);
			log.warn("["+user.getUsrId()+","+user.getUsrName()+"]님 로그인");
		}
		if(user!=null) {
			log.warn("["+user.getUsrId()+","+user.getUsrName()+"님 ]" + point.getSignature().getName()+" 실행 , 실행시간 : " + (end-start));
		}
		return retValue;
	
	}
}

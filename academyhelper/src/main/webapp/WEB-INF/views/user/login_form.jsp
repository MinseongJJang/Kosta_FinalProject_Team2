<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%-- spring security custom tag를 사용하기 위한 선언 --%>
<%@taglib prefix="sec"
	uri="http://www.springframework.org/security/tags"%>

	<form action="${pageContext.request.contextPath}/login.do"
		method="post" id="loginForm">
		<%-- Spring Security에서는 해킹방지를	 위해
		 post방식 정보전송일때는 반드시 csrf 토큰을 삽입해야 전송이 된다
		 아래 security tag를 쓰면 hidden tag 가 자동 생성된다 
		   --%>
		<sec:csrfInput/><%-- csrf 토큰 --%>
		아이디 <input type="text" name="usrId" size="10"><br>
		패스워드 <input type="password" name="usrPass" size="10"><br>
		<input type="submit" value="로그인">
	</form>
	<a href="${pageContext.request.contextPath}/user/registerForm.do">회원가입</a>
	<br>







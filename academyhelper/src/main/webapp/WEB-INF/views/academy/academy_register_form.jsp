<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@taglib prefix="sec"  uri="http://www.springframework.org/security/tags"%> 
<sec:authorize access="hasRole('ROLE_ADMIN')">
<sec:authentication var="mvo" property="principal" />  
학원등록(관리자만 가능 추가)
<form action = "registerAcademy.do" method="post">
<sec:csrfInput/>
학원이름<input type="text" name ="acaName" required="required"><br>
학원주소<input type="text" name ="acaAddr" required="required"><br>	
학원전화번호<input type="text" name="acaTel" required="required">
<input type="hidden"  name="userVO.usrId" value="${mvo.usrId}">
<input type="submit" value="학원등록">
</form>
</sec:authorize>




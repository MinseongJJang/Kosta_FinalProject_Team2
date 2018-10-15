<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
 <%-- spring security custom tag를 사용하기 위한 선언 --%>
<%@taglib prefix="sec"  uri="http://www.springframework.org/security/tags"%> 
<sec:authorize access="hasRole('ROLE_ADMIN')">
<sec:authentication var="mvo" property="principal" />  
 ${mvo.usrName} 관리자님  admin 메인화면입니다. 
 <a href="userList.do">회원 목록</a>
</sec:authorize>
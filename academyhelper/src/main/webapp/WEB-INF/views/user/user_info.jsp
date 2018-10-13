<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    <%@ taglib prefix="sec" uri="http://www.springframework.org/security/tags" %>
    <%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<script type="text/javascript">
$(document).ready(function(){
	$("#deleteForm").submit(function(){
		if(confirm("정말로 탈퇴하시겠습니까?")==false){
			return false;
		}else{
			return true;
		}
	});
});
</script>
<sec:authorize access="hasRole('ROLE_USER')">
    <div class="col-sm-2" ></div>
    <div class="col-sm-8">
<table  class="table">
	<tr>
			<td>ID</td><td>${requestScope.userVO.usrId}</td>
	</tr>
	<tr>
			<td>이름</td><td>${requestScope.userVO.usrName}</td>
	</tr>
	<tr>
			<td>주소</td><td>${requestScope.userVO.usrAddr}</td>
	</tr>
	<tr>
			<td>닉네임</td><td>${requestScope.userVO.nickname}</td>
	</tr>
	<tr>
			<td>생년월일</td><td>${requestScope.userVO.birthday}</td>
	</tr>
	<tr>
			<td>가입일</td><td>${requestScope.userVO.usrRegdate}</td>
	</tr>
	<tr>
			<td>이메일</td><td>${requestScope.userVO.usrEmail}</td>
	</tr>
	<tr>
			<td>연락처</td><td>${requestScope.userVO.usrTel}</td>
	</tr>
		
		<tr>
			<td colspan="5" class="btnArea">
			<sec:authorize access="hasRole('ROLE_USER')">
			<form action="updateUserForm.do">
			 <button type="submit">회원 정보 수정</button>			
			 </form>
			 </sec:authorize>
			 </td>
			 <td>
			 <sec:authorize access="hasRole('ROLE_USER')">
			  <form action="deleteUser.do" id="deleteForm" method="post">
			  <sec:csrfInput/>
			 <button type="submit">회원 탈퇴</button>			
			 </form>
			 </sec:authorize>
			 </td>	 
			 </tr>
		
	</table>
    </div>
    <div class="col-sm-2" ></div>
</sec:authorize>
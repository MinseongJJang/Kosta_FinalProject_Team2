<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
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

<div class="container" >
	<div class="row">
		<div class="col-sm-1"></div>
		<div class="col-sm-10 text-center" 	style="margin-top: 100px; padding-bottom: 100px;">
			<div style="margin-top: 100px; text-align:center;" align="center">
				<!-- 일반 회원 정보 -->
				<sec:authorize access="hasRole('ROLE_USER')">
				<table class="table table-hover">
				   <thead style="text-align:center;">
				   		<tr>
				   			<th colspan="2" align="center">회원 정보</th>
				   		</tr>
				   </thead>
				   <tbody>
				   		<tr>
				   			<td style="width:30%">아이디</td>
				   			<td>${requestScope.userVO.usrId}</td>
				   		</tr>
				   		<tr>
				   			<td>이름</td>
				   			<td>${requestScope.userVO.usrName}</td>
				   		</tr>
				   		<tr>
				   			<td>주소</td>
				   			<td>${requestScope.userVO.usrAddr}</td>
				   		<tr>
				   		<tr>
				   			<td>닉네임</td>
				   			<td>${requestScope.userVO.nickname}</td>
				   		<tr>
				   		<tr>
				   			<td>생년월일</td>
				   			<td>${requestScope.userVO.birthday}</td>
				   		<tr>
				   		<tr>
				   			<td>가입일</td>
				   			<td>${requestScope.userVO.usrRegdate}</td>
				   		<tr>
				   		<tr>
				   			<td>이메일</td>
				   			<td>${requestScope.userVO.usrEmail}</td>
				   		<tr>
				   		<tr>
				   			<td>연락처</td>
				   			<td>${requestScope.userVO.usrTel}</td>
				   		<tr>
				   </tbody>
				   <tfoot>
			   			<tr>
			   				<td colspan="2" align="center">
			   					<form action="updateUserForm.do">
			   						<sec:csrfInput/>
			   						<button type="submit" class="aca-btn">회원 정보 수정</button>			
					 			</form>
			   					<form action="deleteUser.do" id="deleteForm" method="post">
								 	<sec:csrfInput/>
								 	<button type="submit" class="aca-btn">회원 탈퇴</button>			
								 </form>
			   				</td>
			   			</tr>
				   </tfoot>
				</table>
				</sec:authorize>
			</div>
		</div>
		<div class="col-sm-1"></div>
	</div>
</div>
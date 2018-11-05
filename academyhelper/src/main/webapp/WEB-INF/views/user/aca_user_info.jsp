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
		<div class="col-sm-10 text-center">
			<div style="margin-top: 100px; text-align:center;" align="center">
				<!-- 학원 회원 정보 -->
				<sec:authorize access="hasRole('ROLE_USER') and hasRole('ROLE_ACADEMY')">
				<table class="table table-hover">
				   <thead style="text-align:center;">
				   		<tr>
				   			<th>학원 회원 정보</th>
				   		</tr>
				   </thead>
				   <tbody>
				   		<tr>
				   			<td width="30%">아이디</td>
				   			<td>${requestScope.acaUserVO.userVO.usrId}</td>
				   		</tr>
				   		<tr>
				   			<td>이름</td>
				   			<td>${requestScope.acaUserVO.userVO.usrName}</td>
				   		</tr>
				   		<tr>
				   			<td>주소</td>
				   			<td>${requestScope.acaUserVO.userVO.usrAddr}</td>
				   		<tr>
				   		<tr>
				   			<td>닉네임</td>
				   			<td>${requestScope.acaUserVO.userVO.nickname}</td>
				   		<tr>
				   		<tr>
				   			<td>생년월일</td>
				   			<td>${requestScope.acaUserVO.userVO.birthday}</td>
				   		<tr>
				   		<tr>
				   			<td>가입일</td>
				   			<td>${requestScope.acaUserVO.userVO.usrRegdate}</td>
				   		<tr>
				   		<tr>
				   			<td>이메일</td>
				   			<td>${requestScope.acaUserVO.userVO.usrEmail}</td>
				   		<tr>
				   		<tr>
				   			<td>연락처</td>
				   			<td>${requestScope.acaUserVO.userVO.usrTel}</td>
				   		<tr>
				   		<tr>
				   			<td>사업자번호</td>
				   			<td>${requestScope.acaUserVO.busiRegNum}</td>
				   		<tr><tr>
				   			<td>기관명</td>
				   			<td>${requestScope.acaUserVO.acaName}</td>
				   		<tr><tr>
				   			<td>기관주소</td>
				   			<td>${requestScope.acaUserVO.acaAddr}</td>
				   		<tr><tr>
				   			<td>기관연락처</td>
				   			<td>${requestScope.acaUserVO.acaTel}</td>
				   		<tr>
				   </tbody>
				   <tfoot>
			   			<tr>
			   				<td colspan="2" align="right">
			   				<button type="submit" class="aca-btn" form="updateForm">회원 정보 수정</button>
			   				<button form="deleteForm" type="submit" class="aca-btn">회원 탈퇴</button>		
			   					<form action="updateUserForm.do" id="updateForm">
			   						<sec:csrfInput/>			
					 			</form>
			   					<form action="deleteUser.do" id="deleteForm" method="post">
								 	<sec:csrfInput/>	
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
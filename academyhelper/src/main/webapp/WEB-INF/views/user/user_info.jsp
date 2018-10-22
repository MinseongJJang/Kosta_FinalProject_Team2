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
				<sec:authorize access="hasRole('ROLE_USER') and !hasRole('ROLE_ACADEMY')">
				<table class="table table-hover">
				   <thead style="text-align:center;">
				   		<tr>
				   			<th colspan="2" align="center">회원 정보</th>
				   		</tr>
				   		<tr>
							<td style="border-top:0px"></td>
						</tr>
				   </thead>
				   <tbody>
				   		<tr>
				   			<th style="width:30%">아이디</th>
				   			<td>${requestScope.acaUserVO.userVO.usrId}</td>
				   		</tr>
				   		<tr>
				   			<th>이름</th>
				   			<td>${requestScope.acaUserVO.userVO.usrName}</td>
				   		</tr>
				   		<tr>
				   			<th>주소</th>
				   			<td>${requestScope.acaUserVO.userVO.usrAddr}</td>
				   		<tr>
				   		<tr>
				   			<th>닉네임</th>
				   			<td>${requestScope.acaUserVO.userVO.nickname}</td>
				   		<tr>
				   		<tr>
				   			<th>생년월일</th>
				   			<td>${requestScope.acaUserVO.userVO.birthday}</td>
				   		<tr>
				   		<tr>
				   			<th>가입일</th>
				   			<td>${requestScope.acaUserVO.userVO.usrRegdate}</td>
				   		<tr>
				   		<tr>
				   			<th>이메일</th>
				   			<td>${requestScope.acaUserVO.userVO.usrEmail}</td>
				   		<tr>
				   		<tr>
				   			<th>연락처</th>
				   			<td>${requestScope.acaUserVO.userVO.usrTel}</td>
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
				<!-- 학원 회원 정보 -->
				<sec:authorize access="hasRole('ROLE_USER') and hasRole('ROLE_ACADEMY')">
				<table class="table table-hover">
				   <thead style="text-align:center;">
				   		<tr>
				   			<th>회원 정보</th>
				   		</tr>
				   		<tr>
							<td style="border-top:0px"></td>
						</tr>
				   </thead>
				   <tbody>
				   		<tr>
				   			<th width="30%">아이디</th>
				   			<td>${requestScope.acaUserVO.userVO.usrId}</td>
				   		</tr>
				   		<tr>
				   			<th>이름</th>
				   			<td>${requestScope.acaUserVO.userVO.usrName}</td>
				   		</tr>
				   		<tr>
				   			<th>주소</th>
				   			<td>${requestScope.acaUserVO.userVO.usrAddr}</td>
				   		<tr>
				   		<tr>
				   			<th>닉네임</th>
				   			<td>${requestScope.acaUserVO.userVO.nickname}</td>
				   		<tr>
				   		<tr>
				   			<th>생년월일</th>
				   			<td>${requestScope.acaUserVO.userVO.birthday}</td>
				   		<tr>
				   		<tr>
				   			<th>가입일</th>
				   			<td>${requestScope.acaUserVO.userVO.usrRegdate}</td>
				   		<tr>
				   		<tr>
				   			<th>이메일</th>
				   			<td>${requestScope.acaUserVO.userVO.usrEmail}</td>
				   		<tr>
				   		<tr>
				   			<th>연락처</th>
				   			<td>${requestScope.acaUserVO.userVO.usrTel}</td>
				   		<tr>
				   		<tr>
				   			<td></td>
				   			<td></td>
				   		<tr>
				   </tbody>
				   <tfoot>
			   			<tr>
			   				<td colspan="2" align="right">
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
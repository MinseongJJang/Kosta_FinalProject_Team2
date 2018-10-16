<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<meta charset="utf-8">
 <%@ taglib prefix="sec" uri="http://www.springframework.org/security/tags" %>
<script type="text/javascript">
$(document).ready(function(){
	$("#deleteAca").submit(function(){
		if(confirm("삭제하시겠습니까?")==false){
			return false;
		}else{
			return true;
		}
	});//submit
	$("#updateAca").submit(function(){
		
	});//click
});//ready

</script>
<div>
	<c:set var="de" value="${requestScope.acaDetail}" />
	<table>
		<tr>
			<td>학원번호</td>
			<td>${de.acaNo}</td>
		</tr>
		<tr>
			<td>학원이름</td>
			<td>${de.acaName}</td>
		</tr>
		<tr>
			<td>학원주소</td>
			<td>${de.acaAddr}</td>
		</tr>
		<tr>
			<td>학원전화번호</td>
			<td>${de.acaTel}</td>
		</tr>
		<tr>
			<td>이메일</td>
			<td>${de.userVO.usrEmail}</td>
		</tr>
		<tr>
			<td>전화번호</td>
			<td>${de.userVO.usrTel}</td>
		</tr>
		<tr>
			<td>닉네임</td>
			<td>${de.userVO.nickname}</td>
		</tr>
		<tr>
			<td>아이디</td>
			<td>${de.userVO.usrId}</td>
		</tr>
		<tr>
			<td colspan="2">시설 사진</td>
		</tr>
		<tr>
			<td colspan="2">위치 사진</td>
		</tr>
	</table>
	<sec:authorize access="hasRole('ROLE_ADMIN')">
	<c:set var="de" value="${requestScope.acaDetail}" />
	<form action="deleteAcademy.do" id="deleteAca" method="post">
	<sec:csrfInput/>
	<input type="hidden" name="acaNo" value="${de.acaNo}">
	<input type="submit" value="학원정보삭제">
	</form>
	</sec:authorize>
	
	<sec:authorize access="hasRole('ROLE_ADMIN')">
	<form action="academyUpdateForm.do" id="updateAca" method="post">
	<sec:csrfInput/>
	<input type="hidden" name ="acaNo" value="${de.acaNo}">
	<input type="hidden" name ="acaName" value="${de.acaName}">
	<input type="hidden" name ="acaAddr" value="${de.acaAddr}">
	<input type="hidden" name="acaTel" value="${de.acaTel}">
	<input type="hidden" name =userVO.usrEmail value="${de.userVO.usrEmail}">
	<input type="hidden" name ="userVO.usrTel" value="${de.userVO.usrTel}">
	<input type="hidden" name ="userVO.nickname" value="${de.userVO.nickname}">
	<input type="hidden" name ="userVO.usrId" value="${de.userVO.usrId}">
	<input type="submit" value="수정하기">	
	</form>
	</sec:authorize>
</div>

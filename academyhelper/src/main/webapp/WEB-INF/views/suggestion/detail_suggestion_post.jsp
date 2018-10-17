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
	<c:set var="vo" value="${requestScope.vo}" />
	<table>
		<tr>
			<td>NO</td>
			<td>${vo.sugNo}</td>
		</tr>
		<tr>
			<td>제목</td>
			<td>${vo.sugTitle}</td>
		</tr>
		<tr>
			<td>내용</td>
			<td>${vo.sugContent}</td>
		</tr>
		<tr>
			<td>작성자</td>
			<td>${vo.userVO.usrName}</td>
		</tr>
		<tr>
			<td>작성일</td>
			<td>${vo.sugRegdate}</td>
		</tr>
	</table>
	<sec:authentication var="mvo" property="principal"/>
	<c:if test="${mvo.usrId==vo.userVO.usrId}">
	<sec:authorize access="hasRole('ROLE_USER')">
	<form action="deleteSuggestionPost.do" id="deleteAca" method="post">
	<sec:csrfInput/>
	<input type="hidden" name="sugNo" value="${vo.sugNo}">
	<input type="submit" value="삭제">
	</form>
	</sec:authorize>
	
	<sec:authorize access="hasRole('ROLE_USER')">
	<form action="updateSuggestionPostForm.do" id="updateAca" method="post">
	<sec:csrfInput/>
	<input type="hidden" name="sugNo" value="${vo.sugNo}">
	<input type="hidden" name="sugTitle" value="${vo.sugTitle}">
	<input type="hidden" name="sugContent" value="${vo.sugContent}">
	<input type="submit" value="수정">	
	</form>
	</sec:authorize>
	</c:if>
</div>

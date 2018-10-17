<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<meta charset="utf-8">
 <%@ taglib prefix="sec" uri="http://www.springframework.org/security/tags" %>
<script type="text/javascript">
$(document).ready(function(){
	$("#updateAca").submit(function(){
		if(confirm("수정하시겠습니까?")==false){
			return false;
		}else{
			return true;
		}
	});//submit
});//ready
</script>
	<sec:authorize access="hasRole('ROLE_USER')">
	<form action="updateSuggestionPost.do" id="updateAca" method="post">
	<c:set var="vo" value="${requestScope.vo}" />
	<table>
		<tr>
			<td>NO</td>
			<td>
			<input type="text" name="sugNo" value="${vo.sugNo}" required="required" readonly> 
			</td>
		</tr>
		<tr>
			<td>제목</td>
			<td>
			<input type="text" name="sugTitle" value="${vo.sugTitle}" required="required" > 
			</td>
		</tr>
		<tr>
			<td>내용</td>
			<td>
			<input type="text" name="sugContent" value="${vo.sugContent}" required="required" > 
			</td>
		</tr>
		
	</table>
	<sec:csrfInput/>
	<input type="submit" value="수정">
	</form>
	</sec:authorize>

<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="sec"
	uri="http://www.springframework.org/security/tags"%>
<script type="text/javascript">
$(document).ready(function(){
	$("#deleteForm").submit(function(){
		if(confirm("삭제하시겠습니까?")==false){
			return false;
		}else{
			return true;
		}
	});//submit
	$("#updateForm").submit(function(){
		if(confirm("수정하시겠습니까?")==false){
			return false;
		}else{
			return true;
		}
	});//click
});//ready

</script>
	<table>
		<tr>
			<td>NO: ${requestScope.DetailCurriculum.curNo }</td>
			<td>과정이름: ${requestScope.DetailCurriculum.curName}</td>
			<td>강사명 : ${requestScope.DetailCurriculum.curLecturer}</td>
			<td>정원 : ${requestScope.DetailCurriculum.limitMem }</td>
			<td>과정이름: ${requestScope.DetailCurriculum.curTextbook}</td>
			<td>학원이름: ${requestScope.DetailCurriculum.academyVO.acaName}</td>
		</tr>
		<tr>
			<td colspan="5" class="content"><pre>${requestScope.DetailCurriculum.curContent}</pre>
			</td>
		</tr>
	</table>
		<sec:authorize access="hasRole('ROLE_ADMIN')">
	<button form="updateForm" type="submit">교육과정 수정하기</button>
	<form action="updateCurriculumForm.do" id="updateForm" method="post">
		<sec:csrfInput />
		<%-- csrf 토큰 --%>
		<input type="hidden" name="curNo"
			value="${requestScope.DetailCurriculum.curNo}">
	</form>
	<button form="deleteForm" type="submit">삭제</button>
	<form action="deleteCurriculum.do" id="deleteForm" method="post">
		<sec:csrfInput />
		<input type="hidden" name="curNo" value="${requestScope.DetailCurriculum.curNo}">
	</form>
		</sec:authorize>
	
	<a href="${pageContext.request.contextPath}/detailAcademy.do?acaNo=${requestScope.DetailCurriculum.academyVO.acaNo}">목록으로 돌아가기</a>
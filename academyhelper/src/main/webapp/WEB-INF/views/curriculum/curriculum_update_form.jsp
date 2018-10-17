<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="sec"
	uri="http://www.springframework.org/security/tags"%>

<form method="post" id="updateForm"
	action="${pageContext.request.contextPath}/updateCurriculum.do">
	<input type="hidden" name="curNo" value="${DetailCurriculum.curNo}">
	<sec:csrfInput />
	<%-- csrf 토큰 --%>

	<table class="table">
		<tr>
			<td>제목 &nbsp;&nbsp; <input type="text" name="curName"
				value="${DetailCurriculum.curName}" required="required">
			</td>
		</tr>
		<tr>
			<td>최대 수강인원 &nbsp;&nbsp; <input type="text" name="limitMem"
				value="${DetailCurriculum.limitMem}" required="required">
			</td>
		</tr>
		<tr>
			<td><textarea cols="90" rows="15" name="curContent"
					required="required">${DetailCurriculum.curContent }</textarea></td>
		</tr>
		<tr>
			<td>강의자 &nbsp;&nbsp; <input type="text" name="curLecturer"
				value="${DetailCurriculum.curLecturer}" required="required">
			</td>
		</tr>
		<tr>
			<td>교재 &nbsp;&nbsp; <input type="text" name="curTextbook"
				value="${DetailCurriculum.curTextbook}" required="required">
			</td>
		</tr>
	</table>
	<sec:authorize access="hasRole('ROLE_ADMIN')">
		<div class="btnArea">
			<button type="submit" class="btn">수정</button>
			<button type="reset" class="btn">취소</button>
		</div>
	</sec:authorize>
</form>
</body>
</html>
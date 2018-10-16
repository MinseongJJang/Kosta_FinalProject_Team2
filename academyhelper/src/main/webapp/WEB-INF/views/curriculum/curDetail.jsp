<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html>
<html lang="en">
<head>
<meta charset="utf-8">
<title>교육과정 상세</title>
</head>
<body>
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
		<tr>
			<%-- <td colspan="5" class="btnArea"><c:if
								test="${requestScope.pvo.memberVO.id==sessionScope.mvo.id}">
								<button form="deleteForm" type="submit">삭제</button>
								<button form="updateForm" type="submit">수정</button>
								<form action="deletePost.do" id="deleteForm" method="post">
									<input type="hidden" name="no" value="${requestScope.pvo.no}">
								</form>
								<form action="updateView.do" id="updateForm" method="post">
									<input type="hidden" name="no" value="${requestScope.pvo.no}">
								</form>
							</c:if></td> --%>
		</tr>
	</table>
</body>
</html>
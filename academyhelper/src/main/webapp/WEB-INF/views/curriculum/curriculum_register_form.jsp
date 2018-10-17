<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="sec"
	uri="http://www.springframework.org/security/tags"%>
	<sec:authorize access="hasRole('ROLE_ADMIN')">
	<form action="${pageContext.request.contextPath}/registerCurriculum.do"
		method="post" id="write_form">
		<sec:csrfInput />
		<%-- csrf 토큰 --%>
	<input type="hidden" name="academyVO.acaNo" value="${requestScope.acaNo}">
		<table class="table">
			<tr>
				<td>제목 &nbsp;&nbsp; <input type="text" name="curName"
					placeholder="교육과정 제목을 입력하세요" required="required">
				</td>
			</tr>
			<tr>
				<td>최대 수강인원 &nbsp;&nbsp; <input type="text" name="limitMem"
					placeholder="숫자만 입력해주세요!" required="required">
				</td>
			</tr>
			<tr>
				<td><textarea cols="90" rows="15" name="curContent"
						required="required" placeholder="본문내용을 입력하세요"></textarea></td>
			</tr>
			<tr>
				<td>강의자 &nbsp;&nbsp; <input type="text" name="curLecturer"
					placeholder="누가 강의하시나요?" required="required">
				</td>
			</tr>
			<tr>
				<td>교재 &nbsp;&nbsp; <input type="text" name="curTextbook"
					placeholder="어떤 교재 사용하나요?" required="required">
				</td>
			</tr>
		</table>
		
			<div class="btnArea">
				<button type="submit" class="btn">확인</button>
				<button type="reset" class="btn">취소</button>
			</div>
		
	</form>
	<a href="${pageContext.request.contextPath}/detailAcademy.do?acaNo=${requestScope.acaNo}">목록으로
		돌아가기</a>
		</sec:authorize>

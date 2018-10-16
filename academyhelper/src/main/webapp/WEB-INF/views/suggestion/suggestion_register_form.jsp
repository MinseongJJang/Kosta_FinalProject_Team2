<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    <%@ taglib prefix="sec" uri="http://www.springframework.org/security/tags" %>
 <div class="col-sm-2" ></div>
    <div class="col-sm-8">
<form method="post" action="${pageContext.request.contextPath}/suggestionRegister.do" id="regForm">
<sec:csrfInput/><%-- csrf 토큰 --%>
<table class="table">
			<tr>
				<td>제목  &nbsp;&nbsp; <input type="text" name="sugTitle" required="required"><br>
				</td>
			</tr>
			<tr>
				<td>내용  &nbsp;&nbsp; <input type="text" name="sugContent" required="required"><br>
				</td>
			</tr>
		</table>
		<div class="btnArea">
			<input type="submit" value="게시물 등록">
			<button type="reset" class="btn">취소</button>
		</div>
	</form>
</div>
 <div class="col-sm-2" ></div>
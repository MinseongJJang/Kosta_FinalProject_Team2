<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="sec" uri="http://www.springframework.org/security/tags" %>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<script type="text/javascript">
	$(document).ready(function() {
		$("#updateForm").submit(function() {
			if ($("#title").val() == "") {
				alert("제목을 입력하세요!");
				return false;
			}
			if ($("#content").val() == "") {
				alert("본문을 입력하세요!");
				return false;
			}
		});
		$("#resetBtn").click(function() {
			$("#write_form")[0].reset();
		});
	});
</script>
<form method="post" id="updateForm"	action="${pageContext.request.contextPath}/updateAcaQNA.do">
 <sec:csrfInput />
	<input type="hidden" name="qnaNo" value="${detailQNA.qnaNo}">
	<table class="table">
		<tr>
			<td>제목 &nbsp;&nbsp; <input type="text" name="qnaTitle" value="${detailQNA.qnaTitle}" required="required">
			</td>
		</tr>
		<tr>
			<td>
				작성자 : ${detailQNA.userVO.usrId}
			</td>
		</tr>
		<tr>
			<td colspan="2"><textarea cols="90" rows="15" name="qnaContent" required="required">${detailQNA.qnaContent }</textarea></td>
		</tr>
	</table>
	<div class="btnArea">
		<button type="submit" class="btn">수정</button>
		<button type="reset" class="btn">취소</button>
	</div>					
</form>
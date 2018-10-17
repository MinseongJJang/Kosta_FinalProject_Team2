<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions"%>
<%@ taglib prefix="sec"
	uri="http://www.springframework.org/security/tags"%>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<script
	src="https://ajax.googleapis.com/ajax/libs/jquery/3.2.1/jquery.min.js"></script>
<script
	src="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/js/bootstrap.min.js"></script>
<script type="text/javascript">
	$(document).ready(function() {
		$("#deleteForm").submit(function() {
			return confirm("게시물을 삭제하시겠습니까?");
		});
		$("#updateForm").submit(function() {
			return confirm("게시물을 수정하시겠습니까?");
		});
	});
</script>
<div>
	<c:set var="detailQNA" value="${requestScope.detailQNA}" />
	<table border="1">
		<tr>
			<td>글번호</td>
			<td>${detailQNA.qnaNo}</td>
		</tr>
		<tr>
			<td>글제목</td>
			<td>${detailQNA.qnaTitle}</td>
		</tr>
		<tr>
			<td>작성자</td>
			<td>${detailQNA.userVO.nickname}</td>
		</tr>
		<tr>
			<td>등록일</td>
			<td>${detailQNA.qnaRegdate}</td>
		</tr>
		<tr>
			<td>내용</td>
			<td>${detailQNA.qnaContent}</td>
		</tr>
	</table>
	<%-- <c:if test="${requestScope.pvo.memberVO.id==sessionScope.mvo.id}"> --%>
	<button form="deleteForm" type="submit">삭제</button>
	<button form="updateForm" type="submit">수정</button>
	<form action="deleteAcaQNA.do" id="deleteForm" method="post">
		<sec:csrfInput />
		<input type="hidden" name="qnaNo" value="${detailQNA.qnaNo}">
	</form>
	<form action="updateAcaQNAForm.do" id="updateForm" method="post">
		<sec:csrfInput />
		<input type="hidden" name="qnaNo" value="${detailQNA.qnaNo}">
	</form>
	<%--  </c:if> --%>
	<!----------------------------------------- 댓글 form -------------------------------------------------->
	<br><br>
	<form
		action="${pageContext.request.contextPath}/registerAcaQnAReply.do"
		method="post">
		<input type="hidden" name="qnaNo" value="${detailQNA.qnaNo}">
		<sec:csrfInput />

		<div class="form-group">
			<label for="comment">댓글</label>
			<textarea class="form-control" rows="1" id="replycontent"
				name="replycontent" placeholder="댓글을 입력하세요"></textarea>
		</div>
		<button class="" onclick="return checkComment()">등록</button>
	</form>
	<c:if test="${fn:length(requestScope.rvoList)!=0}">
		<br>
		<br>
		<br>
		<p align="left">${fn:length(requestScope.rvoList)}개의댓글</p>
		<br>
		<c:forEach items="${requestScope.rvoList}" var="comment">
			<p align="left">${comment.id }</p>
			<form
				action="${pageContext.request.contextPath}/deleteAcaQnAReply.do"
				method="post" id="deletecommentform">
				<sec:csrfInput />
				<input type="hidden" name="rno" value="${comment.rNo}"> 
				<input type="hidden" name="qnaNo" value="${detailQNA.qnaNo}"> 
				<input style="float: right;" class="" type="button"
					value="삭제" onclick="deleteComment()">
			</form>

			<div class="card">
				<div class="card-body" align="left">
					<pre>${comment.content }</pre>
				</div>
			</div>
		</c:forEach>
	</c:if>
	<br>

	<script type="text/javascript">
		function checkComment() {
			var comment = document.getElementById("replycontent").value;
			//alert(comment);
			if (comment == "") {
				alert("댓글 입력해주세요!");
				return false;
			}
		}

		function deleteComment() {
			if (confirm("댓글 삭제하겠습니까?"))
				$("#deletecommentform").submit();
		}
	</script>
	<!------------- 댓글 form --------------------------------->

</div>

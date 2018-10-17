<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions"%>
<%@ taglib prefix="sec"
	uri="http://www.springframework.org/security/tags"%>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<script
	src="https://ajax.googleapis.com/ajax/libs/jquery/3.2.1/jquery.min.js"></script>
<script type="text/javascript">
	$(document).ready(function() {
		$("#deleteForm").submit(function() {
			return confirm("게시물을 삭제하시겠습니까?");
		});
		$("#updateForm").submit(function() {
			return confirm("게시물을 수정하시겠습니까?");
		});
	});
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
<div class="container">
	<div class="row">
		<div class="col-sm-1"></div>
		<div class="col-sm-10 text-center"
			style="margin-top: 100px; padding-bottom: 100px;">
			<div style="margin-top: 100px; text-align: center;" align="center">
				<table class="table">
					<tbody>
						<tr>
							<td colspan="8" align="center"><h3>질문과 응답 상세보기</h3></td>
						</tr>
						<c:set var="detailQNA" value="${requestScope.detailQNA}" />
						<tr>
							<td>글번호</td>
							<td>${detailQNA.qnaNo}</td>
							<td>글제목</td>
							<td>${detailQNA.qnaTitle}</td>
							<tD>작성자</td>
							<td>${detailQNA.userVO.nickname}</td>
							<td>등록일</td>
							<td>${detailQNA.qnaRegdate}</td>
						</tr>
						<tr>
							<td colspan="1">내용</td>
							<td colspan="7"><pre style="white-space: pre-wrap;">${detailQNA.qnaContent}</pre></td>
						</tr>
						<sec:authorize access="hasRole('ROLE_USER')">
							<tr>
								<td>
									<button form="deleteForm" type="submit">삭제</button>
									<button form="updateForm" type="submit">수정</button>
									<form action="deleteAcaQNA.do" id="deleteForm" method="post">
										<sec:csrfInput />
										<input type="hidden" name="qnaNo" value="${detailQNA.qnaNo}">
									</form>
									<form action="updateAcaQNAForm.do" id="updateForm"
										method="post">
										<sec:csrfInput />
										<input type="hidden" name="qnaNo" value="${detailQNA.qnaNo}">
									</form>
								</td>
							</tr>
						</sec:authorize>
					</tbody>
					<tfoot>
						<tr>
							<td colspan="1"><label for="comment">댓글</label></td>
							<td colspan="6">
								<form
									action="${pageContext.request.contextPath}/registerAcaQnAReply.do"
									method="post">
									<input type="hidden" name="qnaNo" value="${detailQNA.qnaNo}">
									<sec:csrfInput />
									<div class="form-group">
										<textarea class="form-control" rows="1" id="replycontent"
											name="replycontent" placeholder="댓글을 입력하세요"></textarea>
									</div>
								</form>
							<td colspan="1"><button onclick="return checkComment()"
									class="aca-btn" style="height: 10px">등록</button></td>
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
										<input style="float: right;" class="" type="button" value="삭제"
											onclick="deleteComment()">
									</form>
									<div class="card">
										<div class="card-body" align="left">
											<pre>${comment.content }</pre>
										</div>
									</div>
								</c:forEach>
							</c:if>
							<br>
							</td>
						</tr>
					</tfoot>
				</table>
			</div>
		</div>
		<div class="col-sm-1"></div>
	</div>
</div>

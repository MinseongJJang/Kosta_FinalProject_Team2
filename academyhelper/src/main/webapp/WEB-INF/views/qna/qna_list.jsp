<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="sec"
	uri="http://www.springframework.org/security/tags"%>
<meta charset="utf-8">
<link rel="stylesheet"
	href="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/css/bootstrap.min.css">
<table>
	<thead>
		<tr>
			<th class="qnaNo">NO</th>
			<th class="qnaTitle">제목</th>
			<th class="qnaRegdate">등록일</th>
			<th class="nickname">작성자 닉네임</th>
		</tr>
	</thead>

	<tbody>
		<c:forEach var="QNA" items="${listQNA}">
			<tr>
				<td>${QNA.qnaNo }</td>
				<td><a
					href="${pageContext.request.contextPath}/detailAcaQNA.do?qnaNo=${QNA.qnaNo}">${QNA.qnaTitle }</a>
				</td>
				<td>${QNA.qnaRegdate }</td>
				<td>${QNA.userVO.nickname }</td>
			</tr>
		</c:forEach>
	</tbody>
</table>
<sec:authorize access="hasRole('ROLE_USER')">

	<button form="registerQNAForm" type="submit">질문 등록</button>
	<form action="${pageContext.request.contextPath}/registerQNAForm.do"
		id="registerQNAForm" method="post">
		<sec:csrfInput />
	</form>
</sec:authorize>
<br></br>
<div class="pagingInfo">
	<c:set var="pb" value="${requestScope.pagingBean}"></c:set>
	<ul class="pagination">
		<c:if test="${pb.previousPageGroup}">
			<li><a
				href="${pageContext.request.contextPath}/listAcaQNA.do?pageNo=${pb.startPageOfPageGroup-1}">&laquo;</a></li>
		</c:if>
		<c:forEach var="i" begin="${pb.startPageOfPageGroup}"
			end="${pb.endPageOfPageGroup}">
			<c:choose>
				<c:when test="${pb.nowPage!=i}">
					<li><a
						href="${pageContext.request.contextPath}/listAcaQNA.do?pageNo=${i}">${i}</a></li>
				</c:when>
				<c:otherwise>
					<li class="active"><a href="#">${i}</a></li>
				</c:otherwise>
			</c:choose>
		</c:forEach>
		<c:if test="${pb.nextPageGroup}">
			<li><a
				href="${pageContext.request.contextPath}/listAcaQNA.do?pageNo=${pb.endPageOfPageGroup+1}">&raquo;</a></li>
		</c:if>
	</ul>
</div>


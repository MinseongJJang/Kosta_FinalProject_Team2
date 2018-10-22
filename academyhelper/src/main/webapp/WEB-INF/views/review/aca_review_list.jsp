<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="sec" uri="http://www.springframework.org/security/tags" %>
<table class="table table-hover">
<thead>
	<tr>
		<th>글번호</th>
		<th>제목</th>
		<th>등록일</th>
		<th>조회수</th>
		<th>작성자</th>
	</tr>
</thead>
<tbody>
<c:forEach items="${requestScope.review.acaReviewPostList }" var="review">
	<tr>
		<td>${review.acaRevNo }</td>
		<td><a href="detailAcaReviewPost.do?acaRevNo=${review.acaRevNo }">${review.acaRevTitle }</a></td>
		<td>${review.acaRevRegdate}</td>
		<td>${review.acaRevHits }</td>
		<td>${review.userVO.usrName }</td>
	</tr>
</c:forEach>
</tbody>
</table>
<br>
<ul class="pagination">
		<c:if test="${requestScope.review.pb.previousPageGroup}">
			<li><a href="${pageContext.request.contextPath }/acaReviewList.do?pageNo=${requestScope.review.pb.startPageOfPageGroup-1}">&laquo;</a></li>
		</c:if>
		<c:forEach var="page"
			begin="${requestScope.review.pb.startPageOfPageGroup }"
			end="${requestScope.review.pb.endPageOfPageGroup }">

			<c:choose>
				<c:when test="${page==requestScope.review.pb.nowPage}">
					<li class="active"><a>${page}</a></li>
				</c:when>
				<c:otherwise>
					<li><a
						href="${pageContext.request.contextPath }/acaReviewList.do?pageNo=${page}">${page}</a></li>
				</c:otherwise>
			</c:choose>

		</c:forEach>
		<c:if test="${requestScope.review.pb.nextPageGroup}">
			<li><a
				href="${pageContext.request.contextPath }/acaReviewList.do?pageNo=${requestScope.review.pb.endPageOfPageGroup+1}">&raquo;</a></li>
		</c:if>
	</ul>
<sec:authorize access="hasRole('ROLE_USER')">
<a href="registerReviewPostForm.do">후기글쓰기</a>
</sec:authorize>
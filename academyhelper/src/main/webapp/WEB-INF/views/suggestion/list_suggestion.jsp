<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<meta charset="utf-8">
<link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/css/bootstrap.min.css">
<table>
		<thead>
			<tr>
				<th class="sugNo">NO</th>
				<th class="sugTitle">제목</th>
				<th class="usrName">작성자</th>
				<th class="sugRegdate">작성일</th>
			</tr>
		</thead>
		<tbody>
			<c:forEach var="list" items="${list}">
				<tr>
					<td>${list.sugNo}</td>
					<td>
					<a href="${pageContext.request.contextPath}/detailSuggestionPost.do?sugNo=${list.sugNo}">${list.sugTitle}</a>
					</td>
					<td>${list.userVO.usrName}</td>
					<td>${list.sugRegdate}</td>
				</tr>
			</c:forEach>
		</tbody>
	</table>
	<br></br>
	<div class="pagingInfo">
		<c:set var="pb" value="${requestScope.pb}"></c:set>
		<ul class="pagination">
			<c:if test="${pb.previousPageGroup}">
				<li><a href="${pageContext.request.contextPath}/listSuggestionPost.do?pageNo=${pb.startPageOfPageGroup-1}">&laquo;</a></li>
			</c:if>
			<c:forEach var="i" begin="${pb.startPageOfPageGroup}"
				end="${pb.endPageOfPageGroup}">
				<c:choose>
					<c:when test="${pb.nowPage!=i}">
						<li><a href="${pageContext.request.contextPath}/listSuggestionPost.do?pageNo=${i}">${i}</a></li>
					</c:when>
					<c:otherwise>
						<li class="active"><a href="#">${i}</a></li>
					</c:otherwise>
				</c:choose>
	</c:forEach>
			<c:if test="${pb.nextPageGroup}">
				<li><a href="${pageContext.request.contextPath}/listSuggestionPost.do?pageNo=${pb.endPageOfPageGroup+1}">&raquo;</a></li>
			</c:if>
		</ul>
	</div>

<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<meta charset="utf-8">
<link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/css/bootstrap.min.css">
<table>
		<caption>목록</caption>
		<thead>
			<tr>
				<th class="acaNo">NO</th>
				<th class="acaName">학원이름</th>
				<th class="acaAddr">주소</th>
				<th class="acaTel">번호</th>
				<th>아이디</th>
			</tr>
		</thead>
		<tbody>
			<c:forEach var="academy"  items="${ListAcademy}">
				<tr>
					<td>${academy.acaNo }</td>
					<td>
					<a href="${pageContext.request.contextPath}/detailAcademy.do?acaNo=${academy.acaNo}">${academy.acaName }</a>
					</td>
					<td>${academy.acaAddr }</td>
					<td>${academy.acaTel }</td>
					<td>${academy.userVO.usrId }</td>
				</tr>
			</c:forEach>
		</tbody>
	</table>
	<br></br>
	<div class="pagingInfo">
		<c:set var="pb" value="${requestScope.pagingBean}"></c:set>
		<ul class="pagination">
			<c:if test="${pb.previousPageGroup}">
				<li><a href="${pageContext.request.contextPath}/listAcademy.do?pageNo=${pb.startPageOfPageGroup-1}">&laquo;</a></li>
			</c:if>
			<c:forEach var="i" begin="${pb.startPageOfPageGroup}"
				end="${pb.endPageOfPageGroup}">
				<c:choose>
					<c:when test="${pb.nowPage!=i}">
						<li><a href="${pageContext.request.contextPath}/listAcademy.do?pageNo=${i}">${i}</a></li>
					</c:when>
					<c:otherwise>
						<li class="active"><a href="#">${i}</a></li>
					</c:otherwise>
				</c:choose>
	</c:forEach>
			<c:if test="${pb.nextPageGroup}">
				<li><a href="${pageContext.request.contextPath}/listAcademy.do?pageNo=${pb.endPageOfPageGroup+1}">&raquo;</a></li>
			</c:if>
		</ul>
	</div>

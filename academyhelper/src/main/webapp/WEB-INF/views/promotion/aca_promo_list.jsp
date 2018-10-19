<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
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
<c:forEach items="${requestScope.promotion.acaPromoPostList }" var="promo">
	<tr>
		<td>${promo.acaPromoNo }</td>
		<td><a href="detailAcaPromoPost.do?acaPromoNo=${promo.acaPromoNo }">${promo.acaPromoTitle }</a></td>
		<td>${promo.acaPromoRegdate }</td>
		<td>${promo.acaPromoHits }</td>
		<td>${promo.acaUserVO.userVO.usrName }</td>
	</tr>
</c:forEach>
</tbody>
</table>
<br>
<sec:authorize access="hasRole('ROLE_ACADEMY')">
<a href="registerAcaPromoPostForm.do">홍보글쓰기</a>
</sec:authorize>


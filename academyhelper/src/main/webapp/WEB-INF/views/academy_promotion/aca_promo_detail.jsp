<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<table class="table">
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
	<tr>
		<td>${requestScope.acaPromo.acaPromoNo }</td>
		<td>${requestScope.acaPromo.acaPromoTitle }</td>
		<td>${requestScope.acaPromo.acaPromoRegdate }</td>
		<td>${requestScope.acaPromo.acaPromoHits }</td>
		<td>${requestScope.acaPromo.acaUserVO.userVO.usrName }</td>
	</tr>
</tbody>
<tfoot>
	<tr>
		<td>내용</td>
		<td>${requestScope.acaPromo.acaPromoContent }</td>
	</tr>
</tfoot>
</table>
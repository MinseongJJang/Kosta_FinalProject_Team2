<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html>
<html lang="en">
<head>
<meta charset="utf-8">
<meta name="viewport" content="width=device-width, initial-scale=1">
<script
	src="https://ajax.googleapis.com/ajax/libs/jquery/3.2.1/jquery.min.js"></script>

<title>교육과정 리스트</title>
</head>
<body>

	<table>
		<caption>목록</caption>
		<thead>
			<tr>
				<th class="curNo">NO</th>
				<th class="curName">과정이름</th>
				<th class="curLecturer">강사명</th>
				<th class="limitMem">정원</th>
				<th class="curTextbook">과정이름</th>
				<th class="acaName">학원이름</th>
			</tr>
		</thead>
		<tbody>
			<c:forEach var="curriculum" items="${requestScope.ListCurriculum}">
				<tr>
					<td>${curriculum.curNo }</td>
					<td><a
						href="${pageContext.request.contextPath}/detailCurriculum.do?curNo=${curriculum.curNo}">
							${curriculum.curName }</a></td>
					<td>${curriculum.curLecturer }</td>
					<td>${curriculum.limitMem }</td>
					<td>${curriculum.curTextbook }</td>
					<td>${curriculum.academyVO.acaName }</td>

				</tr>
			</c:forEach>
		</tbody>
	</table>
	<div class="pagingInfo">
		<%-- 코드를 줄이기 위해 pb 변수에 pagingBean을 담는다. --%>
		<c:set var="pb" value="${requestScope.pb}"></c:set>
		<!-- 
			step2 1) 이전 페이지 그룹이 있으면 화살표 보여준다
				   		페이징빈의 previousPageGroup 이용 
				   2)  이미지에 이전 그룹의 마지막 페이지번호를 링크한다. 
				   	    hint)   startPageOfPageGroup-1 하면 됨 		 
	 -->
		<!-- step1. 1)현 페이지 그룹의 startPage부터 endPage까지 forEach 를 이용해 출력한다
				   2) 현 페이지가 아니면 링크를 걸어서 서버에 요청할 수 있도록 한다.
				      현 페이지이면 링크를 처리하지 않는다.  
				      PagingBean의 nowPage
				      jstl choose 를 이용  
				      예) <a href="DispatcherServlet?command=list&pageNo=...">				   
	 -->
		<ul class="pagination">
			<c:if test="${pb.previousPageGroup}">
				<li><a
					href="${pageContext.request.contextPath}/list.do?pageNo=${pb.startPageOfPageGroup-1}">&laquo;</a></li>
			</c:if>
			<c:forEach var="i" begin="${pb.startPageOfPageGroup}"
				end="${pb.endPageOfPageGroup}">
				<c:choose>
					<c:when test="${pb.nowPage!=i}">
						<li><a
							href="${pageContext.request.contextPath}/list.do?pageNo=${i}">${i}</a></li>
					</c:when>
					<c:otherwise>
						<li class="active"><a href="#">${i}</a></li>
					</c:otherwise>
				</c:choose>
	&nbsp;
	</c:forEach>
			<c:if test="${pb.nextPageGroup}">
				<li><a
					href="${pageContext.request.contextPath}/list.do?pageNo=${pb.endPageOfPageGroup+1}">&raquo;</a></li>
			</c:if>
		</ul>
	</div>
</body>
</html>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions"%>
<%@ taglib prefix="sec" uri="http://www.springframework.org/security/tags" %>
<sec:authentication var="mvo" property="principal"/>
<table class="table">
<thead>
	<tr>
		<th>글번호</th>
		<th>제목</th>
		<th>등록일</th>
		<th>조회수</th>
		<th>작성자</th>
		<th>과정명</th>
	</tr>
</thead>
<tbody>
	<tr>
		<td>${requestScope.review.acaRevNo }</td>
		<td>${requestScope.review.acaRevTitle }</td>
		<td>${requestScope.review.acaRevRegdate }</td>
		<td>${requestScope.review.acaRevHits }</td>
		<td>${requestScope.review.userVO.usrName }</td>
		<td>${requestScope.review.curriculumVO.curName }</td>
	</tr>
</tbody>
<tfoot>
	<tr>
		<td>내용</td>
		<td>${requestScope.review.acaRevContent }</td>
	</tr>
	<tr>
		<td>해시태그</td>
		<td>
			<c:forEach items="${requestScope.hashList }" var="hash">
				<a>${hash.hashTagName}</a>&nbsp;&nbsp;&nbsp;
			</c:forEach>
		</td>
	</tr>
	<tr>
		<td>교육과정 만족도 : </td>
		<td>${requestScope.satisfaction.curSatis }
		</td>
	</tr>
	<tr>
	 	<td>편의시설 만족도 :</td>
	 	<td> ${requestScope.satisfaction.amenitiesSatis }</td>
	</tr>
	<tr>
		<td> 강사님 만족도 :</td>
		<td>${requestScope.satisfaction.lecturerSatis }</td>
	</tr>
	<tr>
		<td>취업연계 만족도 : </td>
		<td>${requestScope.satisfaction.empLinksSatis }</td>
	</tr>
	<tr>
		<td>교통 만족도 : </td>
		<td>${requestScope.satisfaction.trafficSatis }</td>
	</tr>
</tfoot>
</table>

<c:if test="${requestScope.review.userVO.usrId == mvo.usrId }">
	<button id="updateReview">수정</button>
	<button id="deleteReview">삭제</button>
</c:if>

<div class="container">
		<c:choose>
			<c:when test="${requestScope.reply.acaReviewReplyList != null }">
				<c:forEach items="${requestScope.reply.acaReviewReplyList }" var="reply">
					<textarea rows="" cols="" readonly="readonly">${reply.acaRevRepContent }</textarea>
					<button type="button">수정</button>
					<br>
				</c:forEach>
			</c:when>
			<c:otherwise>
				<form>
					<input type="text" placeholder="댓글을 입력하세요" name="">
				</form>	
			</c:otherwise>
		</c:choose>
</div>


<script type="text/javascript">
	$(document).ready(function(){
		$("#updateReview").click(function(){
			alert(123);			
			if(confirm("수정하시겠습니까?")){
				location.href="updateReviewForm.do?acaRevNo="+${requestScope.review.acaRevNo};
			}
		});//click
		$("#deleteReview").click(function(){
			if(confirm("삭제하시겠습니까?")){
				location.href="deleteReview.do?acaRevNo="+${requestScope.review.acaRevNo};
			}
		});//click
	});//ready
</script> 
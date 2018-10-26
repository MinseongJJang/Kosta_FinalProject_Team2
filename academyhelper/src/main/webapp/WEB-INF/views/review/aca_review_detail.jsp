<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions"%>
<%@ taglib prefix="sec" uri="http://www.springframework.org/security/tags" %>



<script type="text/javascript">
	$(document).ready(function(){
		$("#updateReview").click(function(){
			if(confirm("수정하시겠습니까?")){
				location.href="updateReviewForm.do?acaRevNo="+${requestScope.review.acaRevNo};
			}
		});//click
		$("#deleteReview").click(function(){
			if(confirm("삭제하시겠습니까?")){
				location.href="deleteReview.do?acaRevNo="+${requestScope.review.acaRevNo}
			}
		});
		//click
	});
</script>
	

<div class="container">
	<div class="row">
		<div class="col-sm-1"></div>
		<div class="col-sm-10 text-center"
			style="margin-top: 100px; padding-bottom: 100px;">
			<div style="margin-top: 100px; text-align: center;" align="center">
				<table class="table">
					<thead>
				   		<tr>
							<td colspan="8" align="center"><h3>기관 후기 상세보기</h3></td>
						</tr>
						<tr>
							<td style="border-top:0px"></td>
						</tr>
					</thead>
				         <tr>
				            <th>글번호</th>
				            <td>${requestScope.review.acaRevNo }</td>
				            <th>제목</th>
				            <td>${requestScope.review.acaRevTitle } </td>
				            <th>작성자</th>
				            <td>${requestScope.review.userVO.usrName }</td>
				            <th>등록일</th>
				            <td>${requestScope.review.acaRevRegdate }</td>
				         </tr>
				         <tr>
				         	<th colspan="8">과정명</th>
				         </tr>
				         <tr>
				         	<td colspan="8">${requestScope.review.curriculumVO.curName }</td>
				         </tr>
				         <tr>
				         	<th colspan="1">내용</th>
				         	<td colspan="7"><pre style="white-space: pre-wrap;">${requestScope.review.acaRevContent }</pre></td>
				         </tr>
				         <tr>
							<td colspan="8">
								<c:forEach items="${requestScope.hashList }" var="hash">
									<a>${hash.hashTagName}</a>&nbsp;&nbsp;&nbsp;
								</c:forEach>
							</td>
						</tr>
						<tr>
							<td colspan="1">교육과정 만족도 </td>
							<td colspan="7">${requestScope.satisfaction.curSatis }</td>
							
						</tr>
						<tr>
						 	<td colspan="1">편의시설 만족도</td>
						 	<td colspan="7"> ${requestScope.satisfaction.amenitiesSatis }</td>
						</tr>
						<tr>
							<td colspan="1"> 강사님 만족도</td>
							<td colspan="7">${requestScope.satisfaction.lecturerSatis }</td>
						</tr>
						<tr>
							<td colspan="1">취업연계 만족도</td>
							<td colspan="7">${requestScope.satisfaction.empLinksSatis }</td>
						</tr>
						<tr>
							<td colspan="1">교통 만족도</td>
							<td colspan="7">${requestScope.satisfaction.trafficSatis }</td>
						</tr>
				   <tbody>
			      		<sec:authorize access="hasRole('ROLE_ADMIN')">
					      <tr>
					      	<td colspan="8" align="right">
							   	<button form="deleteForm" type="submit" class="aca-btn">삭제</button>
								<button form="updateForm" type="submit" class="aca-btn">수정</button>
							 	<form action="deleteReview.do" id="deleteForm" method="post">
									<sec:csrfInput />
									<input type="hidden" name="acaRevNo" value="${requestScope.review.acaRevNo}">
								</form>
								<form action="updateReviewForm.do" id="updateForm" method="post">
									<input type="hidden" name="acaRevNo" value="${requestScope.review.acaRevNo}">
									<sec:csrfInput />
								</form>
					      	</td>
					      </tr>
						</sec:authorize>
					</tbody>
				</table>
			</div>
		</div>
		<div class="col-sm-1"></div>
	</div>
</div>
<style type="text/css">
.title { font-size: 20px; }
.title:before {
    content: '';
    display: inline-block;
    width: 32px;
    height: 32px;
    margin-right: 8px;
    vertical-align: middle;
    background: #e50020 url('//cdn.lezhin.com/files/assets/page/image/lzlogo_30.png') no-repeat center;
    background-size: 24px;
}
.rating,
.rating *,
.rating :before,
.rating :after { box-sizing: border-box; }
.rating {
    position: relative;
    padding: 80px 0 10px;
    text-align: center;
    border: 0;
    border-top: 1px solid #dbdee3;
    border-bottom: 1px solid #dbdee3;
}
.ratingLegend {
    position: absolute;
    top: 48px;
    left: 0;
    right: 0;
    text-align: center;
    line-height: 24px;
    font-size: 16px;
    color: #ef5630;
}
.ratingGroup {
    position: relative;
    width: 200px;
    height: 40px;
    margin: 0 auto 12px;
    text-align: center;
    font-size: 0;
    background: url('//cdn.lezhin.com/files/assets/img/challenge_star_icon.png') repeat-x;
    background-size: 40px;
}
.ratingInput {
    position: absolute;
    top: 0;
    left: 0;
    margin: 0;
    height: 40px;
    border: 0;
    -webkit-appearance: none;
    -webkit-border-radius: 0;
}
.ratingInput:nth-of-type(1) {
    width: 20px;
    z-index: 10;
}
.ratingInput:nth-of-type(2) {
    width: 40px;
    z-index: 9;
}
.ratingInput:nth-of-type(3) {
    width: 60px;
    z-index: 8;
}
.ratingInput:nth-of-type(4) {
    width: 80px;
    z-index: 7;
}
.ratingInput:nth-of-type(5) {
    width: 100px;
    z-index: 6;
}
.ratingInput:nth-of-type(6) {
    width: 120px;
    z-index: 5;
}
.ratingInput:nth-of-type(7) {
    width: 140px;
    z-index: 4;
}
.ratingInput:nth-of-type(8) {
    width: 160px;
    z-index: 3;
}
.ratingInput:nth-of-type(9) {
    width: 180px;
    z-index: 2;
}
.ratingInput:nth-of-type(10) {
    width: 200px;
    z-index: 1;
}
.ratingInput:enabled:hover,
.ratingInput:enabled:focus,
.ratingInput:checked {
    background: url('//cdn.lezhin.com/files/assets/img/challenge_star_icon.png') repeat-x 0 -40px;
    background-size: 40px;
}
.ratingInput:enabled:hover + label,
.ratingInput:enabled:focus + label,
.ratingInput:checked + label { visibility: visible; }
.ratingLabel {
    position: absolute;
    top: -32px;
    left: 0;
    right: 0;
    visibility: hidden;
    text-align: center;
    line-height: 24px;
    font-size: 16px;
    color: #ef5630;
    background: #fff;
}
</style>


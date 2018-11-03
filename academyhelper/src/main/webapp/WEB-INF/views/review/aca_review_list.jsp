<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="sec" uri="http://www.springframework.org/security/tags" %>


<div class="container" >
	<div class="row">
		<div class="col-sm-1"></div>
		<div class="col-sm-10 text-center" 	style="margin-top: 100px; padding-bottom: 100px;">
			<div style="margin-top: 100px; text-align:center;" align="center">
				<table class="table table-hover">
				   <thead style="text-align:center;">
					   	<tr>
							<td colspan="4" align="center"><h3>IT기관 후기</h3></td>
						</tr>
						<tr>
							<td style="border-top:0px"></td>
						</tr>
				      <tr >
				         <th class="qnaNo">NO</th>
				         <th class="qnaTitle">제목</th>
				         <th class="qnaRegdate">등록일</th>
				         <th class="nickname">작성자</th>
				      </tr>
				   </thead>
				   <tbody>
				      <c:forEach items="${requestScope.review.acaReviewPostList }" var="review">
							<tr>
								<td>${review.acaRevNo }</td>
								<td><a href="detailAcaReviewPost.do?acaRevNo=${review.acaRevNo }">${review.acaRevTitle }</a></td>
								<td>${review.acaRevRegdate}</td>
								<td>${review.userVO.usrName }</td>
							</tr>
						</c:forEach>
			      		<sec:authorize access="hasRole('ROLE_USER') ">
					      <tr>
					      	<td colspan="4" align="right">
							   <button form="registerReviewForm" type="submit" class="aca-btn">후기 등록</button>
							   <form action="${pageContext.request.contextPath}/registerReviewPostForm.do" id="registerReviewForm" method="post">
							      <sec:csrfInput />
							   </form>
					      	</td>
					      </tr>
						</sec:authorize>
				   </tbody>
				   <tfoot>
				   <tr>
				   	<td colspan="4" >
				   		<div class="pagingInfo" >
						   <c:set var="pb" value="${requestScope.pagingBean}"></c:set>
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
											<li><a href="${pageContext.request.contextPath }/acaReviewList.do?pageNo=${page}">${page}</a></li>
										</c:otherwise>
									</c:choose>
						
								</c:forEach>
								<c:if test="${requestScope.review.pb.nextPageGroup}">
									<li><a
										href="${pageContext.request.contextPath }/acaReviewList.do?pageNo=${requestScope.review.pb.endPageOfPageGroup+1}">&raquo;</a></li>
								</c:if>
							</ul>
						</div>
				   	</td>
				   </tr>
				   </tfoot>
				</table>
			</div>
		</div>
		<div class="col-sm-1"></div>
	</div>
</div>

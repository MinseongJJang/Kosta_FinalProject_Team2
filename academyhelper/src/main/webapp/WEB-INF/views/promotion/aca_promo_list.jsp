<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="sec" uri="http://www.springframework.org/security/tags" %>


<div class="container" >
	<div class="row">
		<div class="col-sm-1"></div>
		<div class="col-sm-10 text-center" 	style="margin-top: 100px; padding-bottom: 100px;">
			<div style="margin-top: 100px; text-align:center;" align="center">
				<table class="table table-hover">
				   <thead style="text-align:center;">
					   	<tr>
							<td colspan="4" align="center"><h3>IT기관 홍보</h3></td>
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
				      	<c:forEach items="${requestScope.promotion.acaPromoPostList }" var="promo">
							<tr>
								<td>${promo.acaPromoNo }</td>
								<td><a href="detailAcaPromoPost.do?acaPromoNo=${promo.acaPromoNo }">${promo.acaPromoTitle }</a></td>
								<td>${promo.acaPromoRegdate }</td>
								<td>${promo.acaUserVO.userVO.usrName }</td>
							</tr>
						</c:forEach>
			      		<sec:authorize access="hasRole('ROLE_ACADEMY')">
					      <tr>
					      	<td colspan="4" align="right">
							   <button form="registerQNAForm" type="submit" class="aca-btn">홍보 등록</button>
							   <form action="${pageContext.request.contextPath}/registerAcaPromoPostForm.do" id="registerQNAForm" method="post">
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
								<c:if test="${requestScope.promotion.pb.previousPageGroup}">
									<li><a href="${pageContext.request.contextPath }/acaPromoList.do?pageNo=${requestScope.promotion.pb.startPageOfPageGroup-1}">&laquo;</a></li>
								</c:if>
								<c:forEach var="page"
									begin="${requestScope.promotion.pb.startPageOfPageGroup }"
									end="${requestScope.promotion.pb.endPageOfPageGroup }">
						
									<c:choose>
										<c:when test="${page==requestScope.promotion.pb.nowPage}">
											<li class="active"><a>${page}</a></li>
										</c:when>
										<c:otherwise>
											<li><a href="${pageContext.request.contextPath }/acaPromoList.do?pageNo=${page}">${page}</a></li>
										</c:otherwise>
									</c:choose>
						
								</c:forEach>
								<c:if test="${requestScope.promotion.pb.nextPageGroup}">
									<li><a
										href="${pageContext.request.contextPath }/acaPromoList.do?pageNo=${requestScope.promotion.pb.endPageOfPageGroup+1}">&raquo;</a></li>
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


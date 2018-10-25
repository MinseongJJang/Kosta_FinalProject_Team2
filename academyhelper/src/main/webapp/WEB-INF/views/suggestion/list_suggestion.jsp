<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="sec" uri="http://www.springframework.org/security/tags"%>
<meta charset="utf-8">
<div class="container" >
	<div class="row">
		<div class="col-sm-1"></div>
		<div class="col-sm-10 text-center" 	style="margin-top: 100px; padding-bottom: 100px;">
			<div style="margin-top: 100px; text-align:center;" align="center">
				<table class="table table-hover">
				   <thead style="text-align:center;">
					   	<tr>
							<td colspan="4" align="center"><h3>건의 사항</h3></td>
						</tr>
						<tr>
							<td style="border-top:0px"></td>
						</tr>
				      <tr >
				         <th>NO</th>
				         <th>제목</th>
				         <th>등록일</th>
				         <th>작성자</th>
				      </tr>
				   </thead>
				   <tbody>
				      <c:forEach var="list" items="${list}">
							<tr>
								<td>${list.sugNo}</td>
								<td>
								<a href="${pageContext.request.contextPath}/detailSuggestionPost.do?sugNo=${list.sugNo}">${list.sugTitle}</a></td>
								<td>${list.userVO.nickname}</td>
								<td>${list.sugRegdate}</td>
							</tr>
						</c:forEach>
			      		<sec:authorize access="hasRole('ROLE_USER')">
					      <tr>
					      	<td colspan="4" align="right">
							   <button form="registerSuggestionForm" type="submit" class="aca-btn">질문 등록</button>
							   <form action="${pageContext.request.contextPath}/suggestionRegisterForm.do" id="registerSuggestionForm" method="post">
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
						   <c:set var="pb" value="${requestScope.pb}"></c:set>
						   <ul class="pagination">
						      <c:if test="${pb.previousPageGroup}">
						         <li><a href="${pageContext.request.contextPath}/listSuggestionPost.do?pageNo=${pb.startPageOfPageGroup-1}">&laquo;</a></li>
						      </c:if>
						      <c:forEach var="i" begin="${pb.startPageOfPageGroup}" end="${pb.endPageOfPageGroup}">
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
				   	</td>
				   </tr>
				   </tfoot>
				</table>
			</div>
		</div>
		<div class="col-sm-1"></div>
	</div>
</div>

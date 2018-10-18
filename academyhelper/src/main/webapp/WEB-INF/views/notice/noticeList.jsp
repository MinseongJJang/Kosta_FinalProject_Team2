<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="sec" uri="http://www.springframework.org/security/tags"%>
<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.3.1/jquery.min.js"></script>
<div class="container" >
	<div class="row">
		<div class="col-sm-1"></div>
		<div class="col-sm-10 text-center" 	style="margin-top: 100px; padding-bottom: 100px;">
			<div style="margin-top: 100px; text-align:center;" align="center">
				<table class="table table-hover">
				   <thead style="text-align:center;">
					   	<tr>
							<td colspan="4" align="center"><h3>공지사항</h3></td>
						</tr>
				      <tr >
				         <th>NO</th>
				         <th>제목</th>
				         <th>이름</th>
				         <th>작성일</th>
				      </tr>
				   </thead>
				   <tbody>
				     <c:forEach var="pvo" items="${lvo.noticeList}">		
						<tr>
						    <td>${pvo.noticeNo }</td>			
							<td>
								<a href="${pageContext.request.contextPath}/detailNotice.do?noticeNo=${pvo.noticeNo }">	${pvo.noticeTitle }</a>
							</td>
							<td>${pvo.userVO.usrName }</td>
							<td>${pvo.noticeRegdate }</td>
						</tr>	
						</c:forEach>
						<sec:authorize access="hasRole('ROLE_ADMIN')">
					      <tr>
					      	<td colspan="4" align="right">
							   <button form="registerNoticeForm" type="submit" class="aca-btn">공지 등록</button>
							   <form action="${pageContext.request.contextPath}/registerNoticeForm.do" id="registerNoticeForm" method="post">
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
						      <c:if test="${pb.previousPageGroup}">
						         <li><a href="${pageContext.request.contextPath}/listNotice.do?pageNo=${pb.startPageOfPageGroup-1}">&laquo;</a></li>
						      </c:if>
						      <c:forEach var="i" begin="${pb.startPageOfPageGroup}" end="${pb.endPageOfPageGroup}">
						         <c:choose>
						            <c:when test="${pb.nowPage!=i}">
						               <li><a href="${pageContext.request.contextPath}/listNotice.do?pageNo=${i}">${i}</a></li>
						            </c:when>
						            <c:otherwise>
						               <li class="active"><a href="#">${i}</a></li>
						            </c:otherwise>
						         </c:choose>
						      </c:forEach>
						      <c:if test="${pb.nextPageGroup}">
						         <li><a href="${pageContext.request.contextPath}/listNotice.do?pageNo=${pb.endPageOfPageGroup+1}">&raquo;</a></li>
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
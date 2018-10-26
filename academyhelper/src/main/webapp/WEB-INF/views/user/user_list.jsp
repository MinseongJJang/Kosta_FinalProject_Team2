<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@taglib prefix="sec"  uri="http://www.springframework.org/security/tags"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<meta name="viewport" content="width=device-width, initial-scale=1">
<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.2.1/jquery.min.js"></script>

<sec:authorize access="hasRole('ROLE_ADMIN')">
<sec:authentication var="mvo" property="principal" />  
<div class="container" >
	<div class="row">
		<div class="col-sm-1"></div>
		<div class="col-sm-10 text-center" 	style="margin-top: 100px; padding-bottom: 100px;">
			<div style="margin-top: 100px; text-align:center;" align="center">
				<table class="table table-hover">
				   <thead style="text-align:center;">
					   	<tr>
							<td colspan="8" align="center"><h3>회원 목록</h3></td>
						</tr>
						<tr>
							<td style="border-top:0px"></td>
						</tr>
				         <tr>
							<th class="usrId">아이디</th>
							<th class="usrName">이름</th>
							<th class="usrAddr">주소</th>
							<th class="nickname">별명</th>
							<th class="birthday">생일</th>
							<th class="usrRegdate">가입일</th>
							<th class="usrEmail">이메일</th>
							<th class="usrTel">번호</th>
						</tr>
				   </thead>
				   <tbody>
				      	<c:forEach var="user" items="${requestScope.list}">
							<tr>
								<td>${user.usrId}</td>
								<td>${user.usrName}</td>
								<td>${user.usrAddr}</td>
								<td>${user.nickname}</td>
								<td>${user.birthday}</td>
								<td>${user.usrRegdate}</td>
								<td>${user.usrEmail}</td>
								<td>${user.usrTel}</td>
							</tr>
						</c:forEach>
				   </tbody>
				   <tfoot>
				   <tr>
				   	<td colspan="8" >
				   			<div class="pagingInfo">
								<c:set var="pb" value="${requestScope.pb}"></c:set>
								<ul class="pagination">
									<c:if test="${pb.previousPageGroup}">
										<li><a
											href="${pageContext.request.contextPath}/userList.do?pageNo=${pb.startPageOfPageGroup-1}">&laquo;</a></li>
									</c:if>
									<c:forEach var="i" begin="${pb.startPageOfPageGroup}"
										end="${pb.endPageOfPageGroup}">
										<c:choose>
											<c:when test="${pb.nowPage!=i}">
												<li><a
													href="${pageContext.request.contextPath}/userList.do?pageNo=${i}">${i}</a></li>
											</c:when>
											<c:otherwise>
												<li class="active"><a href="#">${i}</a></li>
											</c:otherwise>
										</c:choose>
							&nbsp;
							</c:forEach>
									<c:if test="${pb.nextPageGroup}">
										<li><a
											href="${pageContext.request.contextPath}/userList.do?pageNo=${pb.endPageOfPageGroup+1}">&raquo;</a></li>
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
</sec:authorize>

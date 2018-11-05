<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="sec" uri="http://www.springframework.org/security/tags" %>    

<div class="container">
	<div class="row">
		<div class="col-sm-1"></div>
		<div class="col-sm-10 text-center">
			<div style="margin-top: 100px; text-align: center;" align="center">
							<sec:authentication var="mvo" property="principal" />
				
				<table class="table">
					<thead>
				   		<tr>
							<td colspan="8" align="center"><h3>기관 홍보 상세보기</h3></td>
						</tr>
						<tr>
							<td style="border-top:0px"></td>
						</tr>
					</thead>
				   <tbody>
			         <tr>
				            <th>글번호</th>
				            <td>${requestScope.acaPromo.acaPromoNo }</td>
				            <th>제목</th>
				            <td>${requestScope.acaPromo.acaPromoTitle } </td>
				            <th>작성자</th>
				            <td>${mvo.usrName}</td>
				            <th>등록일</th>
				            <td>${requestScope.acaPromo.acaPromoRegdate }</td>
				         </tr>
				         <tr>
				         	<th colspan="1">내용</th>
				         	<td colspan="7"><pre style="white-space: pre-wrap;">${requestScope.acaPromo.acaPromoContent }</pre></td>
				         </tr>
			      		<sec:authorize access="hasRole('ROLE_USER') and hasRole('ROLE_ACADEMY')">
					      <tr>
					      	<td colspan="8" align="right">
							   	<button form="deleteForm" type="submit" class="aca-btn">삭제</button>
								<button form="updateForm" type="submit" class="aca-btn">수정</button>
							 	<form action="deleteAcaPromoPost.do" id="deleteForm" method="post">
									<sec:csrfInput />
									<input type="hidden" name="acaPromoNo" value="${requestScope.acaPromo.acaPromoNo}">
								</form>
								<form action="updateAcaPromoPostForm.do" id="updateForm" method="post">
									 <input type="hidden" name="acaPromoNo" value="${requestScope.acaPromo.acaPromoNo}">
									 <input type="hidden" name="acaPromoTitle" value="${requestScope.acaPromo.acaPromoTitle}">
									 <input type="hidden" name="acaPromoContent" value="${requestScope.acaPromo.acaPromoContent}">	
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

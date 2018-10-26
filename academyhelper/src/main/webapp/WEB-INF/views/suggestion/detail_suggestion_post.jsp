<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<meta charset="utf-8">
 <%@ taglib prefix="sec" uri="http://www.springframework.org/security/tags" %>
<script type="text/javascript">
$(document).ready(function(){
	$("#deleteSug").submit(function(){
		if(confirm("삭제하시겠습니까?")==false){
			return false;
		}else{
			return true;
		}
	});//submit
	$("#updateSug").submit(function(){
		if(confirm("수정하시겠습니까?")==false){
			return false;
		}else{
			return true;
		}
	});//click
});//ready
</script>

<div class="container">
	<div class="row">
		<div class="col-sm-1"></div>
		<div class="col-sm-10 text-center" style="margin-top: 100px; padding-bottom: 100px;">
			<div style="margin-top: 100px; text-align: center;" align="center">
				<table class="table">
					<thead>
				   		<tr>
							<td colspan="8" align="center"><h3>건의사항 상세보기</h3></td>
						</tr>
						<tr>
							<td style="border-top:0px"></td>
						</tr>
					</thead>
				   <tbody>
				      	<c:set var="vo" value="${requestScope.vo}" />
				         <tr>
				            <th>글번호</th>
				            <td>${vo.sugNo}</td>
				            <th>글제목</th>
				            <td>${vo.sugTitle}</td>
				            <th>작성자</th>
				            <td>${vo.userVO.nickname}</td>
				            <th>등록일</th>
				            <td>${vo.sugRegdate}</td>
				         </tr>
				         <tr>
				         	<th colspan="1">내용</th>
				         	<td colspan="7"><pre style="white-space: pre-wrap;">${vo.sugContent}</pre></td>
				         </tr>
			      		<sec:authorize access="hasRole('ROLE_USER')">
			      		<sec:authentication var="mvo" property="principal"/>
						<c:if test="${mvo.usrId==vo.userVO.usrId}">
					      <tr>
					      	<td colspan="8" align="right">
							   	<button form="deleteSug" type="submit" class="aca-btn">삭제</button>
								<button form="updateSug" type="submit" class="aca-btn">수정</button>
							 	<form action="deleteSuggestionPost.do" id="deleteSug" method="post">
									<sec:csrfInput/>
									<input type="hidden" name="sugNo" value="${vo.sugNo}">
								</form>
								<form action="updateSuggestionPostForm.do" id="updateSug" method="post">
									<sec:csrfInput/>
									<input type="hidden" name="sugNo" value="${vo.sugNo}">
									<input type="hidden" name="sugTitle" value="${vo.sugTitle}">
									<input type="hidden" name="sugContent" value="${vo.sugContent}">
								</form>
					      	</td>
					      </tr>
					      </c:if>
						</sec:authorize>
					</tbody>
					<tfoot>
					</tfoot>
				</table>
			</div>
		</div>
		<div class="col-sm-1"></div>
	</div>
</div>

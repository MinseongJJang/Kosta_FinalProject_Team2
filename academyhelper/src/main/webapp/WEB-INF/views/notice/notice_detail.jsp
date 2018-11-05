<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="sec" uri="http://www.springframework.org/security/tags" %>

<meta charset="utf-8">
<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.2.1/jquery.min.js"></script>
<script type="text/javascript">
   $(document).ready(function(){
   	$("#deleteForm").submit(function(){ 
   		return confirm("게시물을 삭제하시겠습니까?");    		
   	});
   	$("#updateForm").submit(function(){  
   		return confirm("게시물을 수정하시겠습니까?");
   	});
   });	
</script>
<!-- container-fluid: 화면 너비와 상관없이 항상 100% -->

<div class="container">
	<div class="row">
		<div class="col-sm-1"></div>
		<div class="col-sm-10 text-center">
			<div style="margin-top: 100px; text-align: center;" align="center">
				<table class="table">
					<thead>
				   		<tr>
							<td colspan="8" align="center"><h3>공지사항</h3></td>
						</tr>
						<tr>
							<td style="border-top:0px"></td>
						</tr>
					</thead>
				   <tbody>
				      	<c:set var="detailQNA" value="${requestScope.detailQNA}" />
				         <tr>
				            <th>글번호</th>
				            <td>${requestScope.nvo.noticeNo }</td>
				            <th>제목</th>
				            <td>${requestScope.nvo.noticeTitle} </td>
				            <th>작성자</th>
				            <td>${requestScope.nvo.userVO.usrName }</td>
				            <th>등록일</th>
				            <td>${requestScope.nvo.noticeRegdate }</td>
				         </tr>
				         <tr>
				         	<th colspan="1">내용</th>
				         	<td colspan="7"><pre style="white-space: pre-wrap;">${requestScope.nvo.noticeContent}</pre></td>
				         </tr>
			      		<sec:authorize access="hasRole('ROLE_ADMIN')">
					      <tr>
					      	<td colspan="8" align="right">
							   	<button form="deleteForm" type="submit" class="aca-btn">삭제</button>
								<button form="updateForm" type="submit" class="aca-btn">수정</button>
							 	<form action="deleteNotice.do" id="deleteForm" method="post">
									<sec:csrfInput />
									<input type="hidden" name="noticeNo" value="${requestScope.nvo.noticeNo}">
								</form>
								<form action="updateNoticeForm.do" id="updateForm" method="post">
									<input type="hidden" name="noticeNo" value="${requestScope.nvo.noticeNo}">
									 <input type="hidden" name="noticeTitle" value="${requestScope.nvo.noticeTitle}">
									 <input type="hidden" name="noticeContent" value="${requestScope.nvo.noticeContent}">	
									<sec:csrfInput />
									<input type="hidden" name="qnaNo" value="${detailQNA.qnaNo}">
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

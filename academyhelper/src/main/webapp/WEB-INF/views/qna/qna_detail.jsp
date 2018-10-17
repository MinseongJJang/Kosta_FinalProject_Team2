<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="sec" uri="http://www.springframework.org/security/tags" %>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
  <script src="https://ajax.googleapis.com/ajax/libs/jquery/3.2.1/jquery.min.js"></script>
  <script src="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/js/bootstrap.min.js"></script>
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
<div>
	<c:set var="detailQNA" value="${requestScope.detailQNA}" />
	<table border="1">
		<tr>
			<td>글번호</td>
			<td>${detailQNA.qnaNo}</td>
		</tr>
		<tr>
			<td>글제목</td>
			<td>${detailQNA.qnaTitle}</td>
		</tr>
		<tr>
			<td>작성자</td>
			<td>${detailQNA.userVO.usrId}</td>
		</tr>
		<tr>
			<td>등록일</td>
			<td>${detailQNA.qnaRegdate}</td>
		</tr>
		<tr>
			<td>내용</td>
			<td>${detailQNA.qnaContent}</td>
		</tr>
	</table>
	<%-- <c:if test="${requestScope.pvo.memberVO.id==sessionScope.mvo.id}"> --%>
		 <button form="deleteForm" type="submit">삭제</button>
		 <button form="updateForm" type="submit">수정</button>
		 <form action="deleteAcaQNA.do" id="deleteForm" method="post">
		 	 <sec:csrfInput />
		 <input type="hidden" name="qnaNo" value="${detailQNA.qnaNo}">			
		 </form>
		 <form action="updateAcaQNAForm.do" id="updateForm" method="post">
		 	 <sec:csrfInput />
		 <input type="hidden" name="qnaNo" value="${detailQNA.qnaNo}">			
		 </form>			 
	<%--  </c:if> --%>
</div>

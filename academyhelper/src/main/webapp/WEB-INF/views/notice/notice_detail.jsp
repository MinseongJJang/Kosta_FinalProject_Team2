<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="sec" uri="http://www.springframework.org/security/tags" %>

<!DOCTYPE html>
<html lang="en">
<head>
  <title>board</title>
  <meta charset="utf-8">
  <meta name="viewport" content="width=device-width, initial-scale=1">
  <link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/css/bootstrap.min.css">
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
</head>
<body>
<!-- container-fluid: 화면 너비와 상관없이 항상 100% -->
<div class="container-fluid">
  <div class="row header">
    <div class="col-sm-2" ></div>
    <div class="col-sm-8" align="right">
    </div>
    <div class="col-sm-2" ></div>
  </div>
  <div class="row main">
    <div class="col-sm-2" ></div>
    <div class="col-sm-8">
<table  class="table">
		<tr>
			<td>글번호 ${requestScope.nvo.noticeNo }</td>
			<td>제목: ${requestScope.nvo.noticeTitle} </td>
			<td>작성자 :  ${requestScope.nvo.userVO.usrName }</td>
			<td>${requestScope.nvo.noticeRegdate }</td>
		</tr>
		<tr>
			<td colspan="5" class="content">
			<pre>${requestScope.nvo.noticeContent}</pre>
			</td>
		</tr>
		<tr>
			<td colspan="5" class="btnArea">
			 <button form="deleteForm" type="submit">삭제</button>
			 <button form="updateForm" type="submit">수정</button>
			 
			 <form action="deleteNotice.do" id="deleteForm" method="post">
			 <sec:csrfInput />
			 <input type="hidden" name="noticeNo" value="${requestScope.nvo.noticeNo}">			
			 </form>
			 <form action="updateNoticeForm.do" id="updateForm" method="post">
			 <sec:csrfInput />
			 <input type="hidden" name="noticeNo" value="${requestScope.nvo.noticeNo}">
			 <input type="hidden" name="noticeTitle" value="${requestScope.nvo.noticeTitle}">
			 <input type="hidden" name="noticeContent" value="${requestScope.nvo.noticeContent}">			
			 </form>
			</td>
		</tr>
	</table>
    </div>
    <div class="col-sm-2" ></div>
  </div>
</div>
</body>
</html>
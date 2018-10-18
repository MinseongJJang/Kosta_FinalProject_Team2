<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
  <script src="https://ajax.googleapis.com/ajax/libs/jquery/3.3.1/jquery.min.js"></script>
	<div class="row">
		<div class="col-sm-2"></div>
	    <div class="col-sm-8">
	    	<form action="registerFAQForm.do" method="get">
	    	<input type="submit" value="글등록">
	    	</form>
	    </div>
   	    <div class="col-sm-2"></div>
    </div>
	<div class="row">
    <div class="col-sm-2"></div>
    <div class="col-sm-8">
		<c:forEach var="pvo" varStatus="i" items="${requestScope.lvo.faqList}">		
			<div class="panel-group" id="accordion">
			    <div class="panel panel-default">
			      <div class="panel-heading">
			      	<div class="row">
			      	<div class="col-sm-2">질문</div>
			      	<div class="col-sm-8 panel-title">
			          <a data-toggle="collapse" data-parent="#accordion" href="#collapse${i.index}">${pvo.faqTitle }</a>
			        </div>
			        <div class="col-sm-1"><a href="deleteFAQ.do?faqNo=${pvo.faqNo }">삭제</a></div>
			        <div class="col-sm-1"><a href="updateFAQForm.do?faqNo=${pvo.faqNo }">수정</a></div>
			        </div>
			      </div>
			      <div id="collapse${i.index}" class="panel-collapse collapse">
			        <div class="row">
			      	<div class="col-sm-2 panel-body">&nbsp;&nbsp;&nbsp;&nbsp;답변</div>
			      	<div class="col-sm-8 panel-body">${pvo.faqContent }
			        </div>
			        <div class="col-sm-2"></div>
			        </div>
			      </div>
			    </div>
			    </div>
		</c:forEach>	
		</div>
	</div>








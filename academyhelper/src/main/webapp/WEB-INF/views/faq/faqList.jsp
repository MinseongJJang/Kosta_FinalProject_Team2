<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
  <meta name="viewport" content="width=device-width, initial-scale=1">
  <link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/css/bootstrap.min.css">
  <script src="https://ajax.googleapis.com/ajax/libs/jquery/3.3.1/jquery.min.js"></script>
  <script src="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/js/bootstrap.min.js"></script>
<div class="container-fluid">
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
			      	<div class="col-sm-2">Q</div>
			      	<div class="col-sm-8 panel-title">
			          <a data-toggle="collapse" data-parent="#accordion" href="#collapse${i.index}">${pvo.faqTitle }</a>
			        </div>
			        <div class="col-sm-1"><a href="deleteFAQ.do?faqNo=${pvo.faqNo }">삭제</a></div>
			        <div class="col-sm-1"><a href="updateFAQForm.do?faqNo=${pvo.faqNo }">수정</a></div>
			        </div>
			      </div>
			      <div id="collapse${i.index}" class="panel-collapse collapse">
			        <div class="row">
			      	<div class="col-sm-2 panel-body">&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;A</div>
			      	<div class="col-sm-8 panel-body">${pvo.faqContent }
			        </div>
			        <div class="col-sm-2"></div>
			        </div>
			      </div>
			    </div>
			    </div>
		</c:forEach>	
		</div>
<div class="pagingInfo">
	<%-- 코드를 줄이기 위해 pb 변수에 pagingBean을 담는다. --%>
	<c:set var="pb" value="${requestScope.lvo.pb}"></c:set>
	<!-- 
			step2 1) 이전 페이지 그룹이 있으면 화살표 보여준다
				   		페이징빈의 previousPageGroup 이용 
				   2)  이미지에 이전 그룹의 마지막 페이지번호를 링크한다. 
				   	    hint)   startPageOfPageGroup-1 하면 됨 		 
	 -->  
	<!-- step1. 1)현 페이지 그룹의 startPage부터 endPage까지 forEach 를 이용해 출력한다
				   2) 현 페이지가 아니면 링크를 걸어서 서버에 요청할 수 있도록 한다.
				      현 페이지이면 링크를 처리하지 않는다.  
				      PagingBean의 nowPage
				      jstl choose 를 이용  
				      예) <a href="DispatcherServlet?command=list&pageNo=...">				   
	 -->	
	<ul class="pagination">
	<c:if test="${pb.previousPageGroup}">	
	<li><a href="${pageContext.request.contextPath}/listFAQ.do?pageNo=${pb.startPageOfPageGroup-1}">&laquo;</a></li>
	</c:if>
	<c:forEach var="i" begin="${pb.startPageOfPageGroup}" 
	end="${pb.endPageOfPageGroup}">
	<c:choose>
	<c:when test="${pb.nowPage!=i}">
	<li><a href="${pageContext.request.contextPath}/listFAQ.do?pageNo=${i}">${i}</a></li> 
	</c:when>
	<c:otherwise>
	<li class="active"><a href="#" >${i}</a></li>
	</c:otherwise>
	</c:choose>
	&nbsp;
	</c:forEach>
	<c:if test="${pb.nextPageGroup}">
	<li><a href="${pageContext.request.contextPath}/listFAQ.do?pageNo=${pb.endPageOfPageGroup+1}">&raquo;</a></li>
	</c:if>
	</ul>	 		
	</div> 	
	<!--
			step3 1) 다음 페이지 그룹이 있으면 화살표 보여준다. 
				   		페이징빈의 nextPageGroup 이용 
				   2)  이미지에 이전 그룹의 마지막 페이지번호를 링크한다. 
				   	    hint)   endPageOfPageGroup+1 하면 됨 		 
	 -->
	 </div>
    <div class="col-sm-2" ></div>
  </div>











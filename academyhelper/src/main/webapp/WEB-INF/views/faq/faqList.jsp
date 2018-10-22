<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="sec" uri="http://www.springframework.org/security/tags"%>
<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.3.1/jquery.min.js"></script>

<link href='https://fonts.googleapis.com/css?family=News+Cycle:400,700' rel='stylesheet' type='text/css'>
<link href="https://fonts.googleapis.com/css?family=Lobster" rel="stylesheet" type="text/css">
<link rel="stylesheet"
	href="${pageContext.request.contextPath}/resources/accordian/accordian.css">
<div class="container" >
<h3>자주 묻는 질문</h3>
	<div class="row">	
<div class="col-sm-2"></div>
<div class="col-sm-8">
<aside class="accordion">
	<c:forEach var="pvo" items="${requestScope.lvo.faqList}">
		<h1>Q. ${pvo.faqTitle}</h1>
		<div>
			<h2>A. ${pvo.faqContent}</h2>
		</div>
	</c:forEach>
</aside>
</div>
<div class="col-sm-2"></div>

<sec:authorize access="hasRole('ROLE_ADMIN')">
	<button form="registerFAQForm.do" type="submit" class="aca-btn">FAQ 등록</button>
		<form action="${pageContext.request.contextPath}/registerFAQForm.do" id="registerFAQForm.do" method="post">
			<sec:csrfInput />
		</form>
</sec:authorize>
 </div>
 </div>
<script src="//ajax.googleapis.com/ajax/libs/jquery/2.0.3/jquery.min.js"></script>
<script type="text/javascript">
var headers = ["H1","H2"];

$(".accordion").click(function(e) {
  var target = e.target,
      name = target.nodeName.toUpperCase();
  
  if($.inArray(name,headers) > -1) {
    var subItem = $(target).next();
    
    //slideUp all elements (except target) at current depth or greater
    var depth = $(subItem).parents().length;
    var allAtDepth = $(".accordion p, .accordion div").filter(function() {
      if($(this).parents().length >= depth && this !== subItem.get(0)) {
        return true; 
      }
    });
    $(allAtDepth).slideUp("fast");
    
    //slideToggle target content and adjust bottom border if necessary
    subItem.slideToggle("fast",function() {
        $(".accordion :visible:last").css("border-radius","0 0 10px 10px");
    });
    $(target).css({"border-bottom-right-radius":"0", "border-bottom-left-radius":"0"});
  }
});
</script>
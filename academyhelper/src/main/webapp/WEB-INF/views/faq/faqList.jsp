<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="sec" uri="http://www.springframework.org/security/tags"%>
<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.3.1/jquery.min.js"></script>
<link rel="stylesheet" href="${pageContext.request.contextPath}/resources/accordian/accordian.css">


<div class="container" >
	<div class="row">
		<div class="col-sm-1"></div>
		<div class="col-sm-10 text-center" 	style="margin-top: 100px; padding-bottom: 100px;">
			<div style="margin-top: 100px; text-align:center;" align="center">
				<table class="table">
				   <thead style="text-align:center;">
					   	<tr>
							<td align="center"><h3>자주 묻는 질문</h3></td>
						</tr>
						<tr>
							<td style="border-top:0px"></td>
						</tr>
				   </thead>
				   <tbody>
				 		<tr>
				 			<td>
				 				<aside class="accordion">
									<c:forEach var="pvo" items="${requestScope.lvo.faqList}">
										<h1 style="algin:left">Q. ${pvo.faqTitle}</h1>
										<div>
											<h2 style="algin:left">A. ${pvo.faqContent}</h2>
										</div>
									</c:forEach>
								</aside>
				 			</td>
				 		</tr>
				 		<sec:authorize access="hasRole('ROLE_ADMIN')">
					      <tr>
					      	<td colspan="4" align="right">
							   <button form="registerFAQForm.do" type="submit" class="aca-btn">질문 등록</button>
							   <form action="${pageContext.request.contextPath}/registerFAQForm.do" id="registerFAQForm.do" method="post">
							      <sec:csrfInput />
							   </form>
					      	</td>
					      </tr>
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
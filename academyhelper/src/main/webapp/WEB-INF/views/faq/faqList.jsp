<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="sec" uri="http://www.springframework.org/security/tags"%>

<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.3.1/jquery.min.js"></script>
 
  <div class="container" >
	<div class="row">
		<div class="col-sm-1"></div>
		<div class="col-sm-10 text-center" 	style="margin-top: 100px; padding-bottom: 100px;">
			<div style="margin-top: 100px; text-align:center;">
				<table class="table table-hover">
				   <thead style="text-align:center;">
				   		<tr>
							<td colspan="2" align="center"><h3>자주 묻는 질문</h3></td>
						</tr>
				   </thead>
				   <tbody>
				      <c:forEach var="pvo" varStatus="i" items="${requestScope.lvo.faqList}">	
				         <tr>
				             <td align="left" colspan="2" bgcolor="#004e92" bordercolor="#004e92" style="font-color:white;"><span style="color:white; size:2em;">질문 &nbsp; ${i.index+1}&nbsp; &nbsp; :&nbsp; &nbsp; ${pvo.faqTitle }</span></td>
				         </tr>
				         <tr>
				         	<td align="left">
				         		답변 &nbsp; ${i.index+1}&nbsp; &nbsp; :&nbsp; &nbsp; ${pvo.faqContent }
			         		</td>
			         		<td align="right">
			         			<a href="deleteFAQ.do?faqNo=${pvo.faqNo }">삭제</a>&nbsp;&nbsp;<a href="updateFAQForm.do?faqNo=${pvo.faqNo }">수정</a>
			         		</td>
				         </tr>
				      </c:forEach>
			      		<sec:authorize access="hasRole('ROLE_USER')">
					      <tr>
					      	<td colspan="4" align="right">
							   <button form="registerFAQForm.do" type="submit" class="aca-btn">FAQ 등록</button>
							   <form action="${pageContext.request.contextPath}/registerQNAForm.do" id="registerFAQForm.do" method="post">
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






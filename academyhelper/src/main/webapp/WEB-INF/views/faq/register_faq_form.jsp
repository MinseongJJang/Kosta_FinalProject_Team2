<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="sec" uri="http://www.springframework.org/security/tags" %>
<div class="row main">
<<<<<<< HEAD
			<div class="col-sm-2"></div>
			<div class="col-sm-8">
				<sec:authentication var="mvo" property="principal"/>
				<form method="post" id="updateForm"
					action="${pageContext.request.contextPath}/registerFAQ.do">
					<sec:csrfInput />
					<table class="table">
						<tr>
							<td>제목 &nbsp;&nbsp; <input type="text" name="faqTitle" required="required">
							</td>
						</tr>
						<tr>
							<td><textarea cols="90" rows="15" name="faqContent"
									required="required"></textarea></td>
						</tr>
					</table>
					<div class="btnArea">
						<button type="submit" class="btn">등록</button>
						<input type="hidden" value="${mvo.usrId}" name="userVO.usrId">
						<button type="reset" class="btn">취소</button>
					</div>					
				</form>
			</div>
			<div class="col-sm-2"></div>
		</div>
=======
	<div class="col-sm-2"></div>
	<div class="col-sm-8">
		<sec:authentication var="mvo" property="principal" />  
		<form method="post" id="updateForm" action="${pageContext.request.contextPath}/registerFAQ.do">
			<sec:csrfInput />
			<table class="table">
				<tr>
					<td>제목 &nbsp;&nbsp; <input type="text" name="faqTitle" required="required">
					</td>
				</tr>
				<tr>
					<td><textarea cols="90" rows="15" name="faqContent"	required="required"></textarea></td>
				</tr>
			</table>
			<div class="btnArea">
				<button type="submit" class="btn">등록</button>
		        <input type="hidden" value="${mvo.usrId}" name="userVO.usrId">
				<button type="reset" class="btn">취소</button>
			</div>					
		</form>
	</div>
	<div class="col-sm-2"></div>
</div>
>>>>>>> branch 'master' of https://github.com/MinseongJJang/Kosta_FinalProject_Team2.git

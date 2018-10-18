<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%-- spring security custom tag를 사용하기 위한 선언 --%>
<%@taglib prefix="sec" uri="http://www.springframework.org/security/tags"%>
<style>
.test{
	 border : 2px solid #004e92;
	 width:400px;
}
table td{
	padding:20px;
}
</style> 
<div class="container" >
	<div class="row">
		<div class="col-sm-3"></div>
		<div class="col-sm-6 text-center" 	style="margin-top: 100px; padding-bottom: 100px;">
			<div style="margin-top: 100px; text-align:center;" align="center">
				<table class="test" >
					<tr>
						<td>
							<h3>회원 로그인</h3>
							<form action="${pageContext.request.contextPath}/login.do" method="post" id="loginForm" >
							<sec:csrfInput/>
							<table style="width:400px; align:center;">
								<tr>
									<td colspan="3">
									<fieldset>
										<input type="text" class="form-control" name="usrId" placeholder="아이디" id="login_text">
									</fieldset>
									</td>
								</tr>
								<tr>
									<td colspan="3">
									<fieldset>
									 	<input type="password" class="form-control" placeholder="패스워드" name="usrPass" id="login_text">
									</fieldset>
									</td>
								</tr>
								<tr>
								<c:if test="${param.fail == 'true'}">
									<td colspan="3"> <span id="loginCheck" style="color:red;">${SPRING_SECURITY_LAST_EXCEPTION.message}</span></td>
								</c:if>							
								</tr>
								<tr>
									<td colspan="3" align="right"> <button type="submit" style="WIDTH: 70pt; HEIGHT: 30pt; margin-bottom:10px;" class="aca-btn">로그인</button></td>
								</tr>
								
								
								<tr>
									<td colspan="2" align="right">
										<a href="${pageContext.request.contextPath}/user/aca_register_form.do">기업 회원 가입</a>
									</td>
			               			<td colspan="1" align="right">
			               				<a href="${pageContext.request.contextPath}/user/register_form.do">회원가입</a>
		               				</td>
								</tr>
								<tr>
			                		<td colspan="2" align="right"><a href="#">아이디 찾기</a></td>
			                		<td colspan="1" align="right"><a href="#">비밀번호 찾기</a></td>
								</tr>
							</table>
							</form>
						</td>
					</tr>
				</table>
			</div>
		</div>
		<div class="col-sm-3"></div>
	</div>
</div>




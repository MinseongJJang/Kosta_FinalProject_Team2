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
<script type="text/javascript">
	$(document).ready(function(){
		$('#loginBtn').click(function(){
			$.ajax({
				type : "post",
				url : "${pageContext.request.contextPath}/loginCheck.do",
				data : "usrId="+$('#login_id').val()+"&usrPass="+$('#login_pass').val(),
				beforeSend : function(xhr){   /*데이터를 전송하기 전에 헤더에 csrf값을 설정한다*/
                    xhr.setRequestHeader("${_csrf.headerName}", "${_csrf.token}");
                },
                success:function(loginCheck){
					if(loginCheck == 1){
						$("#loginForm").submit();
					}else{
						$("#checkResult").html("아이디 또는 비밀번호가 틀립니다").css("color","red");
						$("#login_id").val("");
						$("#login_pass").val("");
						$("#login_id").focus();
					}
				}
			});//ajax
		});//click
		$("#login_pass").keyup(function(event){
				if(event.keyCode==13){
					$.ajax({
						type : "post",
						url : "${pageContext.request.contextPath}/loginCheck.do",
						data : "usrId="+$('#login_id').val()+"&usrPass="+$('#login_pass').val(),
						beforeSend : function(xhr){   /*데이터를 전송하기 전에 헤더에 csrf값을 설정한다*/
		                    xhr.setRequestHeader("${_csrf.headerName}", "${_csrf.token}");
		                },
		                success:function(loginCheck){
							if(loginCheck == 1){
								$("#loginForm").submit();
							}else{
								$("#checkResult").html("아이디 또는 비밀번호가 틀립니다").css("color","red");
								$("#login_id").val("");
								$("#login_pass").val("");
								$("#login_id").focus();
							}
						}
					});//ajax
				}
		});//keyup
	});//ready
</script>
<div class="container" >
	<div class="row">
		<div class="col-sm-2"></div>
		<div class="col-sm-8 text-center" 	style="margin-top: 100px; padding-bottom: 100px;">
			<div style="margin-top: 100px; text-align:center;" align="center">
				<table class="test" >
					<tr>
						<td>
							<h3>회원 로그인</h3>
							<form method="post" id="loginForm"  action="${pageContext.request.contextPath}/login.do">
							<sec:csrfInput/>
							<table style="width:400px; align:center;">
								<tr>
									<td colspan="3">
										<input type="text" class="form-control" name="usrId" placeholder="아이디" id="login_id">
									</td>
								</tr>
								<tr>
									<td colspan="3">
									 	<input type="password" class="form-control" placeholder="패스워드" name="usrPass" id="login_pass">
									</td>
								</tr>
								<!-- 
								<tr>
								<c:if test="${param.fail == 'true'}">
									<td colspan="3"> <span id="loginCheck" style="color:red;">${SPRING_SECURITY_LAST_EXCEPTION.message}</span></td>
								</c:if>							
								</tr>
								 -->
								<tr>
									<td><span id="checkResult"></span></td>
									<td colspan="2" align="right"> <button type="button"  id="loginBtn" style="WIDTH: 70pt; HEIGHT: 30pt; margin-bottom:10px;" class="aca-btn">로그인</button></td>
								</tr>
								<tr>
			               			<td colspan="3" align="right">
			               				<a href="registerForm.do">회원가입</a>
		               				</td>
								</tr>
								<tr>
			                		<td colspan="2" align="right"><a href="findIdForm.do">아이디 찾기</a></td>
			                		<td colspan="1" align="right"><a href="findPasswordForm.do">비밀번호 찾기</a></td>
								</tr>
							</table>
							</form>
						</td>
					</tr>
				</table>
			</div>
		</div>
		<div class="col-sm-2"></div>
	</div>
</div>




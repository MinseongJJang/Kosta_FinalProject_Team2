<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    <%@ taglib prefix="sec" uri="http://www.springframework.org/security/tags" %>
<script type="text/javascript">
	$(document).ready(function(){
		var checkResultId="";
		$("#regForm :input[name=usrId]").keyup(function(){
			var usrId=$(this).val().trim();
			if(usrId.length<4 || usrId.length>10){
				$("#idCheckView").html("아이디는 4자이상 10자 이하여야 함!").css(
						"background","pink");
				checkResultId="";
				return;
			}
			// spring security 적용시 ajax post 방식은 아래와 같이 beforeSend property에서 csrf 값을 셋팅해야 함 
			$.ajax({
				type:"post",
				url:"${pageContext.request.contextPath}/idcheckAjax.do",				
				data:"usrId="+usrId,	
				beforeSend : function(xhr){   /*데이터를 전송하기 전에 헤더에 csrf값을 설정한다*/
                    xhr.setRequestHeader("${_csrf.headerName}", "${_csrf.token}");
                },
				success:function(data){						
					if(data=="fail"){
					$("#idCheckView").html(usrId+" 사용불가!").css("background","red");
						checkResultId="";
					}else{						
						$("#idCheckView").html(usrId+" 사용가능!").css(
								"background","yellow");		
						checkResultId=usrId;
					}					
				}//callback			
			});//ajax
		});//keyup
	});//ready
</script>
<style>
.test{
	 border : 2px solid #004e92;
	 width:600px;
}
table td{
	padding:20px;
}
</style> 
<div class="container" >
	<div class="row">
		<div class="col-sm-2"></div>
		<div class="col-sm-7 text-center" 	style="margin-top: 100px; padding-bottom: 100px;">
			<div style="margin-top: 100px; text-align:center;" align="center">
				<form method="post" action="${pageContext.request.contextPath}/registerUser.do" id="regForm">
				<sec:csrfInput/><%-- csrf 토큰 --%>
				<table class="test" >
					<tr>
						<td colspan="2" align="center"><h3>일반 회원 가입</h3></td>
					</tr>
					<tr>
						<td>
							아이디
						</td>
						<td>
							<input type="text" name="usrId" id="usrId" required="required">
						</td>
					</tr>
					<tr>
						<td style="padding:5px;" colspan="2" align="center"><span id="idCheckView"></span></td>
					</tr>
					<tr>
						<td>
							비밀번호
						</td>
						<td>
							 <input type="password" name="usrPass" required="required">
						</td>
					</tr>
					<tr>
						<td>
							이름
						</td>
						<td>
							 <input type="text" name="usrName" required="required">
						</td>
					</tr>
					<tr>
						<td>
							주소
						</td>
						<td>
							 <input type="text" name="usrAddr" required="required">
						</td>
					</tr>
					<tr>
						<td>
							닉네임
						</td>
						<td>
							 <input type="text" name="nickname" required="required">
						</td>
					</tr>
					<tr>
						<td>
							생년월일
						</td>
						<td>
							 <input type="text" name="birthday" required="required">
						</td>
					</tr>
					<tr>
						<td>
							전자메일
						</td>
						<td>
							 <input type="text" name="usrEmail" required="required">
						</td>
					</tr>
					<tr>
						<td>
							폰번호
						</td>
						<td>
							 <input type="text" name="usrTel" required="required">
						</td>
					</tr>
					<tr>
						<td colspan="2" align="right"><button type="submit" class="aca-btn" >가입하기</button></td>
					</tr>
				</table>
				</form>
			</div>
		</div>
	</div>
</div>

								

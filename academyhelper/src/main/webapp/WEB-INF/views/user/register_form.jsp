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
 <div class="col-sm-2" ></div>
    <div class="col-sm-8">
<form method="post" action="${pageContext.request.contextPath}/registerUser.do" id="regForm">
<sec:csrfInput/><%-- csrf 토큰 --%>
아이디 <input type="text" name="usrId" id="usrId" required="required"><span id="idCheckView"></span><br>
비밀번호 <input type="password" name="usrPass" required="required"><br>
이름 <input type="text" name="usrName" required="required"><br>
주소 <input type="text" name="usrAddr" required="required"><br>
닉네임 <input type="text" name="nickname" required="required"><br>
생년월일 <input type="text" name="birthday" required="required"><br>
전자메일<input type="text" name="usrEmail" required="required"><br>
폰번호 <input type="text" name="usrTel" required="required"><br>
<input type="submit" value="가입하기">
</form>
</div>
 <div class="col-sm-2" ></div>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    <%@ taglib prefix="sec" uri="http://www.springframework.org/security/tags" %>
<script type="text/javascript">
	$(document).ready(function(){
		var checkResultId="";
		$("#regForm :input[id=usrId]").keyup(function(){
			var usrId=$(this).val().trim();
			var idReg = /^[a-zA-Z]+[a-z0-9A-Z]{3,19}$/g;
			if( !idReg.test( usrId ) ){
				$("#idCheckView").html("아이디는 영소문자로 시작하는 4~20자 영문자 또는 숫자이어야 합니다.").css(
						"background","red");
				checkResultId="";
				return;
			}
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
		$("#regForm :input[name=usrPassRepeat]").keyup(function(){
			if($("input[name=userVO.usrPass]").val()==$("input[name=userVO.usrPassRepeat]").val()){
				$("#passCheckView").html("일치!").css("background","green");
				checkResultPass="";
				return;
			}else{
				$("#passCheckView").html("불일치!").css("background","red");
				checkResultPass="";
			}
		});//keyup
		$("#member").click(function(){
			location.href="${pageContext.request.contextPath}/registerForm.do";
		});
		$("#acamember").click(function(){
			location.href="${pageContext.request.contextPath}/acaRegisterForm.do";
		});
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
				<form method="post" action="${pageContext.request.contextPath}/acaRegisterUser.do" id="regForm">
				<sec:csrfInput/><%-- csrf 토큰 --%>
				<table class="test" >
					<tr>
						<td>
      			  	<button id="member">개인회원가입</button>
     			   </td>
     			   <td colspan="2">
     			    	<button id="acamember">기업회원가입</button>
      				  </td>
					</tr>
					<tr>
							<td style="border-top:0px"></td>
					</tr>
					<tr>
						<td colspan="3" align="center"><h3>기업 회원 가입</h3></td>
					</tr>
					<tr>
						<td>
							아이디
						</td>
						<td colspan="2">
							<input type="text" name="userVO.usrId" id="usrId" required="required">
						</td>
					</tr>
					<tr>
						<td style="padding:5px;" colspan="3" align="center"><span id="idCheckView"></span></td>
					</tr>
					<tr>
						<td>
							비밀번호
						</td>
						<td colspan="2">
							 <input type="password" name="userVO.usrPass" required="required">
						</td>
					</tr>
					<tr>
						<td>
							비밀번호 확인
						</td>
						<td colspan="2">
							 <input type="password" name="userVO.usrPassRepeat" required="required">
						</td>
					</tr>
					<tr>
						<td style="padding:5px;" colspan="3" align="center"><span id="passCheckView"></span></td>
					</tr>
					<tr>
						<td>
							이름
						</td>
						<td colspan="2">
							 <input type="text" name="userVO.usrName" required="required">
						</td>
					</tr>
					<tr>
						<td>
							주소
						</td>
					 <td> <input type="text" name="userVO.usrAddr" id="address" placeholder="주소"></td>
						 <td>
						 <span>
						 <input type="button" onclick="address_execDaumPostcode()" value="주소검색" >
						 </span>
                        <span id="guide" style="color:#999"></span>
                        </td>
					</tr>
					<tr>
						<td>
							닉네임
						</td>
						<td colspan="2">
							 <input type="text" name="userVO.nickname" required="required">
						</td>
					</tr>
					<tr>
						<td>
							생년월일
						</td>
						<td colspan="2">
							<input type="date" name="userVO.birthday" required="required">
						</td>
					</tr>
					<tr>
						<td>
							전자메일
						</td>
						<td colspan="2">
							 <input type="email" name="userVO.usrEmail" required="required">
						</td>
					</tr>
					<tr>
						<td>
							폰번호
						</td>
						<td colspan="2">
							 <input type="text" name="userVO.usrTel" required="required">
						</td>
					</tr>
					<tr>
						<td>
							사업자번호
						</td>
						<td colspan="2">
							 <input type="text" name="busiRegNum" required="required">
						</td>
					</tr>
					<tr>
						<td>
							기관명
						</td>
						<td colspan="2">
							 <input type="text" name="acaName" required="required">
						</td>
					</tr>
					<tr>
						<td>
							기관주소
						</td>
						 <td> <input type="text" name="acaAddr" id="aca_address" placeholder="주소" ></td>
						 <td>
						 <span>
						 <input type="button" onclick="aca_address_execDaumPostcode()" value="주소검색" >
						 </span>
                        <span id="guide" style="color:#999"></span>
                        </td>
					</tr>
					<tr>
						<td>
							기관전화번호
						</td>
						<td colspan="2">
							<input type="text" name="acaTel" required="required">
						</td>
					</tr>
					<tr>
						<td colspan="3" align="right"><button type="submit" class="aca-btn" >가입하기</button></td>
					</tr>
				</table>
				</form>
			</div>
		</div>
	</div>
</div>
<script src="http://dmaps.daum.net/map_js_init/postcode.v2.js"></script>
<script>
	//일반회원
    //본 예제에서는 도로명 주소 표기 방식에 대한 법령에 따라, 내려오는 데이터를 조합하여 올바른 주소를 구성하는 방법을 설명합니다.
    function address_execDaumPostcode() {
        new daum.Postcode({
            oncomplete: function(data) {
                // 팝업에서 검색결과 항목을 클릭했을때 실행할 코드를 작성하는 부분.

                // 도로명 주소의 노출 규칙에 따라 주소를 조합한다.
                // 내려오는 변수가 값이 없는 경우엔 공백('')값을 가지므로, 이를 참고하여 분기 한다.
                var fullRoadAddr = data.roadAddress; // 도로명 주소 변수
                var extraRoadAddr = ''; // 도로명 조합형 주소 변수

                // 법정동명이 있을 경우 추가한다. (법정리는 제외)
                // 법정동의 경우 마지막 문자가 "동/로/가"로 끝난다.
                if(data.bname !== '' && /[동|로|가]$/g.test(data.bname)){
                    extraRoadAddr += data.bname;
                }
                // 건물명이 있고, 공동주택일 경우 추가한다.
                if(data.buildingName !== '' && data.apartment === 'Y'){
                   extraRoadAddr += (extraRoadAddr !== '' ? ', ' + data.buildingName : data.buildingName);
                }
                // 도로명, 지번 조합형 주소가 있을 경우, 괄호까지 추가한 최종 문자열을 만든다.
                if(extraRoadAddr !== ''){
                    extraRoadAddr = ' (' + extraRoadAddr + ')';
                }
                // 도로명, 지번 주소의 유무에 따라 해당 조합형 주소를 추가한다.
                if(fullRoadAddr !== ''){
                    fullRoadAddr += extraRoadAddr;
                }

                // 우편번호와 주소 정보를 해당 필드에 넣는다.
                document.getElementById("address").value = data.zonecode; //5자리 새우편번호 사용
                document.getElementById("address").value = fullRoadAddr;
                document.getElementById("address").value = data.jibunAddress;

                // 사용자가 '선택 안함'을 클릭한 경우, 예상 주소라는 표시를 해준다.
                if(data.autoRoadAddress) {
                    //예상되는 도로명 주소에 조합형 주소를 추가한다.
                    var expRoadAddr = data.autoRoadAddress + extraRoadAddr;
                    document.getElementById('guide').innerHTML = '(예상 도로명 주소 : ' + expRoadAddr + ')';

                } else if(data.autoJibunAddress) {
                    var expJibunAddr = data.autoJibunAddress;
                    document.getElementById('guide').innerHTML = '(예상 지번 주소 : ' + expJibunAddr + ')';

                } else {
                    document.getElementById('guide').innerHTML = '';
                }
            }
        }).open();
    }
	//학원회원
    function aca_address_execDaumPostcode() {
        new daum.Postcode({
            oncomplete: function(data) {
                // 팝업에서 검색결과 항목을 클릭했을때 실행할 코드를 작성하는 부분.

                // 도로명 주소의 노출 규칙에 따라 주소를 조합한다.
                // 내려오는 변수가 값이 없는 경우엔 공백('')값을 가지므로, 이를 참고하여 분기 한다.
                var fullRoadAddr = data.roadAddress; // 도로명 주소 변수
                var extraRoadAddr = ''; // 도로명 조합형 주소 변수

                // 법정동명이 있을 경우 추가한다. (법정리는 제외)
                // 법정동의 경우 마지막 문자가 "동/로/가"로 끝난다.
                if(data.bname !== '' && /[동|로|가]$/g.test(data.bname)){
                    extraRoadAddr += data.bname;
                }
                // 건물명이 있고, 공동주택일 경우 추가한다.
                if(data.buildingName !== '' && data.apartment === 'Y'){
                   extraRoadAddr += (extraRoadAddr !== '' ? ', ' + data.buildingName : data.buildingName);
                }
                // 도로명, 지번 조합형 주소가 있을 경우, 괄호까지 추가한 최종 문자열을 만든다.
                if(extraRoadAddr !== ''){
                    extraRoadAddr = ' (' + extraRoadAddr + ')';
                }
                // 도로명, 지번 주소의 유무에 따라 해당 조합형 주소를 추가한다.
                if(fullRoadAddr !== ''){
                    fullRoadAddr += extraRoadAddr;
                }

                // 우편번호와 주소 정보를 해당 필드에 넣는다.
                document.getElementById("aca_address").value = data.zonecode; //5자리 새우편번호 사용
                document.getElementById("aca_address").value = fullRoadAddr;
                document.getElementById("aca_address").value = data.jibunAddress;

                // 사용자가 '선택 안함'을 클릭한 경우, 예상 주소라는 표시를 해준다.
                if(data.autoRoadAddress) {
                    //예상되는 도로명 주소에 조합형 주소를 추가한다.
                    var expRoadAddr = data.autoRoadAddress + extraRoadAddr;
                    document.getElementById('guide').innerHTML = '(예상 도로명 주소 : ' + expRoadAddr + ')';

                } else if(data.autoJibunAddress) {
                    var expJibunAddr = data.autoJibunAddress;
                    document.getElementById('guide').innerHTML = '(예상 지번 주소 : ' + expJibunAddr + ')';

                } else {
                    document.getElementById('guide').innerHTML = '';
                }
            }
        }).open();
    }
</script>

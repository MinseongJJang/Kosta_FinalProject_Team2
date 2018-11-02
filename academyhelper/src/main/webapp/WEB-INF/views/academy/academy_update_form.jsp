<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<meta charset="utf-8">
 <%@ taglib prefix="sec" uri="http://www.springframework.org/security/tags" %>
<link href="http://netdna.bootstrapcdn.com/bootstrap/3.3.5/css/bootstrap.css" rel="stylesheet">
<script src="http://cdnjs.cloudflare.com/ajax/libs/jquery/3.2.1/jquery.js"></script>
<script src="http://netdna.bootstrapcdn.com/bootstrap/3.3.5/js/bootstrap.js"></script>
<link href="http://cdnjs.cloudflare.com/ajax/libs/summernote/0.8.9/summernote.css" rel="stylesheet">
<script src="http://cdnjs.cloudflare.com/ajax/libs/summernote/0.8.9/summernote.js"></script>

<script type="text/javascript">
$(document).ready(function(){
	$("#updateAca").submit(function(){
		if(confirm("수정하시겠습니까?")==false){
			return false;
		}else{
			return true;
		}
	});//submit
});//ready
</script>
	<sec:authorize access="hasRole('ROLE_ADMIN')">
	<sec:authentication var="mvo" property="principal" />  
	
	<form action="updateAcademy.do" id="updateAca" method="post">
	<c:set var="de" value="${requestScope.test}" />
	<table>
		<tr>
			<td>학원번호</td>
			<td>
			&nbsp;&nbsp;${de.acaNo}
				<input type="hidden" name="acaNo" value="${de.acaNo}">
			</td>
		</tr>
		<tr>
			<td>학원이름</td>
			<td>
			<input type="text" name="acaName" value="${de.acaName}" required="required" > 
			</td>
		</tr>
		<tr>
			<td>학원주소</td>
			<td><input type="text" name="acaAddr" id="sample4_address" placeholder="주소" readonly="readonly" style="width:100%"></td>
				      		<td>
								<span>
									<input type="button" onclick="sample4_execDaumPostcode()"  class="aca-btn" value="주소검색" >
								</span>
								<span id="guide" style="color:#999"></span>
							</td>
		</tr>
		<tr>
			<td>학원전화번호</td>
			<td>
			<input type="text" name="acaTel" value="${de.acaTel}" required="required" > 
			</td>
		</tr>
		<tr>
			<th>등록자이메일</th>
			<td>
			&nbsp;&nbsp;${de.userVO.usrEmail} 
			</td>
		</tr>
		<tr>
			<th>전화번호</th>
			<td>
			&nbsp;&nbsp;${de.userVO.usrTel}
			</td>
		</tr>
		<tr>
			<th>닉네임</th>
			<td>
			&nbsp;&nbsp;${de.userVO.nickname}
			</td>
		</tr>
		<tr>
			<th>아이디</th>
			<td>
			&nbsp;&nbsp;${de.userVO.usrId}
			<!-- <input type="hidden" name="usrId" value="${de.userVO.usrId}"> -->
		 <input type="hidden" value="${mvo.usrId}" name="userVO.usrId">
			
			</td>
		</tr>
		<tr style="height: 250px; ">
				      		<th style="width: 100px;">
				      				<span id="curtime"></span>
				      				<span id="curtime1"></span>
				      				<span id="mainPic"></span>
				      		</th>
				      		
				      		
				      		<td>
					   			<script>
								    $(document).ready(function() {
								    	var curtime = "";
								        $('#acaMainPic').change(function() {
								        	var formData = new FormData();
								        	$.each($("#acaMainPic")[0].files, function(i, file) {
												formData.append("file", file);
											});
								        	$.ajax({
									              data: formData,
									              type: "POST",
									              url: "${pageContext.request.contextPath}/academy-file-upload.do",
									              cache: false,
									              contentType: false,
									              processData: false,
									              beforeSend : function(xhr){   /*데이터를 전송하기 전에 헤더에 csrf값을 설정한다*/
									            		xhr.setRequestHeader("${_csrf.headerName}", "${_csrf.token}");
									         	  },
									              success: function(url) {
									            	var path = "${pageContext.request.contextPath}/resources/academyUpload/"+url[0];
									            	curtime += '<input type="hidden" name="curtime" value="'+url[1]+'">';

									            	$("#curtime").html(curtime);
									            	$("#mainPic").html("<img src="+path+" width=200 height=200/>");
									              }
									          });//ajax
								        });//change
								    });//ready
							 	</script>
						 	</td>
						 </tr>
						 
						 <tr>
						 
							<th>						 메인 사진 선택교육과정 메인사진 (*수정시 이전 메인사진은 메인사진 파일업로드 여부와 상관없이 삭제됩니다.*) 
							<input type="file" id="acaMainPic" name="acaMainPic"></th>
							
				   		</tr>
				   		<tr>
				   		<td>

	<img src="${de.acaMainPic}">
			<ul id="pics">
				<c:forEach items="${de.acaMainPic}" var="mImg">
					<li>${mImg}<%-- <input type="button" value="X" class="button">
						<input type="hidden" name="pics" value="${mImg}"> --%></li>
				</c:forEach>
			</ul> 				      		
				      		</td>
				   		</tr>
				   		
		<tr>
			<th>시설 사진</th>
		</tr>
		<tr>
			<td><textarea cols="90" rows="15"  name="acaContent" id="acaContent"
						required="required" placeholder="본문내용을 입력하세요">${de.acaContent}</textarea> 	
						<script>
						$(document).ready(function() {
							var curtime1 = "";
							$('#acaContent').summernote({
								height : 500,
								minHeight : null,
								maxHeight : null,
								callbacks : {
									onImageUpload : function(files, editor, welEditable) {
										for (var i = files.length - 1; i >= 0; i--) {
											sendFile(files[i],this);
										}
									}
								}
							});//summernote
							function sendFile(file, el) {
								var form_data = new FormData();
								form_data.append("file",file);
								$.ajax({
									data : form_data,
									type : "POST",
									url : "${pageContext.request.contextPath}/academy-file1-upload.do",
									cache : false,
									contentType : false,
									processData : false,
									beforeSend : function(xhr) { /*데이터를 전송하기 전에 헤더에 csrf값을 설정한다*/
									xhr.setRequestHeader("${_csrf.headerName}", "${_csrf.token}");
									},
									success : function(url) {
										var path = "${pageContext.request.contextPath}/resources/academyUpload/"+ url[0];
										curtime1 += '<input type="hidden" name="curtime1" value="'+url[1]+'">';
										$("#curtime1").html(curtime1);
										$(el).summernote("editor.insertImage", path);
										$('#imageBoard > ul').append('<li><img src="'+path+'" width="480" height="auto"/></li>');
									}
								});//ajax
							}//sendFile
						});//ready
					
						</script>
						</td>
		</tr>
		<tr>
			<td colspan="2">위치 사진</td>
		</tr>
	</table>
			   		
	<sec:csrfInput/>
	<input type="submit" value="학원정보수정">
		<input type="reset" value="취소">
	
	</form>
	</sec:authorize>
<script src="http://dmaps.daum.net/map_js_init/postcode.v2.js"></script>
<script>
    //본 예제에서는 도로명 주소 표기 방식에 대한 법령에 따라, 내려오는 데이터를 조합하여 올바른 주소를 구성하는 방법을 설명합니다.
    function sample4_execDaumPostcode() {
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
                document.getElementById("sample4_address").value = data.zonecode; //5자리 새우편번호 사용
                document.getElementById("sample4_address").value = fullRoadAddr;
                document.getElementById("sample4_address").value = data.jibunAddress;

                // 사용자가 '선택 안함'을 클릭한 경우, 예상 주소라는 표시를 해준다.
                if(data.autoRoadAddress) {
                    //예상되는 도로명 주소에 조합형 주소를 추가한다.
                    var expRoadAddr = data.autoRoadAddress + extraRoadAddr;
                    //document.getElementById('guide').innerHTML = '(예상 도로명 주소 : ' + expRoadAddr + ')';
					document.getElementById("sample4_address").value = expRoadAddr;
                } else if(data.autoJibunAddress) {
                    var expJibunAddr = data.autoJibunAddress;
                   //document.getElementById('guide').innerHTML = '(예상 지번 주소 : ' + expJibunAddr + ')';
                    document.getElementById("sample4_address").value = expJibunAddr;
                } else {
                    document.getElementById('guide').innerHTML = '';
                }
            }
        }).open();
    }
</script>

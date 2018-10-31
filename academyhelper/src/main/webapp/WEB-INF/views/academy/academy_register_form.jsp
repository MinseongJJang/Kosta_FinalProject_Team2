<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@taglib prefix="sec"  uri="http://www.springframework.org/security/tags"%> 
<link href="http://netdna.bootstrapcdn.com/bootstrap/3.3.5/css/bootstrap.css" rel="stylesheet">
<script src="http://cdnjs.cloudflare.com/ajax/libs/jquery/3.2.1/jquery.js"></script>
<script src="http://netdna.bootstrapcdn.com/bootstrap/3.3.5/js/bootstrap.js"></script>
<link href="http://cdnjs.cloudflare.com/ajax/libs/summernote/0.8.9/summernote.css" rel="stylesheet">
<script src="http://cdnjs.cloudflare.com/ajax/libs/summernote/0.8.9/summernote.js"></script>
<div class="container">
	<div class="row">
		<div class="col-sm-1"></div>
		<div class="col-sm-10 text-center" 	style="margin-top: 100px; padding-bottom: 100px;">
			<div style="margin-top: 100px; text-align:center;" align="center">
			<sec:authorize access="hasRole('ROLE_ADMIN')">
			<sec:authentication var="mvo" property="principal" />  
			<form action = "registerAcademy.do" method="post">
			<sec:csrfInput/>
			<table class="table">
				   <thead style="text-align:center;">
				   		<tr>
							<td colspan="3" align="center"><h3>기관 정보 등록하기</h3></td>
						</tr>
						<tr>
							<td style="border-top:0px"></td>
						</tr>
				   </thead>
				   <tbody>
						<tr >
					        <th>학원 이름</th>
					        <td colspan="2"><input type="text" name="acaName" placeholder="질문 제목을 입력하세요" required="required" style="width:100%"></td>
				      	</tr>
				      	<tr>
				      		<th>학원 주소</th>
				      		<td><input type="text" name="acaAddr" id="sample4_address" placeholder="주소" readonly="readonly" style="width:100%"></td>
				      		<td>
								<span>
									<input type="button" onclick="sample4_execDaumPostcode()"  class="aca-btn" value="주소검색" >
								</span>
								<span id="guide" style="color:#999"></span>
							</td>
				      	</tr>
				      	<tr>
					        <th>학원 전화번호</th>
					        <td colspan="2"><input type="text" name="acaTel" placeholder="질문 제목을 입력하세요" required="required" style="width:100%"></td>
				      	</tr>
				      	<tr>
				      		<th>학원 대표 사진
				      			<span id="curtime"></span>
				      		</th>
				      		<td>
				   			<script>
							    $(document).ready(function() {
							    	var curtime = "";
							        $('#acaMainPic').change(function() {
							        	$.ajax({
								              data: ("#file").serialize(),
								              type: "POST",
								              url: "academy-file-upload.do",
								              cache: false,
								              contentType: false,
								              enctype: "multipart/form-data",
								              processData: false,
								              beforeSend : function(xhr){   /*데이터를 전송하기 전에 헤더에 csrf값을 설정한다*/
								            		xhr.setRequestHeader("${_csrf.headerName}", "${_csrf.token}");
								         	  },
								              success: function(url) {
								            	var path = "${pageContext.request.contextPath}/resources/academyUpload/"+url[0];
								            	curtime += '<input type="hidden" name="curtime" value="'+url[1]+'">';
								            	alert(curtime);
								            	$("#curtime").html(curtime);
								                $(el).summernote("editor.insertImage", path);
								                $('#imageBoard > ul').append('<li><img src="'+path+'" width="480" height="auto"/></li>');
								              }
								          });//ajax
							        })
							        
							        /* ({
							        	 height: 500,               
							        	 minHeight: null,           
							        	 maxHeight: null,  
							        	 callbacks: {
							                 onImageUpload: function(files, editor, welEditable) {
							                   for (var i = files.length - 1; i >= 0; i--) {
							                     sendFile(files[i], this);
							                   }
							                 }
							             }
							        });//summernote */
							        function sendFile(file, el) {
							            var form_data = new FormData();
							            form_data.append("file", file);
							            
							   	   }//sendFile
							    });//ready
						 	</script>
						 	</td>
						 	</tr>
				   </tbody>
				   <tfoot>
				  		<tr>
						   	<td colspan="3" align="right">
						   		<sec:authorize access="hasRole('ROLE_USER')">
								     <div class="btnArea">
									     <button type="submit" class="aca-btn" >확인</button>  
									     <input type="hidden" value="${mvo.usrId}" name="userVO.usrId">
									     <button type="reset" class="aca-btn" >취소</button>   
								    </div>  
							    </sec:authorize>
						   	</td>
				   		</tr>
				   </tfoot>
				</table>
			  </form>
			  <form>
				    <input type="file" id="file" name="file">
					<input type="submit">
			  </form>
			  </sec:authorize>
			</div>
		</div>
		<div class="col-sm-1"></div>
	</div>
</div>
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


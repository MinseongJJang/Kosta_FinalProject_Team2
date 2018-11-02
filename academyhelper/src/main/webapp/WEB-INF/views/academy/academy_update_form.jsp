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
	<form action="updateAcademy.do" id="updateAca" method="post">
	<c:set var="de" value="${requestScope.test}" />
	<table>
		<tr>
			<td>학원번호</td>
			<td>
			&nbsp;&nbsp;${de.acaNo}
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
			<td>
			<input type="text" name="acaAddr" value="${de.acaAddr}" required="required" > 
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
			</td>
		</tr>
		<tr style="height: 250px; ">
				      		<th style="width: 100px;">*이전 메인사진*
				      				<span id="curtime"></span>
				      				<span id="curtime1"></span>
				      				<span id="mainPic"></span>
				      		</th>
				      		<td>

	<img src="${de.acaMainPic}">
			<ul id="pics">
				<c:forEach items="${de.acaMainPic}" var="mImg">
					<li>${mImg}<%-- <input type="button" value="X" class="button">
						<input type="hidden" name="pics" value="${mImg}"> --%></li>
				</c:forEach>
			</ul> 				      		
				      		</td>
				      		
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
						 
							<th>						 메인 사진 선택
							<input type="file" id="acaMainPic" name="file"></th>
				   		</tr>
				   		<tr>
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
										curtime += '<input type="hidden" name="curtime1" value="'+url[1]+'">';
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


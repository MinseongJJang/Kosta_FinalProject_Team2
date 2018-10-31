<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="sec"
	uri="http://www.springframework.org/security/tags"%>
<link href="http://netdna.bootstrapcdn.com/bootstrap/3.3.5/css/bootstrap.css" rel="stylesheet">
<script src="http://cdnjs.cloudflare.com/ajax/libs/jquery/3.2.1/jquery.js"></script>
<script src="http://netdna.bootstrapcdn.com/bootstrap/3.3.5/js/bootstrap.js"></script>
<link href="http://cdnjs.cloudflare.com/ajax/libs/summernote/0.8.9/summernote.css" rel="stylesheet">
<script src="http://cdnjs.cloudflare.com/ajax/libs/summernote/0.8.9/summernote.js"></script>

<sec:authorize access="hasRole('ROLE_ADMIN')">
	<form action="${pageContext.request.contextPath}/registerCurriculum.do"
		method="post" id="write_form">
		<sec:csrfInput />
		<%-- csrf 토큰 --%>
		<input type="hidden" name="academyVO.acaNo"
			value="${requestScope.acaNo}">
		<table class="table">
			<tr>
				<td>제목 &nbsp;&nbsp; <input type="text" name="curName"
					placeholder="교육과정 제목을 입력하세요" required="required">
				</td>
			</tr> 
			<tr>
				<td>타이틀 사진 <span id="curtime"></span>
				</td>
				<td><textarea cols="90" rows="15" name="curMainPic" id="curMainPic"
						required="required" placeholder="본문내용을 입력하세요"></textarea> 	
						<script>
							$(document).ready(function() {
												var curtime = "";
												$('#curMainPic').summernote({
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
														url : "curriculum-file-upload.do",
														cache : false,
														contentType : false,
														enctype : "multipart/form-data",
														processData : false,
														beforeSend : function(xhr) { /*데이터를 전송하기 전에 헤더에 csrf값을 설정한다*/
																	xhr.setRequestHeader("${_csrf.headerName}", "${_csrf.token}");
														},
														success : function(url) {
															var path = "${pageContext.request.contextPath}/resources/curriculumUpload/"+ url[0];
															curtime += '<input type="hidden" name="curtime" value="'+url[1]+'">';
																	$("#curtime").html(curtime);
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
				<td>최대 수강인원 &nbsp;&nbsp; <input type="number" name="limitMem"
					placeholder="숫자만 입력해주세요!" required="required">
				</td>
			</tr>
			
			<tr>
				<td>내용 <span id="curtime"></span>
				</td>
				<td><textarea cols="90" rows="15" name="curContent" id="curContent"
						required="required" placeholder="본문내용을 입력하세요"></textarea> 	<script>
							$(document).ready(function() {
												var curtime = "";
												$('#curContent').summernote({
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
														url : "curriculum-file-upload.do",
														cache : false,
														contentType : false,
														enctype : "multipart/form-data",
														processData : false,
														beforeSend : function(xhr) { /*데이터를 전송하기 전에 헤더에 csrf값을 설정한다*/
																	xhr.setRequestHeader("${_csrf.headerName}", "${_csrf.token}");
														},
														success : function(url) {
															var path = "${pageContext.request.contextPath}/resources/curriculumUpload/"+ url[0];
															curtime += '<input type="hidden" name="curtime" value="'+url[1]+'">';
																	$("#curtime").html(curtime);
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
				<td>강의자 &nbsp;&nbsp; <input type="text" name="curLecturer"
					placeholder="누가 강의하시나요?" required="required">
				</td>
			</tr>
			<tr>
				<td>교재 &nbsp;&nbsp; <input type="text" name="curTextbook"
					placeholder="어떤 교재 사용하나요?" required="required">
				</td>
			</tr>
		</table>

		<div class="btnArea">
			<button type="submit" class="btn">확인</button>
			<button type="reset" class="btn">취소</button>
		</div>

	</form>
	<a
		href="${pageContext.request.contextPath}/detailAcademy.do?acaNo=${requestScope.acaNo}">목록으로
		돌아가기</a>
</sec:authorize>

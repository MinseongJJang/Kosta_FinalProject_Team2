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

<form method="post" id="updateForm"
	action="${pageContext.request.contextPath}/updateCurriculum.do">
	<input type="hidden" name="curNo" value="${DetailCurriculum.curNo}">
	<sec:csrfInput />
	<%-- csrf 토큰 --%>

	<table class="table">
		<tr>
			<td>제목 &nbsp;&nbsp; <input type="text" name="curName"
				value="${DetailCurriculum.curName}" required="required">
			</td>
		</tr>
		<tr>
			<td>최대 수강인원 &nbsp;&nbsp; <input type="text" name="limitMem"
				value="${DetailCurriculum.limitMem}" required="required">
				<span id="curtime"></span>
				<span id="curtime1"></span>
			</td>
		</tr>
		<tr>
			<td><textarea cols="90" rows="15" name="curContent" id="curContent"
					required="required" placeholder="본문내용을 입력하세요">${DetailCurriculum.curContent }</textarea>
			<script>
						$(document).ready(function() {
							var curtime = "";
							var curtime1 = "";
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
													
							$("#file").change(function(){
								var data = new FormData();
								$.each($("#file")[0].files, function(i, file) {
									data.append("file", file);
								});
								$.ajax({
									type:"post",
									url:"${pageContext.request.contextPath}/curriculum-file1-upload.do",
									data:data,
									enctype : "multipart/form-data",
									processData: false,
									contentType: false,
									beforeSend : function(xhr){
										xhr.setRequestHeader("${_csrf.headerName}","${_csrf.token}");
									},
									success : function(url){
										curtime1 += '<input type="hidden" name="curtime1" value="'+url[1]+'">';
										$("#curtime1").html(curtime1);
									}
								});//ajax
							});//change
						});//ready
					</script>
			</td>
		</tr>
		<tr>
			<td>강의자 &nbsp;&nbsp; <input type="text" name="curLecturer"
				value="${DetailCurriculum.curLecturer}" required="required">
			</td>
		</tr>
		<tr>
			<td>교재 &nbsp;&nbsp; <input type="text" name="curTextbook"
				value="${DetailCurriculum.curTextbook}" required="required">
			</td>
		</tr>
		<tr>
				<td>교육과정 메인사진 (*수정시 이전 메인사진은 메인사진 파일업로드 여부와 상관없이 삭제됩니다.*) &nbsp;&nbsp; <input type="file" id="file" name="file">
				
				</td> 
			</tr>
	</table>
	*이전 메인사진*
	<br>
	<img src="${requestScope.DetailCurriculum.curMainPic}">
			<ul id="pics">
				<c:forEach items="${requestScope.DetailCurriculum.curMainPic}" var="mImg">
					<li>${mImg}<%-- <input type="button" value="X" class="button">
						<input type="hidden" name="pics" value="${mImg}"> --%></li>
				</c:forEach>
			</ul> 
	<sec:authorize access="hasRole('ROLE_ADMIN')">
		<div class="btnArea">
			<button type="submit" class="btn">수정</button>
			<button type="reset" class="btn">취소</button>
		</div>
	</sec:authorize>
</form>
</body>
</html>
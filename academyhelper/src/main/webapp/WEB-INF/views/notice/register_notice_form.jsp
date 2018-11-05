<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="sec" uri="http://www.springframework.org/security/tags" %>
<link href="http://netdna.bootstrapcdn.com/bootstrap/3.3.5/css/bootstrap.css" rel="stylesheet">
<script src="http://cdnjs.cloudflare.com/ajax/libs/jquery/3.2.1/jquery.js"></script> 
<script src="http://netdna.bootstrapcdn.com/bootstrap/3.3.5/js/bootstrap.js"></script> 
<link href="http://cdnjs.cloudflare.com/ajax/libs/summernote/0.8.9/summernote.css" rel="stylesheet">
<script src="http://cdnjs.cloudflare.com/ajax/libs/summernote/0.8.9/summernote.js"></script>

<div class="container" >
	<div class="row">
		<div class="col-sm-1"></div>
		<div class="col-sm-10 text-center">
			<div style="margin-top: 100px; text-align:center;" align="center">
			<sec:authentication var="mvo" property="principal" />  
			<form method="post" action="${pageContext.request.contextPath}/registerNotice.do">
			<sec:csrfInput/>
			<table class="table">
				   <thead style="text-align:center">
				   		<tr>
							<td colspan="4" align="center"><h3>공지 등록하기</h3></td>
						</tr>
				   </thead>
				   <tbody>
						<tr >
					        <td>제목</td>
					        <td><input type="text" name="noticeTitle" placeholder="질문 제목을 입력하세요" required="required" style="width:80%"></td>
				      	</tr>
				      	<tr>
				      		<td>내용
				      			<span id="curtime"></span>
				      		</td>
				      		<td><textarea cols="90" rows="130" id="noticeContent" name="noticeContent" required="required" placeholder="공지할 내용을 입력하세요"></textarea>
				      		<script>
							    $(document).ready(function() {
							    	var curtime = "";
							        $('#noticeContent').summernote({
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
							        });//summernote
							        function sendFile(file, el) {
							            var form_data = new FormData();
							            form_data.append("file", file);
							            $.ajax({
							              data: form_data,
							              type: "POST",
							              url: "review-file-upload.do",
							              cache: false,
							              contentType: false,
							              enctype: "multipart/form-data",
							              processData: false,
							              beforeSend : function(xhr){   /*데이터를 전송하기 전에 헤더에 csrf값을 설정한다*/
							            		xhr.setRequestHeader("${_csrf.headerName}", "${_csrf.token}");
							         	  },
							              success: function(url) {
							            	var path = "${pageContext.request.contextPath}/resources/reviewUpload/"+url[0];
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
				   </tbody>
				   <tfoot>
				  		<tr>
						   	<td colspan="2" align="right">
						   		<sec:authorize access="hasRole('ROLE_USER')">
								     <div class="btnArea">
									     <button type="submit" class="aca-btn" >등록</button>  
									     <input type="hidden" name="userVO.usrId" value="${mvo.usrId}">
									     <button type="reset" class="aca-btn" >취소</button>   
								    </div>
							    </sec:authorize>
						   	</td>
				   		</tr>
				   </tfoot>
				</table>
			  </form>
			</div>
		</div>
		<div class="col-sm-1"></div>
	</div>
</div>
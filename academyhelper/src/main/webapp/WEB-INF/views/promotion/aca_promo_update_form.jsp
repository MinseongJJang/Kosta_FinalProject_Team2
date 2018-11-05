<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
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
			<form action="${pageContext.request.contextPath}/updateAcaPromoPost.do" method="post" id="register_form">
			<sec:csrfInput/>
			<table class="table">
				   <thead style="text-align:center;">
				   		<tr>
							<td colspan="4" align="center"><h3>기관 홍보 수정하기</h3></td>
						</tr>
						<tr>
							<td style="border-top:0px"></td>
						</tr>
				   </thead>
				   <tbody>
				   <tr>
			<td>글번호</td>
			<td>
			&nbsp;&nbsp;${de.acaPromoNo}
				<input type="hidden" name="acaPromoNo" value="${de.acaPromoNo}">
			</td>
		</tr>
						<tr >
					        <td>제목</td>
					        <td><input type="text" name="acaPromoTitle" value="${de.acaPromoTitle}" placeholder="홍보 제목을 입력하세요" required="required" style="width:80%"></td>
				      	</tr>
				      	<tr>
				      		<td>내용
				      		<span id="curtime"></span>
				      		</td>
				      		<td><textarea cols="90" rows="15" id="acaPromoContent" name="acaPromoContent" required="required" placeholder="내용을 입력하세요">${de.acaPromoContent}</textarea>
				      		<script>
							    $(document).ready(function() {
							    	var curtime = "";
							        $('#acaPromoContent').summernote({
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
							              url: "promotion-file-upload.do",
							              cache: false,
							              contentType: false,
							              enctype: "multipart/form-data",
							              processData: false,
							              beforeSend : function(xhr){   /*데이터를 전송하기 전에 헤더에 csrf값을 설정한다*/
							            		xhr.setRequestHeader("${_csrf.headerName}", "${_csrf.token}");
							         	  },
							              success: function(url) {
							            	var path = "${pageContext.request.contextPath}/resources/promotionUpload/"+url[0];
							            	curtime += '<input type="hidden" name="curtime" value="'+url[1]+'">';
							            	$("#curtime").html(curtime);
							                $(el).summernote("editor.insertImage", path);
							                $("#imageBoard > ul").append('<li><img src="'+path+'" width="480" height="auto"/></li>');
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
						   		<sec:authorize access="hasRole('ROLE_ACADEMY')">
								     <div class="btnArea">
									     <button type="submit" class="aca-btn" >확인</button>  
									     <input type="hidden" value="${mvo.usrId}" name="acaUserVO.userVO.usrId">
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
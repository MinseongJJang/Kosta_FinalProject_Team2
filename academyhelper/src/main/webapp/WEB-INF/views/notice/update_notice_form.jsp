<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="sec" uri="http://www.springframework.org/security/tags" %>
<script type="text/javascript">
	$(document).ready(function() {
		$("#updateForm").submit(function() {
			if ($("#title").val() == "") {
				alert("제목을 입력하세요!");
				return false;
			}
			if ($("#content").val() == "") {
				alert("본문을 입력하세요!");
				return false;
			}
		});
		$("#resetBtn").click(function() {
			$("#write_form")[0].reset();
		});
	});
</script>

<div class="container" >
	<div class="row">
		<div class="col-sm-1"></div>
		<div class="col-sm-10 text-center" 	style="margin-top: 100px; padding-bottom: 100px;">
			<div style="margin-top: 100px; text-align:center;" align="center">
			<sec:authorize access="hasRole('ROLE_ADMIN')"> 
			<form method="post" id="updateForm" action="${pageContext.request.contextPath}/updateNotice.do">
			<input type="hidden" name="noticeNo" value="${nvo.noticeNo}">
			<sec:csrfInput/>
			<table class="table">
				   <thead style="text-align:center;">
				   		<tr>
							<td colspan="4" align="center"><h3>공지 수정하기</h3></td>
						</tr>
				   </thead>
				   <tbody>
						<tr >
					        <td>제목</td>
					        <td><input type="text" name="noticeTitle" value="${nvo.noticeTitle}" required="required" style="width:80%"></td>
				      	</tr>
				      	<tr>
				      		<td>내용</td>
				      		<td><textarea cols="90" rows="15" name="noticeContent" required="required">${nvo.noticeContent} </textarea></td>
				      	</tr>
				   </tbody>
				   <tfoot>
				  		<tr>
						   	<td colspan="2" align="right">
						   		<sec:authorize access="hasRole('ROLE_USER')">
								     <div class="btnArea">
									     <button type="submit" class="aca-btn" >수정</button>  
									     <input type="hidden" value="java" name="UserVO.usrId">
									     <button type="reset" class="aca-btn" >취소</button>   
								    </div>  
							    </sec:authorize>
						   	</td>
				   		</tr>
				   </tfoot>
				</table>
			  </form>
		  	</sec:authorize>
			</div>
		</div>
		<div class="col-sm-1"></div>
	</div>
</div>
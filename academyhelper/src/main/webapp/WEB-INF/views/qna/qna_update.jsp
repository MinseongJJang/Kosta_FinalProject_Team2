<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="sec" uri="http://www.springframework.org/security/tags" %>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
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
			<sec:authentication var="mvo" property="principal" />  
			<form method="post" id="updateForm"	action="${pageContext.request.contextPath}/updateAcaQNA.do">
 			<sec:csrfInput />
			<table class="table">
				   <thead style="text-align:center;">
				   		<tr>
							<td colspan="4" align="center"><h3>질문과 응답 수정하기</h3></td>
						</tr>
						<tr>
							<td style="border-top:0px"></td>
						</tr>
				   </thead>
				   <tbody>
						<tr >
					        <th>제목</th>
					        <td><input type="text" name="qnaTitle" value="${detailQNA.qnaTitle}" required="required" style="width:100%"></td>
							<th>
								작성자
							</th>
							<td style="align:left;">
								${detailQNA.userVO.usrId}
							</td>
				      	</tr>
				      	<tr>
				      		<th>내용</th>
				      		<td colspan="3"><pre><textarea  cols="90" rows="15" id="acaRevContent" name="acaQnaContent" required="required" placeholder="내용을 입력하세요">
				      		${detailQNA.qnaContent }
				      		</textarea></pre>
				      		<script type="text/javascript">
							CKEDITOR.replace("acaQnaContent");
							</script>	
				      		</td>
				      		
				      	</tr>
				   </tbody>
				   <tfoot>
				  		<tr>
						   	<td colspan="4" align="right">
						   		<sec:authorize access="hasRole('ROLE_USER')">
								     <div class="btnArea">
									     <button type="submit" class="aca-btn" >수정</button>  
									     <input type="hidden" value="${mvo.usrId}" name="userVO.usrId">
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

<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<meta charset="utf-8">
 <%@ taglib prefix="sec" uri="http://www.springframework.org/security/tags" %>
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
			
			
<div class="container" >
	<div class="row">
		<div class="col-sm-1"></div>
		<div class="col-sm-10 text-center" 	style="margin-top: 100px; padding-bottom: 100px;">
			<div style="margin-top: 100px; text-align:center;" align="center">
			<sec:authorize access="hasRole('ROLE_USER')">
			<sec:authentication var="mvo" property="principal" />  
			<form action="updateSuggestionPost.do" id="updateAca" method="post">
			<c:set var="vo" value="${requestScope.vo}" />
			<sec:csrfInput/>
			<input type="hidden" name="userVO.usrId" value="<sec:authentication property="principal.usrId"/>">
			<table class="table">
				   <thead style="text-align:center;">
				   		<tr>
							<td colspan="4" align="center"><h3>건의 사항 수정하기</h3></td>
						</tr>
						<tr>
							<td style="border-top:0px"></td>
						</tr>
				   </thead>
				   <tbody>
						<tr >
					        <td>제목</td>
					        <td><input type="text"  name="sugTitle" value="${vo.sugTitle}" required="required" style="width:80%"></td>
				      	</tr>
				      	<tr>
				      		<td>내용</td>
				      		<td><textarea cols="90" rows="15" name="sugContent" required="required">${vo.sugContent}</textarea></td>
				      	</tr>
				   </tbody>
				   <tfoot>
				  		<tr>
						   	<td colspan="2" align="right">
						   		<sec:authorize access="hasRole('ROLE_USER')">
								     <div class="btnArea">
									     <input type="hidden" name="sugNo" value="${vo.sugNo}">   
									     <button type="submit" class="aca-btn" >수정</button>
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

<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    <%@ taglib prefix="sec" uri="http://www.springframework.org/security/tags" %>

<div class="container" >
	<div class="row">
		<div class="col-sm-1"></div>
		<div class="col-sm-10 text-center" 	style="margin-top: 100px; padding-bottom: 100px;">
			<div style="margin-top: 100px; text-align:center;" align="center">
			<sec:authentication var="mvo" property="principal" />  
			<form method="post" action="${pageContext.request.contextPath}/suggestionRegister.do" id="regForm">
			<sec:csrfInput/>
			<input type="hidden" name="userVO.usrId" value="<sec:authentication property="principal.usrId"/>">
			
			<table class="table">
				   <thead style="text-align:center;">
				   		<tr>
							<td colspan="4" align="center"><h3>건의 사항 등록하기</h3></td>
						</tr>
				   </thead>
				   <tbody>
						<tr >
					        <td>제목</td>
					        <td><input type="text" name="sugTitle" placeholder="질문 제목을 입력하세요" required="required" style="width:80%"></td>
				      	</tr>
				      	<tr>
				      		<td>내용</td>
				      		<td><textarea cols="90" rows="15" name="sugContent" required="required" placeholder="질문 내용을 입력하세요"></textarea></td>
				      	</tr>
				   </tbody>
				   <tfoot>
				  		<tr>
						   	<td colspan="2" align="right">
						   		<sec:authorize access="hasRole('ROLE_USER')">
								     <div class="btnArea">
									     <button type="submit" class="aca-btn" >등록</button>  
									     <input type="hidden" value="java" name="UserVO.usrId">
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

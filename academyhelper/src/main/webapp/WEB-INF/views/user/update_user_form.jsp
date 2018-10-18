<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="sec" uri="http://www.springframework.org/security/tags" %>

<div class="container" >
	<div class="row">
		<div class="col-sm-1"></div>
			<div class="col-sm-10 text-center" 	style="margin-top: 100px; padding-bottom: 100px;">
				<div style="margin-top: 100px; text-align:center;" align="center">
					<sec:authorize access="hasRole('ROLE_USER')">
						<form method="post" action="${pageContext.request.contextPath}/updateUser.do">
						<input type="hidden" name="command" value="update">
							<sec:csrfInput/>
							<table class="table table-hover">
							   <thead style="text-align:center;">
							   		<tr>
							   			<td colspan="2" align="center">
							   				<h3>회원 정보 수정</h3>
							   			</td>
							   		</tr>
							   </thead>
							   <tbody>
							   		<tr>
							   			<td>아이디 </td>
							   			<td><input type="text" name="usrId" value="<sec:authentication property="principal.usrId"/>" readonly></td>
							   		</tr>
							   		<tr>
							   			<td>패스워드 </td>
							   			<td><input type="password" name="usrPass" required="required"></td>
							   		</tr>
							   		<tr>
							   			<td>이름</td>
							   			<td><input type="text" name="usrName" value="<sec:authentication property="principal.usrName"/>" required="required"></td>
							   		</tr>
							   		<tr>
							   			<td>주소</td>
							   			<td><input type="text" name="usrAddr" value="<sec:authentication property="principal.usrAddr"/>" required="required"></td>
							   		</tr>
							   		<tr>
							   			<td>닉네임</td>
							   			<td><input type="text" name="nickname"	value="<sec:authentication property="principal.nickname"/>" required="required"></td>
							   		</tr>
							   		<tr>
							   			<td>생년월일</td>
							   			<td><input type="text" name="birthday"	value="<sec:authentication property="principal.birthday"/>" required="required"></td>
							   		</tr>
							   		<tr>
							   			<td>전자메일</td>
							   			<td><input type="text" name="usrEmail" value="<sec:authentication property="principal.usrEmail"/>" required="required"></td>
							   		</tr>
							   		<tr>
							   			<td>폰번호</td>
							   			<td><input type="text" name="usrTel" value="<sec:authentication property="principal.usrTel"/>" required="required"></td>
							   		</tr>
							   </tbody>
							   <tfoot>
							   <tr>
								   <td colspan="2" align="right">
										<button type="submit" class="aca-btn">회원정보수정</button>
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



<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    <%@ taglib prefix="sec" uri="http://www.springframework.org/security/tags" %>
 <sec:authorize access="hasRole('ROLE_USER')">
 <form method="post" action="${pageContext.request.contextPath}/updateUser.do">
 <sec:csrfInput/>
		<input type="hidden" name="command" value="update">
		아이디 : <input type="text" name="usrId"
		value="<sec:authentication property="principal.usrId"/>" readonly><br>
		패스워드 : <input type="password" name="usrPass" required="required"><br>
		이름 : <input type="text" name="usrName" 
		value="<sec:authentication property="principal.usrName"/>" required="required"><br>
		주소 : <input type="text" name="usrAddr" 
		value="<sec:authentication property="principal.usrAddr"/>" required="required"><br>
		닉네임 <input type="text" name="nickname"
		value="<sec:authentication property="principal.nickname"/>" required="required"><br>
		생년월일 <input type="text" name="birthday"
		value="<sec:authentication property="principal.birthday"/>" required="required"><br>
		전자메일<input type="text" name="usrEmail"
		value="<sec:authentication property="principal.usrEmail"/>" required="required"><br>
		폰번호 <input type="text" name="usrTel"
		value="<sec:authentication property="principal.usrTel"/>" required="required"><br>
			
		<br><input type="submit" value="회원정보수정">
		</form>
</sec:authorize>

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
	<sec:authorize access="hasRole('ROLE_ADMIN')">
	<form action="updateAcademy.do" id="updateAca" method="post">
	<c:set var="de" value="${requestScope.test}" />
	<table>
		<tr>
			<td>학원번호</td>
			<td>
			<input type="text" name="acaNo" value="${de.acaNo}" required="required" readonly> 
			</td>
		</tr>
		<tr>
			<td>학원이름</td>
			<td>
			<input type="text" name="acaName" value="${de.acaName}" required="required" > 
			</td>
		</tr>
		<tr>
			<td>학원주소</td>
			<td>
			<input type="text" name="acaAddr" value="${de.acaAddr}" required="required" > 
			</td>
		</tr>
		<tr>
			<td>학원전화번호</td>
			<td>
			<input type="text" name="acaTel" value="${de.acaTel}" required="required" > 
			</td>
		</tr>
		<tr>
			<td>이메일</td>
			<td>
			<input type="text" name="userVO.usrEmail" value="${de.userVO.usrEmail}" required="required"  readonly> 
			</td>
		</tr>
		<tr>
			<td>전화번호</td>
			<td>
			<input type="text" name=".userVO.usrTel" value="${de.userVO.usrTel}" required="required"  readonly> 
			</td>
		</tr>
		<tr>
			<td>닉네임</td>
			<td>
			<input type="text" name="userVO.nickname" value="${de.userVO.nickname}" required="required"  readonly> 
			</td>
		</tr>
		<tr>
			<td>아이디</td>
			<td>
			<input type="text" name="userVO.usrId" value="${de.userVO.usrId}" required="required"  readonly> 
			</td>
		</tr>
		<tr>
			<td colspan="2">시설 사진</td>
		</tr>
		<tr>
			<td colspan="2">위치 사진</td>
		</tr>
	</table>
	<sec:csrfInput/>
	<input type="submit" value="학원정보수정">
	</form>
	</sec:authorize>


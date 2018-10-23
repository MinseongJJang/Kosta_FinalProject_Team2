<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@taglib prefix="sec" uri="http://www.springframework.org/security/tags" %>
<style>
.test{
	 border : 2px solid #004e92;
	 width:400px;
}
table td{
	padding:20px;
}
</style> 
<div class="container" >
	<div class="row">
		<div class="col-sm-3"></div>
		<div class="col-sm-6 text-center" 	style="margin-top: 100px; padding-bottom: 100px;">
			<div style="margin-top: 100px; text-align:center;" align="center">
				<table class="test" >
					<tr>
						<td align="center">
							<h3>아이디 찾기</h3>
						</td>
					</tr>	
							<form action="findId.do" method="post">
						
							<sec:csrfInput/>
							<tr>
								<td>
								이름&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;<input type="text" name="usrName" required="required">
						   		</td> 
						   </tr>
						    <tr>
						    	<td>
								생년월일&nbsp;&nbsp;&nbsp;&nbsp;<input type="date" name="birthday" required="required">
						     	</td>
						     </tr>
						     <tr>
						     	<td>
								이메일&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;<input type="text" name="usrEmail" required="required">
								</td>
							</tr>	
							<tr>
								<td>
								<input type="submit" value="아이디 찾기">
								</td>
						    </tr>
							</form>
				</table>
			</div>
		</div>
		<div class="col-sm-3"></div>
	</div>
</div>

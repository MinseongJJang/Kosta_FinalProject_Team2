<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@taglib prefix="sec" uri="http://www.springframework.org/security/tags" %>
<style>
.test{
	 border : 2px solid #004e92;
	 height:100px;
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
					<td>
						당신의 아이디는 ${id } 입니다!<br>
						대충 감히 오시죠?<br>
						이제 잊어버리지 마세요!
					</td>
					</tr>
				</table>
			</div>
		</div>
		<div class="col-sm-3"></div>
	</div>
</div>
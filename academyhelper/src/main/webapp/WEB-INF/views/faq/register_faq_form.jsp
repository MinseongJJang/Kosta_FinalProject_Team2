<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="sec" uri="http://www.springframework.org/security/tags" %>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>Insert title here</title>
</head>
<body>
<div class="row main">
			<div class="col-sm-2"></div>
			<div class="col-sm-8">
				<form method="post" id="updateForm"
					action="${pageContext.request.contextPath}/registerFAQ.do">
					<sec:csrfInput />
					<table class="table">
						<tr>
							<td>제목 &nbsp;&nbsp; <input type="text" name="faqTitle"
								required="required">
							</td>
						</tr>
						<tr>
							<td><textarea cols="90" rows="15" name="faqContent"
									required="required"></textarea></td>
						</tr>
					</table>
					<div class="btnArea">
						<button type="submit" class="btn">등록</button>
						<button type="reset" class="btn">취소</button>
					</div>					
				</form>
			</div>
			<div class="col-sm-2"></div>
		</div>
</body>
</html>
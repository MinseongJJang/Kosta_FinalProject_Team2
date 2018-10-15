<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html>
<html lang="en">
<head>
<meta charset="utf-8">
<title>Insert title here</title>
</head>
<body>
<form action="${pageContext.request.contextPath}/write.do"
					method="post" id="write_form">
					<table class="table">
						<tr>
							<td>제목 &nbsp;&nbsp; <input type="text" name="title"
								placeholder="게시글 제목을 입력하세요" required="required">
							</td>
						</tr>
						<tr>
							<td><textarea cols="90" rows="15" name="content"
									required="required" placeholder="본문내용을 입력하세요"></textarea></td>
						</tr>
					</table>
					<div class="btnArea">
						<button type="submit" class="btn">확인</button>
						<button type="reset" class="btn">취소</button>
					</div>
				</form>
</body>
</html>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="sec" uri="http://www.springframework.org/security/tags" %>
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
<div class="container-fluid">
		<div class="row main">
			<div class="col-sm-2"></div>
			<div class="col-sm-8">
			
				<form method="post" id="updateForm"
					action="${pageContext.request.contextPath}/updateFAQ.do">
                  <sec:csrfInput />
					<input type="hidden" name="faqNo" value="${fvo.faqNo}">
					<table class="table">
						<tr>
							<td>제목 &nbsp;&nbsp; <input type="text" name="faqTitle"
								value="${fvo.faqTitle}" required="required">
							</td>
						</tr>
						<tr>
							<td><textarea cols="90" rows="15" name="faqContent"
									required="required">${fvo.faqContent }</textarea></td>
						</tr>
					</table>
					<div class="btnArea">
						<button type="submit" class="btn">수정</button>
						<button type="reset" class="btn">취소</button>
					</div>
				</form>
			</div>
			<div class="col-sm-2"></div>
		</div>
	</div>
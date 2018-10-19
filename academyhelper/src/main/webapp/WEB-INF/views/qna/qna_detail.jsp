<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions"%>
<%@ taglib prefix="sec"
	uri="http://www.springframework.org/security/tags"%>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<script
	src="https://ajax.googleapis.com/ajax/libs/jquery/3.2.1/jquery.min.js"></script>
<script language="javascript" type="text/javascript">
	 
/*$(function () {
    var myObjects = [
        {
            id: 1,
            firstname: "Gandalf",
            lastname: "Greyhaem"
        },
        {
            id: 2,
            firstname: "Bilbo",
            lastname: "Baggins"
        },
        {
            id: 3,
            firstname: "Frodo",
            lastname: "Baggins"
        }
    ];
    $.each(myObjects, function () {
        console.log("ID: " + this.id);
        console.log("First Name: " + this.firstname);
        console.log("Last Name: " + this.lastname);
        console.log(" ");
    });
});*/ 
	 
	 //txt_Value값을 가져옵니다.
	 /*var value = document.getElementById("txt_Value").value;
	
	 var result;
	 for(var i = 1; i < 10; i++){
	 result = value * i;
	 console.log(value+"*"+i+"="+result);
	 }
	 }*/
	$(document)
			.ready(
					function() {
						$("#deleteForm").submit(function() {
							return confirm("게시물을 삭제하시겠습니까?");
						});
						$("#updateForm").submit(function() {
							return confirm("게시물을 수정하시겠습니까?");
						});
						$("#modifyReply")
								.click(
										function() {
											$("#modifyReplyDiv")
													.append(
															"<textarea class='form-control' rows='1' id='qnaRepContent'  placeholder='수정할 내용을 입력하세요' name='qnaRepContent' ></textarea>"
																	+ "<input style='float: right;' class='aca-btn' type='submit' value='수정하기'>"

													);
											/* "<input type='button' value='버튼' class='testBtn'><br>"); */

										});

					});
	/* function modifyReply() {
		var comment = document.getElementById("qnaRepContent").value;
		alert(comment);
		alert(qnaRepContent.value)
		if (comment == "") {
			alert("댓글 입력해주세요!");
			return false;
		}
	} */
</script>
<!-- 
<input type='text' id='txt_Value'/>
<input type='button' onclick='if_javascript()' value='버튼'/>
 -->
<div class="container">
	<div class="row">
		<div class="col-sm-1"></div>
		<div class="col-sm-10 text-center"
			style="margin-top: 100px; padding-bottom: 100px;">
			<div style="margin-top: 100px; text-align: center;" align="center">
				<table class="table">
					<thead>
						<tr>
							<td colspan="8" align="center"><h3>질문과 응답 상세보기</h3></td>
						</tr>
						<tr>
							<td style="border-top: 0px"></td>
						</tr>
					</thead>
					<tbody>
						<c:set var="detailQNA" value="${requestScope.detailQNA}" />
						<tr>
							<td>글번호</td>
							<td>${detailQNA.qnaNo}</td>
							<td>글제목</td>
							<td>${detailQNA.qnaTitle}</td>
							<tD>작성자</td>
							<td>${detailQNA.userVO.nickname}</td>
							<td>등록일</td>
							<td>${detailQNA.qnaRegdate}</td>
						</tr>
						<tr>
							<td colspan="1">내용</td>
							<td colspan="7"><pre style="white-space: pre-wrap;">${detailQNA.qnaContent}</pre></td>
						</tr>
						<sec:authorize access="hasRole('ROLE_USER')">
							<tr>
								<td colspan="8" align="right">
									<button form="deleteForm" type="submit" class="aca-btn">삭제</button>
									<button form="updateForm" type="submit" class="aca-btn">수정</button>
									<form action="deleteAcaQNA.do" id="deleteForm" method="post">
										<sec:csrfInput />
										<input type="hidden" name="qnaNo" value="${detailQNA.qnaNo}">
									</form>
									<form action="updateAcaQNAForm.do" id="updateForm"
										method="post">
										<sec:csrfInput />
										<input type="hidden" name="qnaNo" value="${detailQNA.qnaNo}">
									</form>
								</td>
							</tr>
						</sec:authorize>
					</tbody>
				</table>
				<div>
					<label for="comment">댓글</label>
					<sec:authorize access="hasRole('ROLE_USER')">
						<sec:authentication var="mvo" property="principal" />

						<form
							action="${pageContext.request.contextPath}/registerAcaQnAReply.do"
							method="post">
							<sec:csrfInput />
							<div class="form-group">
								<input type="hidden" name="userVO.usrId" value="${mvo.usrId}">
								<input type="hidden" name="acaQNAVO.qnaNo"
									value="${detailQNA.qnaNo}">

								<textarea class="form-control" rows="1" id="qnaRepContent"
									name="qnaRepContent" placeholder="댓글을 입력하세요"></textarea>

							</div>
							<button onclick="return checkComment()" class="aca-btn"
								style="height: 10px">등록</button>
						</form>
					</sec:authorize>
					<c:if test="${fn:length(requestScope.listQNAReply)!=0}">
						<br>
						<br>
						<br>
						<p align="left">${fn:length(requestScope.listQNAReply)}개의
							&nbsp;댓글</p>
						<br>
						<c:forEach items="${requestScope.listQNAReply}" var="comment"
							varStatus="status">
							<p align="left">${comment.userVO.nickname }</p>
							<sec:authorize access="hasRole('ROLE_USER')">
								<form
									action="${pageContext.request.contextPath}/deleteAcaQnAReply.do?qnaRepNo=${comment.qnaRepNo}&qnaNo=${detailQNA.qnaNo}"
									method="post">
									<sec:csrfInput />
									<input style="float: right;" class="aca-btn" type="submit"
										value="삭제">
								</form>
								<form
									action="${pageContext.request.contextPath}/updateAcaQnAReply.do?qnaRepNo=${comment.qnaRepNo}&qnaNo=$${detailQNA.qnaNo}"
									method="post">
									<sec:csrfInput />
									<c:out value="${status.index}" />
									<input type="hidden" name="userVO.usrId" value="${mvo.usrId}">
									<input type="hidden" name="acaQNAVO.qnaNo"
										value="${detailQNA.qnaNo}">
									<!-- <textarea class="form-control" rows="1" id="qnaRepContent"
										name="qnaRepContent" placeholder="댓글을 입력하세요"></textarea> -->
									<button style="float: right;" type="button" class="aca-btn"
										id="modifyReply" value="${status.index}">수정</button>
									<!-- <input style="float: right;" class="aca-btn" type="submit"
										value="수정">  -->
									<div id="modifyReplyDiv"></div>

								</form>
							</sec:authorize>
							<div>
								<div align="left">
									<pre>${comment.qnaRepContent }</pre>
								</div>
							</div>
						</c:forEach>
					</c:if>

				</div>
			</div>

		</div>
	</div>
</div>
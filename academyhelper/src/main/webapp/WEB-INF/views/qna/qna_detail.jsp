<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions"%>
<%@ taglib prefix="sec"
	uri="http://www.springframework.org/security/tags"%>

<script type="text/javascript">
$(document).ready(function(){
	$("#deleteForm").submit(function(){
		if(confirm("정말로 탈퇴하시겠습니까?")==false){
			return false;
		}else{
			return true;
		}
	});
	$("#updateForm").submit(function(){
		if(confirm("정말로 탈퇴하시겠습니까?")==false){
			return false;
		}else{
			return true;
		}
	});
	$(".jBtn").click(function(e){
		var value=$(this).val();
		$(".jBtn").hide();
		$("#replyBtn"+$(this).val()).show();
		$("#modifyReplyDiv_"+$(this).val()).append(
				"<textarea class='form-control' rows='1' id='qnaRepContent' name='qnaRepContent' placeholer='${comment.qnaRepContent}'></textarea>"
				);
	});
	$("#replyBtn"+$(this).val()).click(function(e){
		$.ajax({
			type:"post",
			url:"${pageContext.request.contextPath}/updateAcaQnAReply.do",		
			data:$("#updateQnaReply").serialize(),	
			beforeSend : function(xhr){   /*데이터를 전송하기 전에 헤더에 csrf값을 설정한다*/
                xhr.setRequestHeader("${_csrf.headerName}", "${_csrf.token}");
            },
			success:function(data){
					$("#modifyReplyDiv_"+$(this).val()).append(
							"<pre>${comment.qnaRepContent}</pre>"
				}
				});			
			}//callback			
		});//ajax
	});//click
});//ready
</script>
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
									
									<form action="deleteAcaQNA.do" id="deleteForm" method="post">
										<sec:csrfInput />
										<input type="hidden" name="qnaNo" value="${detailQNA.qnaNo}">
									</form>
									<form action="updateAcaQNAForm.do" id="updateForm"
										method="post">
										<sec:csrfInput />
										<input type="hidden" name="qnaNo" value="${detailQNA.qnaNo}">
									</form>
									<button form="deleteForm" type="submit" class="aca-btn">삭제</button>
									<button form="updateForm" type="submit" class="aca-btn">수정</button>
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
									action="${pageContext.request.contextPath}/updateAcaQnAReply.do"
									method="post" name="updateQnaReply">
									<input type="hidden" name="qnaRepNo" value="${comment.qnaRepNo}">
									<input type="hidden" name="qnaNo" value="${detailQNA.qnaNo}">
									<sec:csrfInput />
									<button style="float: right;" type="button" class="aca-btn jBtn"
										id="modifyReply" value="${status.index}">수정</button>
									<button style="float: right; display:none;" type="button" class="aca-btn replyBtn"
										id="replyBtn${status.index}" value="${status.index}">수정</button>
								</form>
							</sec:authorize>
							<div>
								<div align="left">
									<div id="modifyReplyDiv_${status.index}"><pre>${comment.qnaRepContent}</pre></div>
								</div>
							</div>
						</c:forEach>
					</c:if>

				</div>
			</div>

		</div>
	</div>
</div>
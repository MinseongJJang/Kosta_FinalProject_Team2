<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions"%>
<%@ taglib prefix="sec" uri="http://www.springframework.org/security/tags"%>


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
							<th>글번호</th>
							<td>${detailQNA.qnaNo}</td>
							<th>글제목</th>
							<td>${detailQNA.qnaTitle}</td>
							<th>작성자</th>
							<td>${detailQNA.userVO.nickname}</td>
							<th>등록일</th>
							<td>${detailQNA.qnaRegdate}</td>
						</tr>
						<tr>
							<th colspan="1">내용</th>
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
				</div>
				</div>
				<div class="col-sm-1"></div>
				
					<c:if test="${fn:length(requestScope.listQNAReply)!=0}">
						<div class="col-sm-1"></div>
						<div class="col-sm-10">
						<p align="left">${fn:length(requestScope.listQNAReply)}개의
							&nbsp;댓글</p>
							</div>
							<div class="col-sm-1"></div>
						<br><br>
						<c:forEach items="${requestScope.listQNAReply}" var="comment" varStatus="status">
						<div class="col-sm-1"></div>
							<div class="col-sm-1">
							<p align="left">${comment.userVO.nickname}</p>
							</div>
							<div class="col-sm-7">
							<form id="updateQnaReply${status.index}">
									<div align="left" id="modifyReplyDiv_${status.index}"></div>
									<pre style="display:block;" id="content">${comment.qnaRepContent}</pre>
									<input type="hidden" name="qnaRepNo" value="${comment.qnaRepNo}">
								</form>
								</div>
								<form action="${pageContext.request.contextPath}/deleteAcaQnAReply.do?qnaRepNo=${comment.qnaRepNo}&qnaNo=${detailQNA.qnaNo}"
									method="post" id="qnaReplyDelete">
									<sec:csrfInput />
								</form>
								<div align="right" class="col-sm-2">
								<button type="button" class="aca-btn jBtn"
										id="modifyReply" value="${status.index}">수정</button>
								<button form="updateQnaReply${status.index}" style="display:none;" type="button" class="aca-btn replyBtn"
										id="replyBtn${status.index}" value="${status.index}">수정</button>
								<input form="qnaReplyDelete" class="aca-btn" type="submit"
										value="삭제">
										</div>
								<div class="col-sm-1"></div>
						</c:forEach>
						<div class="col-sm-1"></div>
						<div class="col-sm-10" align="center">
						<div class="pagingInfo">
		<c:set var="pb" value="${requestScope.pagingBean}"></c:set>
		<ul class="pagination">
			<c:if test="${pb.previousPageGroup}">
				<li><a
					href="${pageContext.request.contextPath}/detailAcaQNA.do?pageNo=${pb.startPageOfPageGroup-1}&qnaNo=${requestScope.detailQNA.qnaNo}">&laquo;</a></li>
			</c:if>
			<c:forEach var="i" begin="${pb.startPageOfPageGroup}"
				end="${pb.endPageOfPageGroup}">
				<c:choose>
					<c:when test="${pb.nowPage!=i}">
						<li><a
							href="${pageContext.request.contextPath}/detailAcaQNA.do?pageNo=${i}&qnaNo=${requestScope.detailQNA.qnaNo}">${i}</a></li>
					</c:when>
					<c:otherwise>
						<li class="active"><a href="#">${i}</a></li>
					</c:otherwise>
				</c:choose>
	&nbsp;
	</c:forEach>
			<c:if test="${pb.nextPageGroup}">
				<li><a
					href="${pageContext.request.contextPath}/detailAcaQNA.do?pageNo=${pb.endPageOfPageGroup+1}&qnaNo=${requestScope.detailQNA.qnaNo}">&raquo;</a></li>
			</c:if>
		</ul>
	</div>
	</div>
	<div class="col-sm-1"></div>
					</c:if>
					
					<div class="col-sm-1"></div>
					<div class="col-sm-10" align="center">
					<label for="comment">댓글</label>
					</div>
					<div class="col-sm-1"></div>
					
					
					<sec:authorize access="hasRole('ROLE_USER')">
						<sec:authentication var="mvo" property="principal" />
						<div class="col-sm-2"></div>
						<div class="col-sm-7">
						<form id="qnaReplyRegister" action="${pageContext.request.contextPath}/registerAcaQnAReply.do"
							method="post">
							<sec:csrfInput />
								<input type="hidden" name="userVO.usrId" value="${mvo.usrId}">
								<input type="hidden" name="acaQNAVO.qnaNo"
									value="${detailQNA.qnaNo}">
								<textarea required class="form-control" rows="1" id="qnaRepContent"
									name="qnaRepContent" placeholder="댓글을 입력하세요"></textarea>
							
						</form>
						</div>
						<div class="col-sm-2" align="center">
						<button form="qnaReplyRegister" onclick="return checkComment()" class="aca-btn"
								>등록</button>
						</div>
						<div class="col-sm-1"></div>
					</sec:authorize>
	</div>
</div>
<script type="text/javascript">
$(document).ready(function(){
	var moReply="";
	$("#deleteForm").submit(function(){
		if(confirm("삭제하시겠습니까?")==false){
			return false;
		}else{
			return true;
		}
	});
	$("#updateForm").submit(function(){
		if(confirm("수정하시겠습니까?")==false){
			return false;
		}else{
			return true;
		}
	});
	$(".jBtn").click(function(e){
		$(".jBtn").hide();
		$("#replyBtn"+$(this).val()).show();
		$("#content").hide();
		moReply=$(this).val();
		$("#modifyReplyDiv_"+$(this).val()).append(
				"<textarea required class='form-control updateQnaRepContent"+$(this).val()+"' rows='1' id='qnaRepContent"+$(this).val()+"' name='qnaRepContent' placeholer='${comment.qnaRepContent}'></textarea>"
				);
	});//click
	
	$(".replyBtn"+$(this).val()).click(function(e){
		var value=$("#qnaRepContent"+$(this).val()).val();
		if(value==""){
			alert("내용을 입력하세요");
			return false;
		}else{
		$.ajax({
			type:"POST",
			url:"${pageContext.request.contextPath}/updateAcaQnAReply.do",		
			data:$("#updateQnaReply"+$(this).val()).serialize(),	
			beforeSend : function(xhr){   /*데이터를 전송하기 전에 헤더에 csrf값을 설정한다*/
                xhr.setRequestHeader("${_csrf.headerName}", "${_csrf.token}");
            },
			success:function(data){
				var info="";
				info+="<pre>"+data+"</pre>";
				$("#modifyReplyDiv_"+moReply).html(info);
				}
		});//ajax
		}
		$("#replyBtn"+$(this).val()).hide();
		$(".jBtn").show();
	});//click
});//ready
</script>
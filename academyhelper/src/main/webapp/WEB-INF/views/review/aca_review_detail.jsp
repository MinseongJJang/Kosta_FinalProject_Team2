<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions"%>
<%@ taglib prefix="sec" uri="http://www.springframework.org/security/tags" %>
<sec:authentication var="mvo" property="principal"/>


<table class="table">
<thead>
	<tr>
		<th>글번호</th>
		<th>제목</th>
		<th>등록일</th>
		<th>조회수</th>
		<th>작성자</th>
		<th>과정명</th>
	</tr>
</thead>
<tbody>
	<tr>
		<td>${requestScope.review.acaRevNo }</td>
		<td>${requestScope.review.acaRevTitle }</td>
		<td>${requestScope.review.acaRevRegdate }</td>
		<td>${requestScope.review.acaRevHits }</td>
		<td>${requestScope.review.userVO.usrName }</td>
		<td>${requestScope.review.curriculumVO.curName }</td>
	</tr>
</tbody>
<tfoot>
	<tr>
		<td>내용</td>
		<td>${requestScope.review.acaRevContent }</td>
	</tr>
	<tr>
		<td>해시태그</td>
		<td>
			<c:forEach items="${requestScope.hashList }" var="hash">
				<a>${hash.hashTagName}</a>&nbsp;&nbsp;&nbsp;
			</c:forEach>
		</td>
	</tr>
	<tr>
		<td>교육과정 만족도 : </td>
		<td>${requestScope.satisfaction.curSatis }
		</td>
	</tr>
	<tr>
	 	<td>편의시설 만족도 :</td>
	 	<td> ${requestScope.satisfaction.amenitiesSatis }</td>
	</tr>
	<tr>
		<td> 강사님 만족도 :</td>
		<td>${requestScope.satisfaction.lecturerSatis }</td>
	</tr>
	<tr>
		<td>취업연계 만족도 : </td>
		<td>${requestScope.satisfaction.empLinksSatis }</td>
	</tr>
	<tr>
		<td>교통 만족도 : </td>
		<td>${requestScope.satisfaction.trafficSatis }</td>
	</tr>
</tfoot>
</table>

<c:if test="${requestScope.review.userVO.usrId == mvo.usrId }">
	<button id="updateReview">수정</button>
	<button id="deleteReview">삭제</button>
</c:if>

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
								<form action="${pageContext.request.contextPath}/deleteReviewReply.do?qnaRepNo=${comment.qnaRepNo}&qnaNo=${detailQNA.qnaNo}"
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
						<form id="qnaReplyRegister" action="${pageContext.request.contextPath}/registerReviewReply.do"
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


<script type="text/javascript">
	$(document).ready(function(){
		$("#updateReview").click(function(){
			if(confirm("수정하시겠습니까?")){
				location.href="updateReviewForm.do?acaRevNo="+${requestScope.review.acaRevNo};
			}
		});//click
		$("#deleteReview").click(function(){
			if(confirm("삭제하시겠습니까?")){
				location.href="deleteReview.do?acaRevNo="+${requestScope.review.acaRevNo}
			}
		});//click
		
//=========================댓글 form ===========================
		
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
				url:"${pageContext.request.contextPath}/updateReviewReply.do",		
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
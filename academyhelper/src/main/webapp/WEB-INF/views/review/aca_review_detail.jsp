<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions"%>
<%@ taglib prefix="sec" uri="http://www.springframework.org/security/tags" %>
<sec:authentication var="mvo" property="principal"/>
<script type="text/javascript">
	$(document).ready(function(){
		var mvoId = $("mvoId").val();
		var usrId = "";
		var acaRevRepNo = "";
		var acaRevNo = "";
		$("#reviewReplyRegisterBtn").click(function(){
			if(confirm("댓글을 등록하시겠습니까?")){
				$.ajax({
					type:"post",
					url:"${pageContext.request.contextPath}/registerReviewReply.do",
					data:$("#repRegisterForm").serialize(),
					beforeSend : function(xhr){
		                xhr.setRequestHeader("${_csrf.headerName}", "${_csrf.token}");
		            },
					success:function(result){
						update(result.acaReviewReplyList);	
						updatePaging(result.pb);
					}//success
				});//ajax
			}//if
		});//click
	
	});//ready
	function updateReply(index){
		$.ajax({
			type:"post",
			url:"${pageContext.request.contextPath}/updateReviewReply.do",
			data:$("#repUpdateForm"+index).serialize(),
			beforeSend : function(xhr){
				xhr.setRequestHeader("${_csrf.headerName}", "${_csrf.token}");
			},
			success:function(result){
				update(result.acaReviewReplyList);
				updatePaging(result.pb)
			}
		});//ajax 
	}
	function update(reply){
		var info = "";
	   $.each(reply,function(index,reply){
		   
		   usrId = reply.userVO.usrId;
		   acaRevRepNo = reply.acaRevRepNo;
		   acaRevNo = reply.acaReviewPostVO.acaRevNo;
		   index++;
		        info +='<form method="post" id="repUpdateForm'+index+'">';
				info +='<sec:csrfInput/>';
				info +='<span id="contentArea'+index+'">';
				info +='<pre style="display:block;" id="content'+index+'" >'+reply.acaRevRepContent+'</pre>';
				info +='<input type="hidden" name="userVO.usrId" value="'+usrId+'">'
				info +='<input type="hidden" name="acaRevRepNo" value="'+acaRevRepNo+'">';
				info +='<input type="hidden" name="acaReviewPostVO.acaRevNo" value="'+acaRevNo+'">';
				if(mvoId !="" && mvoId == usrId){
					info +='<input type="button" id="updateReply'+index+'" onclick="updateReplyForm\(\''+index+'\',\''+usrId+'\',\''+acaRevNo+'\',\''+acaRevRepNo+'\',\''+mvoId+'\')" value="수정">';
					info +='<input type="button" id="deleteReply'+index+'" onclick="deleteReply('+index+')" value="삭제">';
				}
				info +='</span>';
				info +='<br>';
				info +='</form>';
	   });
	 
			$("#updateDiv").html(info);
			$("#registerReplyForm").val("");
		
	}
 	function deleteReply(index){
		if(confirm("댓글을 삭제하시겠습니까?")){
			$.ajax({
				type:"post",
				url:"${pageContext.request.contextPath}/deleteReviewReply.do",
				data:$("#repUpdateForm"+index).serialize(),
				beforeSend : function(xhr){
	                xhr.setRequestHeader("${_csrf.headerName}", "${_csrf.token}");
	            },
	            success:function(result){
					update(result.acaReviewReplyList);	
					updatePaging(result.pb);
	            }//success
			});//ajax
		}
	} 
 	function updateReplyForm(index,usrId,acaRevNo,acaRevRepNo,mvo){
 		mvoId = mvo;
 		for(i=1;i<6;i++){
			$("#updateReply"+i).hide();
			$("#deleteReply"+i).hide();
		}

		var info ="";
		
		info += "<textarea name='acaRevRepContent'></textarea>";
		if(usrId == mvoId){
			info += "<input type='button' value='수정' id='update' onclick='updateReply("+index+")'>";
			info += "<input type='reset' value='취소' id='reset'>";
		}
		info += "<input type='hidden' name='userVO.usrId' value='"+usrId+"'>";
		info += "<input type='hidden' name='acaReviewPostVO.acaRevNo' value='"+acaRevNo+"'>";
		info += "<input type='hidden' name='acaRevRepNo' value='"+acaRevRepNo+"'>";
		
		$("#contentArea"+index).html(info);
	} 
 	function pageMove(pageNo){
 		$.ajax({
 			type:"post",
 			url:"${pageContext.request.contextPath}/listReviewReply.do",
 			data:$("#repRegisterForm").serialize()+"&pageNo="+pageNo,
 			beforeSend : function(xhr){
 				xhr.setRequestHeader("${_csrf.headerName}", "${_csrf.token}");
 			},
 			success : function(result){
 				update(result.acaReviewReplyList);
 				updatePaging(result.pb);
 			}
 		});//ajax
 	}
 	function updatePaging(result){
 		mvoId = $("#mvoId").val();
 		var info ="";
 		var end = result.endPageOfPageGroup+1;
 		var start = result.startPageOfPageGroup-1;
 		info += '<ul class="pagination">';
 		if(result.previousPageGroup){
 			info += '<li><a href="javascript:pageMove('+start+')">&laquo;</a></li>';
 		}
		for(i=result.startPageOfPageGroup;i<=result.endPageOfPageGroup;i++){
			if(i==result.nowPage){
				info += '<li class="active"><a>'+i+'</a></li>';
			}else{
				info += '<li><a href="javascript:pageMove('+i+')">'+i+'</a></li>'
			}
		}
		if(result.nextPageGroup){
			info += '<li><a href="javascript:pageMove('+end+')">&raquo;</a></li>'
		}
		info += '</ul>';
		$("#pagingInfo").html(info);
 	}
</script> 
<input type="hidden" value="${mvo.usrId }" id="mvoId">

<div class="container">
	<div class="row">
		<div class="col-sm-1"></div>
		<div class="col-sm-10 text-center"
			style="margin-top: 100px; padding-bottom: 100px;">
			<div style="margin-top: 100px; text-align: center;" align="center">
				<table class="table">
					<thead>
				   		<tr>
							<td colspan="8" align="center"><h3>기관 후기 상세보기</h3></td>
						</tr>
						<tr>
							<td style="border-top:0px"></td>
						</tr>
					</thead>
				         <tr>
				            <th>글번호</th>
				            <td>${requestScope.review.acaRevNo }</td>
				            <th>제목</th>
				            <td>${requestScope.review.acaRevTitle } </td>
				            <th>작성자</th>
				            <td>${requestScope.review.userVO.usrName }</td>
				            <th>등록일</th>
				            <td>${requestScope.review.acaRevRegdate }</td>
				         </tr>
				         <tr>
				         	<th colspan="8">과정명</th>
				         </tr>
				         <tr>
				         	<td colspan="8">${requestScope.review.curriculumVO.curName }</td>
				         </tr>
				         <tr>
				         	<th colspan="1">내용</th>
				         	<td colspan="7"><pre style="white-space: pre-wrap;">${requestScope.review.acaRevContent }</pre></td>
				         </tr>
				         <tr>
							<td colspan="8">
								<c:forEach items="${requestScope.hashList }" var="hash">
									<a>${hash.hashTagName}</a>&nbsp;&nbsp;&nbsp;
								</c:forEach>
							</td>
						</tr>
						<tr>
							<td colspan="1">교육과정 만족도 </td>
							<td colspan="7">${requestScope.satisfaction.curSatis }</td>
							
						</tr>
						<tr>
						 	<td colspan="1">편의시설 만족도</td>
						 	<td colspan="7"> ${requestScope.satisfaction.amenitiesSatis }</td>
						</tr>
						<tr>
							<td colspan="1"> 강사님 만족도</td>
							<td colspan="7">${requestScope.satisfaction.lecturerSatis }</td>
						</tr>
						<tr>
							<td colspan="1">취업연계 만족도</td>
							<td colspan="7">${requestScope.satisfaction.empLinksSatis }</td>
						</tr>
						<tr>
							<td colspan="1">교통 만족도</td>
							<td colspan="7">${requestScope.satisfaction.trafficSatis }</td>
						</tr>
				   <tbody>
			      		<c:if test="${mvo.usrId == requestScope.review.userVO.usrId || mvo.usrId == 'java'}">
					      <tr>
					      	<td colspan="8" align="right">
							   	<button form="deleteForm" type="submit" class="aca-btn">삭제</button>
								<button form="updateForm" type="submit" class="aca-btn">수정</button>
							 	<form action="deleteReview.do" id="deleteForm" method="post">
									<sec:csrfInput />
									<input type="hidden" name="acaRevNo" value="${requestScope.review.acaRevNo}">
								</form>
								<form action="updateReviewForm.do" id="updateForm" method="post">
									<input type="hidden" name="acaRevNo" value="${requestScope.review.acaRevNo}">
									<sec:csrfInput />
								</form>
					      	</td>
					      </tr>
					     </c:if>
					</tbody>
				</table>
			</div>
		</div>
		<div class="col-sm-1"></div>
	</div>
</div>
<div class="container">
	<div id="updateDiv">
		<c:forEach items="${requestScope.reply.acaReviewReplyList }" var="reply" varStatus="index">
			<form method="post" id="repUpdateForm${index.count }">
				<sec:csrfInput/>
				<span id="contentArea${index.count }">
					<pre style="display:block;" id="content${index.count}" >${reply.acaRevRepContent }</pre>
					<input type="hidden" name="userVO.usrId" value="${reply.userVO.usrId }">
					<input type="hidden" name="acaReviewPostVO.acaRevNo" value="${requestScope.review.acaRevNo }">
					<input type="hidden" name="acaRevRepNo" value="${reply.acaRevRepNo }">
					<c:if test="${reply.userVO.usrId == mvo.usrId }">
						<input type="button" id="updateReply${index.count }" onclick="updateReplyForm('${index.count}','${reply.userVO.usrId}','${requestScope.review.acaRevNo }','${reply.acaRevRepNo }','${mvo.usrId }')" value="수정">
						<input type="button" id="deleteReply${index.count }" onclick="deleteReply('${index.count}')" value="삭제">
					</c:if>
				</span>
				<br>
			</form>
		</c:forEach>
	</div>
		<div class="pagingInfo" id="pagingInfo">
			<ul class="pagination">
				<c:if test="${requestScope.reply.pb.previousPageGroup}">
					<li><a href="javascript:pageMove('${requestScope.reply.pb.startPageOfPageGroup-1 }')">&laquo;</a></li>
				</c:if>
				<c:forEach var="page" begin="${requestScope.reply.pb.startPageOfPageGroup }" end="${requestScope.reply.pb.endPageOfPageGroup }">
					<c:choose>
						<c:when test="${page==requestScope.reply.pb.nowPage}">
							<li class="active"><a>${page}</a></li>
						</c:when>
						<c:otherwise>
							<li><a href="javascript:pageMove('${page}')">${page}</a></li>
						</c:otherwise>
					</c:choose>
				</c:forEach>
					<c:if test="${requestScope.reply.pb.nextPageGroup}">
						<li><a href="javascript:pageMove('${requestScope.reply.pb.endPageOfPageGroup+1 }')">&raquo;</a></li>
					</c:if>
			</ul>
		</div>
	
	
	<form method="post" id="repRegisterForm">
		<sec:csrfInput/>
		<input type="hidden" name="userVO.usrId" value="${mvo.usrId }">
		<input type="hidden" name="acaReviewPostVO.acaRevNo" value="${requestScope.review.acaRevNo }">
		<input type="text" name="acaRevRepContent" id="registerReplyForm">
		<input type="button" id="reviewReplyRegisterBtn" value="등록">
		<input type="reset" value="취소">
	</form>
</div>
<style type="text/css">
.title { font-size: 20px; }
.title:before {
    content: '';
    display: inline-block;
    width: 32px;
    height: 32px;
    margin-right: 8px;
    vertical-align: middle;
    background: #e50020 url('//cdn.lezhin.com/files/assets/page/image/lzlogo_30.png') no-repeat center;
    background-size: 24px;
}
.rating,
.rating *,
.rating :before,
.rating :after { box-sizing: border-box; }
.rating {
    position: relative;
    padding: 80px 0 10px;
    text-align: center;
    border: 0;
    border-top: 1px solid #dbdee3;
    border-bottom: 1px solid #dbdee3;
}
.ratingLegend {
    position: absolute;
    top: 48px;
    left: 0;
    right: 0;
    text-align: center;
    line-height: 24px;
    font-size: 16px;
    color: #ef5630;
}
.ratingGroup {
    position: relative;
    width: 200px;
    height: 40px;
    margin: 0 auto 12px;
    text-align: center;
    font-size: 0;
    background: url('//cdn.lezhin.com/files/assets/img/challenge_star_icon.png') repeat-x;
    background-size: 40px;
}
.ratingInput {
    position: absolute;
    top: 0;
    left: 0;
    margin: 0;
    height: 40px;
    border: 0;
    -webkit-appearance: none;
    -webkit-border-radius: 0;
}
.ratingInput:nth-of-type(1) {
    width: 20px;
    z-index: 10;
}
.ratingInput:nth-of-type(2) {
    width: 40px;
    z-index: 9;
}
.ratingInput:nth-of-type(3) {
    width: 60px;
    z-index: 8;
}
.ratingInput:nth-of-type(4) {
    width: 80px;
    z-index: 7;
}
.ratingInput:nth-of-type(5) {
    width: 100px;
    z-index: 6;
}
.ratingInput:nth-of-type(6) {
    width: 120px;
    z-index: 5;
}
.ratingInput:nth-of-type(7) {
    width: 140px;
    z-index: 4;
}
.ratingInput:nth-of-type(8) {
    width: 160px;
    z-index: 3;
}
.ratingInput:nth-of-type(9) {
    width: 180px;
    z-index: 2;
}
.ratingInput:nth-of-type(10) {
    width: 200px;
    z-index: 1;
}
.ratingInput:enabled:hover,
.ratingInput:enabled:focus,
.ratingInput:checked {
    background: url('//cdn.lezhin.com/files/assets/img/challenge_star_icon.png') repeat-x 0 -40px;
    background-size: 40px;
}
.ratingInput:enabled:hover + label,
.ratingInput:enabled:focus + label,
.ratingInput:checked + label { visibility: visible; }
.ratingLabel {
    position: absolute;
    top: -32px;
    left: 0;
    right: 0;
    visibility: hidden;
    text-align: center;
    line-height: 24px;
    font-size: 16px;
    color: #ef5630;
    background: #fff;
}
</style>


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
            <br>
            <sec:authentication var="mvo" property="principal" />
            
                  <div id="refreshReply" class="col-sm-12">
                  <c:forEach items="${requestScope.listQNAReply.acaQNAReplyList}" var="comment" varStatus="status">
                  <div class="col-sm-12">
                  <div class="col-sm-1"></div>
                     <div class="col-sm-1">
                     <p align="left">${comment.userVO.nickname}</p>
                     </div>
                     <div class="col-sm-7">
                     <form id="updateQnaReply${status.index}" method="post">
                           <div align="left" id="modifyReplyDiv_${status.index}">
                           <pre style="display:block;" id="content${status.index}" >${comment.qnaRepContent}</pre>
                           </div>
                           <input type="hidden" name="qnaRepNo" value="${comment.qnaRepNo}">
                           <input type="hidden" name="pageNo" value="${requestScope.pageNo}">
                           <input type="hidden" name="qnaNo" value="${detailQNA.qnaNo}">
                        </form>
                        </div>
                        <form id="deleteQnaReply${status.index}" method="post">
                           <input type="hidden" name="qnaRepNo" value="${comment.qnaRepNo}">
                           <input type="hidden" name="qnaNo" value="${detailQNA.qnaNo}">
                           <input type="hidden" name="pageNo" value="${requestScope.pageNo}">
                        </form>
                        <div align="right" class="col-sm-2">
                        <button type="button" class="aca-btn jBtn"
                              id="modifyReply" value="${status.index}">수정</button>
                        <button form="updateQnaReply${status.index}" style="display:none;" type="button" class="aca-btn replyBtn"
                              id="replyBtn${status.index}" value="${status.index}">수정</button>
                        <button form="deleteQnaReply${status.index}" class="aca-btn replyDeleteBtn" type="button"
                              id="replyDeleteBtn${status.index}"  value="${status.index}">삭제</button>
                              </div>
                        <div class="col-sm-1"></div>
                        </div>
                  </c:forEach>
                  </div>
                  
                  
                  
                  <div class="col-sm-1"></div>
                  <div class="col-sm-10" align="center">
                  <div class="pagingInfo" id="qnaReplyPagingRefresh">
      <c:set var="pb" value="${requestScope.listQNAReply.pb}"></c:set>
      <ul class="pagination">
         <c:if test="${pb.previousPageGroup}">
            <li><a
               href="${pageContext.request.contextPath}/listAcaQNAReply.do?pageNo=${pb.startPageOfPageGroup-1}&qnaNo=${requestScope.detailQNA.qnaNo}">&laquo;</a></li>
         </c:if>
         <c:forEach var="i" begin="${pb.startPageOfPageGroup}"
            end="${pb.endPageOfPageGroup}">
            <c:choose>
               <c:when test="${pb.nowPage!=i}">
                  <li><a
                     href="${pageContext.request.contextPath}/listAcaQNAReply.do?pageNo=${i}&qnaNo=${requestScope.detailQNA.qnaNo}">${i}</a></li>
               </c:when>
               <c:otherwise>
                  <li class="active"><a href="#">${i}</a></li>
               </c:otherwise>
            </c:choose>
   &nbsp;
   </c:forEach>
         <c:if test="${pb.nextPageGroup}">
            <li><a
               href="${pageContext.request.contextPath}/listAcaQNAReply.do?pageNo=${pb.endPageOfPageGroup+1}&qnaNo=${requestScope.detailQNA.qnaNo}">&raquo;</a></li>
         </c:if>
      </ul>
   </div>
   </div>
   <div class="col-sm-1"></div>
                  <div class="col-sm-3"></div>
                  <div class="col-sm-5">
                  <form id="qnaReplyRegister" method="post">
                        <input type="hidden" name="userVO.usrId" value="${mvo.usrId}">
                        <input type="hidden" name="acaQNAVO.qnaNo"
                           value="${detailQNA.qnaNo}">
                        <textarea required class="form-control" rows="1" id="qnaRepContentRegister"
                           name="qnaRepContent" placeholder="댓글을 입력하세요"></textarea>
                  </form>
                  </div>
                  <div class="col-sm-2" align="center">
                  <button form="qnaReplyRegister" id="replyRegister" class="aca-btn" type="button"
                        >등록</button>
                  </div>
                  <div class="col-sm-1"></div>
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
	$("#replyRegister").click(function(){
		$.ajax({
			type:"POST",
			url:"${pageContext.request.contextPath}/registerAcaQnAReply.do",		
			data:$("#qnaReplyRegister").serialize(),	
			beforeSend : function(xhr){
                xhr.setRequestHeader("${_csrf.headerName}", "${_csrf.token}");
            },
			success:function(result){
				qnaReplyRefresh(result.acaQNAReplyList,result.pb);
				qnaReplyPagingRefresh(result.acaQNAReplyList,result.pb);
			},
			complete : function() {
				$("#qnaReplyRegister").val("");
				$("#qnaRepContentRegister").val("");
		    }
		});//ajax
	});
	$(document).on("click",".jBtn",function(event){
		$(".jBtn").hide();
	      $("#replyBtn"+$(this).val()).show();
	      $("#content").hide();
	      moReply=$(this).val();
	      $("#modifyReplyDiv_"+$(this).val()).append(
	            "<textarea required class='form-control updateQnaRepContent"+$(this).val()+"' rows='1' id='qnaRepContent"+$(this).val()+"' name='qnaRepContent'></textarea>"
	            );
	   });//click
	$(document).on("click",".replyBtn"+$(this).val(),function(event){
		if($("#qnaRepContent"+$(this).val()).val()==""){
			alert("수정내용을입력하셈");
			return false;
		}
		$.ajax({
			type:"POST",
			url:"${pageContext.request.contextPath}/updateAcaQnAReply.do",		
			data:$("#updateQnaReply"+$(this).val()).serialize(),	
			beforeSend : function(xhr){
                xhr.setRequestHeader("${_csrf.headerName}", "${_csrf.token}");
            },
			success:function(result){
				qnaReplyRefresh(result.acaQNAReplyList,result.pb);
				qnaReplyPagingRefresh(result.acaQNAReplyList,result.pb);
			},
			complete : function() {
				$("#updateQnaReply"+$(this).val(""));
		    }
		});//ajax
		$("#replyBtn"+$(this).val()).hide();
		$(".jBtn").show();
	});//click
	
	$(document).on("click",".replyDeleteBtn"+$(this).val(),function(event){
		if(confirm("삭제하시겠습니까?")){
			$.ajax({
				type:"POST",
				url:"${pageContext.request.contextPath}/deleteAcaQnAReply.do",		
				data:$("#deleteQnaReply"+$(this).val()).serialize(),
				beforeSend : function(xhr){
	                xhr.setRequestHeader("${_csrf.headerName}", "${_csrf.token}");
	            },
				success: function(result){
					qnaReplyRefresh(result.acaQNAReplyList,result.pb);
					qnaReplyPagingRefresh(result.acaQNAReplyList,result.pb);
				},
				complete : function() {
					$("#deleteQnaReply"+$(this).val(""));
			    }
			});//ajax
		}//if
	});//click
	function qnaReplyRefresh(acaQNAReplyList,pb){
        var info="";
        $.each(acaQNAReplyList, function(index,listQNAReply){
        index=index+1;
        info+="<div class='col-sm-12'><div class='col-sm-1'></div>";
        info+="<div class='col-sm-1'>";
        info+="<p align='left'>"+listQNAReply.userVO.nickname+"</p>";
        info+="</div>";
        info+="<div class='col-sm-7'>";
        info+="<form id='updateQnaReply"+index+"'>";
        info+="<div align='left' id='modifyReplyDiv_"+index+"'>";
        info+="<pre style='display:block;' id='content"+index+"'>"+listQNAReply.qnaRepContent+"</pre></div>";
        info+="<input type='hidden' name='qnaRepNo' value='"+listQNAReply.qnaRepNo+"'>";
        info+="<input type='hidden' name='pageNo' value='"+pb.nowPage+"'>";
        info+="<input type='hidden' name='qnaNo' value='"+listQNAReply.acaQNAVO.qnaNo+"'></form></div>";
        info+="<form id='deleteQnaReply"+index+"'>";
        info+="<input type='hidden' name='qnaRepNo' value='"+listQNAReply.qnaRepNo+"'>";
        info+="<input type='hidden' name='qnaNo' value='"+listQNAReply.acaQNAVO.qnaNo+"'>";
        info+="<input type='hidden' name='pageNo' value='"+pb.nowPage+"'>";
        info+="</form><div align='right' class='col-sm-2'>";
        info+="<button type='button' class='aca-btn jBtn' id='modifyReply' value='"+index+"'>수정</button>";
        info+="<button form='updateQnaReply"+index+"' style='display:none;' type='button' class='aca-btn replyBtn'";
        info+="id='replyBtn"+index+"' value='"+index+"'>수정</button>";
        info+="<button form='qnaReplyDelete"+index+"' class='aca-btn replyDeleteBtn' type='button'";
        info+="id='replyDeleteBtn"+index+"' value='"+index+"'>삭제</button>";
        info+="</div><div class='col-sm-1'></div></div>";
        });
        $("#refreshReply").html(info);
        }
	function qnaReplyPagingRefresh(pb,listQNAReply){
		var paging="<ul class='pagination'>";
		var start=pb.startPageOfPageGroup;
	    var end=pb.endPageOfPageGroup;
	      if(pb.previousPageGroup){
	    	 paging+="<li><a href='${pageContext.request.contextPath}/listAcaQNAReply.do?pageNo="+pb.startPageOfPageGroup-1+"&qnaNo="+listQNAReply.acaQNAVO.qnaNo+"'>&laquo;</a></li>"; 
	      }
	      for(var i=start;i<end;i++){
	    	  if(pb.nowPage!=i){
	    		  paging+="<li><a href='${pageContext.request.contextPath}/listAcaQNAReply.do?pageNo="+i+"&qnaNo="+listQNAReply.acaQNAVO.qnaNo+"'>"+i+"</a></li>";
	    	  }else{
	    		  paging+="<li class='active'><a href='#'>"+i+"</a></li>";
	    	  }
	    	  paging+="&nbsp;";
	     }   
	     if(pb.nextPageGroup){
	    	 paging+="<li><a href='${pageContext.request.contextPath}/listAcaQNAReply.do?pageNo="+pb.endPageOfPageGroup+1+"&qnaNo="+listQNAReply.acaQNAVO.qnaNo+"'>&raquo;</a></li></ul>";
     	 }
	     $("#qnaReplyPagingRefresh").html(paging);
	}
});//ready
</script>
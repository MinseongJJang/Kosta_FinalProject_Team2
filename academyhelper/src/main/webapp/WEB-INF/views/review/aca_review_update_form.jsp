<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="sec" uri="http://www.springframework.org/security/tags" %>
<script type="text/javascript">
	$(document).ready(function(){
		var count = 0;
		var hash = [];
		$("#hashInsert").click(function(){
			var hashtagInsert = $("#hashtagInsert").val();
			hash = hashtagInsert.split('#');
			if(hash.length==2){
			if(count<5){
			if(hashtagInsert.includes("#")){
				if(count<4){
					 count++
					$("#hashtag").val($("#hashtag").val()+hashtagInsert+",");
					$("#hashDeleteCheck").val("false");
					$("#hashtagInsert").val("");
				}else{
					 count++
					$("#hashtag").val($("#hashtag").val()+hashtagInsert);
					$("#hashtagInsert").val("");
				}
				$("#hashtagInsert").focus();
			}
				}
				else{
				alert("해시태그는 5개까지 가능해요~~");
				$("#hashtagInsert").val("");
				}
			}else if(!hashtagInsert.includes("#")){
				alert("작성 양식에 어긋납니다.");
			}else{
				alert("해시태그는 1개씩만 등록가능해요~~ ")
				$("#hashtagInsert").val("");
				$("#hashtagInsert").focus();
			}
		});//click
		
		$("#hashDelete").click(function(){
			$("#hashtag").val("");
			$("#hashDeleteCheck").val("true");
		});//click
		
		$("#updateButton").click(function(){
			var flag = $("#hashDeleteCheck").val();
			if(flag=="true"){
				alert("해시태그를 입력하세요.");
				return false;
			}
		});//
	});//ready
</script>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<div class="container" >
	<div class="row">
		<div class="col-sm-1"></div>
		<div class="col-sm-10 text-center" 	style="margin-top: 100px; padding-bottom: 100px;">
			<div style="margin-top: 100px; text-align:center;" align="center">
			<sec:authentication var="mvo" property="principal" />  
			<form action="${pageContext.request.contextPath}/updateAcaReviewPost.do" method="post" id="register_form">
			<sec:csrfInput/>
			<table class="table">
				   <thead style="text-align:center;">
				   		<tr>
							<td colspan="4" align="center"><h3>후기 수정하기</h3></td>
						</tr>
						<tr>
							<td>학원명 : ${requestScope.review.curriculumVO.academyVO.acaName }
							<input type="hidden" name="acaNo" value="${requestScope.review.curriculumVO.academyVO.acaNo }">
							</td>
							<td>교육과정명 : ${requestScope.review.curriculumVO.curName }
							<input type="hidden" name="curNo" value="${requestScope.review.curriculumVO.curNo }">
							<input type="hidden" name="acaRevNo" value="${requestScope.review.acaRevNo }">
							</td>
						</tr>
				   </thead>
				   <tbody>
						<tr >
					        <td>제목</td>
					        <td><input value="${requestScope.review.acaRevTitle }" type="text" name="acaRevTitle" placeholder="제목을 입력하세요" required="required" style="width:90%"></td>
				      	</tr>
				      	<tr>
				      		<td>내용</td>
				      		<td>
				      		<pre><textarea  cols="90" rows="15" id="acaRevContent" name="acaRevContent" required="required" placeholder="내용을 입력하세요">
				      		${requestScope.review.acaRevContent }
				      		</textarea></pre>
				      		<script type="text/javascript">
							CKEDITOR.replace("acaRevContent");
							</script>	
				      		</td>
				      	</tr>
				      	<tr>
				      		<td><label for="label-registerProduct">Hashtag</label><br></td>
					      	<td><div class="input-group">
							<input type="text" class="form-control" id="hashtagInsert"  style="width:90%;" placeholder="Hashtag pattern Example : #SpaceTaskForce">
							&nbsp;&nbsp;<span><input type="button" id="hashInsert" class="btn" value="추가" style="height: 60%; background-color: #32c5d2; color: white" ></span>
							<br><br><br>
							<div id="hash"></div>
							<input value="${requestScope.hashList}" type="text" class="form-control" id="hashtag" name="hashTagName" required="required" style="width: 60%;" readonly="readonly">&nbsp;&nbsp;
							<span><input type="button" id="hashDelete" class="btn" value="전체삭제" style="height: 80%; background-color: #32c5d2; color: white" ></span>
							</div>
							<input type="hidden" id="hashDeleteCheck" name="hashDeleteCheck" value="false">
							</td>
				      	</tr>
				    
				   </tbody>
				   <tfoot>
				  		<tr>
						   	<td colspan="2" align="right">
						   		<sec:authorize access="hasRole('ROLE_ACADEMY')">
								     <div class="btnArea">
									     <button type="submit" class="aca-btn" id="updateButton">확인</button>  
									     <input type="hidden" value="${mvo.usrId}" name="userVO.usrId">
									     <button type="reset" class="aca-btn" >취소</button>   
								    </div>  
							    </sec:authorize>	
						   	</td>
				   		</tr>
				   </tfoot>
				</table>
	
			  </form>
			</div>
		</div>
		<div class="col-sm-1"></div>
	</div>
</div>
<form>
    
</form>

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
    padding: 80px 0 30px;
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
    color: #333;
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
    color: #333;
    background: #fff;
}
</style>
    
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="sec" uri="http://www.springframework.org/security/tags" %>
<link href="http://netdna.bootstrapcdn.com/bootstrap/3.3.5/css/bootstrap.css" rel="stylesheet">
<script src="http://cdnjs.cloudflare.com/ajax/libs/jquery/3.2.1/jquery.js"></script> 
<script src="http://netdna.bootstrapcdn.com/bootstrap/3.3.5/js/bootstrap.js"></script> 
<link href="http://cdnjs.cloudflare.com/ajax/libs/summernote/0.8.9/summernote.css" rel="stylesheet">
<script src="http://cdnjs.cloudflare.com/ajax/libs/summernote/0.8.9/summernote.js"></script>
 
<script type="text/javascript">
	$(document).ready(function(){
		$("#academySelect").change(function() {
			var acaNo = $(this).val();
			if(acaNo == 0){
				$("#curriculumSelect").html("");
				return false;
			}else{
				$.ajax({
					type:"post",
					url :"${pageContext.request.contextPath}/getCurriculumList.do",
					data : "acaNo="+acaNo,
					beforeSend : function(xhr){   /*데이터를 전송하기 전에 헤더에 csrf값을 설정한다*/
	            		xhr.setRequestHeader("${_csrf.headerName}", "${_csrf.token}");
	         	    },
					success:function(result){
						var tagFirst = "<select name='curNo'><option>교육과정</option>";
						var tagSecond = "</select>";
						var tag = "";
						for(i=0;i<result.length;i++){
							tag += "<option value="+result[i].curNo+">"+result[i].curName+"</option>";
						}
						$("#curriculumSelect").html(tagFirst+tag+tagSecond);
					}//success	         	   
				});//ajax
			}
		});//change
		
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
		});//click
	});//ready
</script>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<div class="container" >
	<div class="row">
		<div class="col-sm-1"></div>
		<div class="col-sm-10 text-center" 	style="margin-top: 100px; padding-bottom: 100px;">
			<div style="margin-top: 100px; text-align:center;" align="center">
			<sec:authentication var="mvo" property="principal" />  
			<form action="${pageContext.request.contextPath}/registerAcaReviewPost.do" method="post" id="register_form">
			<sec:csrfInput/>
			<table class="table">
				   <thead style="text-align:center;">
				   		<tr>
							<td colspan="4" align="center"><h3>후기 등록하기</h3></td>
						</tr>
							<tr>
								<td>
									<select name="acaNo" id="academySelect">
									<c:forEach items="${requestScope.academy}" var="aca">
										<option value="0">학원</option>
										<option value="${aca.acaNo}">${aca.acaName }</option>
									</c:forEach>
									</select>
								</td>
								<td><span id="curriculumSelect"></span></td>
							</tr>
				   </thead>
				   <tbody>
						<tr >
					        <td>제목</td>
					        <td><input type="text" name="acaRevTitle" placeholder="제목을 입력하세요" required="required" style="width:90%">
					        </td>
						
				      	</tr>
				      	<tr>
				      		<td>내용
				      			<span id="curtime"></span>
				      		</td>
				      		<td><textarea cols="90" rows="130" id="acaRevContent" name="acaRevContent" required="required" placeholder="내용을 입력하세요"></textarea>
				      		<script>
							    $(document).ready(function() {
							    	var curtime = "";
							        $('#acaRevContent').summernote({
							        	 height: 500,               
							        	 minHeight: null,           
							        	 maxHeight: null,  
							        	 callbacks: {
							                 onImageUpload: function(files, editor, welEditable) {
							                   for (var i = files.length - 1; i >= 0; i--) {
							                     sendFile(files[i], this);
							                   }
							                 }
							             }
							        });//summernote
							        function sendFile(file, el) {
							            var form_data = new FormData();
							            form_data.append("file", file);
							            $.ajax({
							              data: form_data,
							              type: "POST",
							              url: "review-file-upload.do",
							              cache: false,
							              contentType: false,
							              enctype: "multipart/form-data",
							              processData: false,
							              beforeSend : function(xhr){   /*데이터를 전송하기 전에 헤더에 csrf값을 설정한다*/
							            		xhr.setRequestHeader("${_csrf.headerName}", "${_csrf.token}");
							         	  },
							              success: function(url) {
							            	var path = "${pageContext.request.contextPath}/resources/reviewUpload/"+url[0];
							            	curtime += '<input type="hidden" name="curtime" value="'+url[1]+'">';
							            	$("#curtime").html(curtime);
							                $(el).summernote("editor.insertImage", path);
							                $('#imageBoard > ul').append('<li><img src="'+path+'" width="480" height="auto"/></li>');
							              }
							          });//ajax
							   	   }//sendFile
							    });//ready
						 	</script>
				      		</td>
				      	</tr>
				      	<tr>
				      		<td><label for="label-registerProduct">Hashtag</label><br></td>
					      	<td><div class="input-group">
							<input type="text" class="form-control" id="hashtagInsert"  style="width:90%;" placeholder="Hashtag pattern Example : #AcademyHelper">
							&nbsp;&nbsp;<span><input type="button" id="hashInsert" class="btn" value="추가" style="height: 60%; background-color: #32c5d2; color: white" ></span>
							<br><br><br>
							<div id="hash"></div>
							<input type="text" class="form-control" id="hashtag" name="hashTagName" required="required" style="width: 90%;" readonly="readonly">&nbsp;&nbsp;
							<span><input type="button" id="hashDelete" class="btn" value="전체삭제" style="height: 80%; background-color: #32c5d2; color: white" ></span>
							</div>
							</td>
				      	</tr>
				    
				   </tbody>
				   <tfoot>
				  		<tr>
						   	<td colspan="2" align="right">
						   		<sec:authorize access="hasRole('ROLE_USER')">
								     <div class="btnArea">
									     <button type="submit" class="aca-btn" >확인</button>  
									     <input type="hidden" value="${mvo.usrId}" name="userVO.usrId">
									     <button type="reset" class="aca-btn" >취소</button>   
								    </div>  
							    </sec:authorize>	
						   	</td>
				   		</tr>
				   </tfoot>
				</table>
		<fieldset class="rating">
        <legend class="ratingLegend">교육과정 만족도</legend>
        <div class="ratingGroup">
            <input id="rating-1" class="ratingInput" name="curSatis" type="radio" value="1" required="required">
            <label for="rating-1" class="ratingLabel">최악이에요! 1점!</label>
            <input id="rating-2" class="ratingInput" name="curSatis" type="radio" value="2" required="required">
            <label for="rating-2" class="ratingLabel">실망이에요! 2점!</label>
            <input id="rating-3" class="ratingInput" name="curSatis" type="radio" value="3" required="required">
            <label for="rating-3" class="ratingLabel">그저그래요! 3점!</label>
            <input id="rating-4" class="ratingInput" name="curSatis" type="radio" value="4" required="required">
            <label for="rating-4" class="ratingLabel">별로예요! 4점!</label>
            <input id="rating-5" class="ratingInput" name="curSatis" type="radio" value="5" required="required">
            <label for="rating-5" class="ratingLabel">보통이에요! 5점!</label>
            <input id="rating-6" class="ratingInput" name="curSatis" type="radio" value="6" required="required">
            <label for="rating-6" class="ratingLabel">괜찮아요! 6점!</label>
            <input id="rating-7" class="ratingInput" name="curSatis" type="radio" value="7" required="required">
            <label for="rating-7" class="ratingLabel">좋았어요! 7점!</label>
            <input id="rating-8" class="ratingInput" name="curSatis" type="radio" value="8" required="required">
            <label for="rating-8" class="ratingLabel">재미있어요! 8점!</label>
            <input id="rating-9" class="ratingInput" name="curSatis" type="radio" value="9" required="required">
            <label for="rating-9" class="ratingLabel">꿀잼이에요! 9점!</label>
            <input id="rating-10" class="ratingInput" name="curSatis" type="radio" value="10" required="required">
            <label for="rating-10" class="ratingLabel">최고예요! 10점!</label>
        </div>
    </fieldset>
    <fieldset class="rating">
    <legend class="ratingLegend">편의시설 만족도</legend>
        <div class="ratingGroup">
            <input id="rating-1" class="ratingInput" name="amenitiesSatis" type="radio" value="1" required="required">
            <label for="rating-1" class="ratingLabel">최악이에요! 1점!</label>
            <input id="rating-2" class="ratingInput" name="amenitiesSatis" type="radio" value="2" required="required">
            <label for="rating-2" class="ratingLabel">실망이에요! 2점!</label>
            <input id="rating-3" class="ratingInput" name="amenitiesSatis" type="radio" value="3" required="required">
            <label for="rating-3" class="ratingLabel">그저그래요! 3점!</label>
            <input id="rating-4" class="ratingInput" name="amenitiesSatis" type="radio" value="4" required="required">
            <label for="rating-4" class="ratingLabel">별로예요! 4점!</label>
            <input id="rating-5" class="ratingInput" name="amenitiesSatis" type="radio" value="5" required="required">
            <label for="rating-5" class="ratingLabel">보통이에요! 5점!</label>
            <input id="rating-6" class="ratingInput" name="amenitiesSatis" type="radio" value="6" required="required">
            <label for="rating-6" class="ratingLabel">괜찮아요! 6점!</label>
            <input id="rating-7" class="ratingInput" name="amenitiesSatis" type="radio" value="7" required="required">
            <label for="rating-7" class="ratingLabel">좋았어요! 7점!</label>
            <input id="rating-8" class="ratingInput" name="amenitiesSatis" type="radio" value="8" required="required">
            <label for="rating-8" class="ratingLabel">재미있어요! 8점!</label>
            <input id="rating-9" class="ratingInput" name="amenitiesSatis" type="radio" value="9" required="required">
            <label for="rating-9" class="ratingLabel">꿀잼이에요! 9점!</label>
            <input id="rating-10" class="ratingInput" name="amenitiesSatis" type="radio" value="10" required="required"> 
            <label for="rating-10" class="ratingLabel">최고예요! 10점!</label>
        </div>
    </fieldset>
    <fieldset class="rating">
    <legend class="ratingLegend">강사님 만족도</legend>
        <div class="ratingGroup">
            <input id="rating-1" class="ratingInput" name="lecturerSatis" type="radio" value="1" required="required">
            <label for="rating-1" class="ratingLabel">최악이에요! 1점!</label>
            <input id="rating-2" class="ratingInput" name="lecturerSatis" type="radio" value="2" required="required">
            <label for="rating-2" class="ratingLabel">실망이에요! 2점!</label>
            <input id="rating-3" class="ratingInput" name="lecturerSatis" type="radio" value="3" required="required">
            <label for="rating-3" class="ratingLabel">그저그래요! 3점!</label>
            <input id="rating-4" class="ratingInput" name="lecturerSatis" type="radio" value="4" required="required">
            <label for="rating-4" class="ratingLabel">별로예요! 4점!</label>
            <input id="rating-5" class="ratingInput" name="lecturerSatis" type="radio" value="5" required="required">
            <label for="rating-5" class="ratingLabel">보통이에요! 5점!</label>
            <input id="rating-6" class="ratingInput" name="lecturerSatis" type="radio" value="6" required="required">
            <label for="rating-6" class="ratingLabel">괜찮아요! 6점!</label>
            <input id="rating-7" class="ratingInput" name="lecturerSatis" type="radio" value="7" required="required">
            <label for="rating-7" class="ratingLabel">좋았어요! 7점!</label>
            <input id="rating-8" class="ratingInput" name="lecturerSatis" type="radio" value="8" required="required">
            <label for="rating-8" class="ratingLabel">재미있어요! 8점!</label>
            <input id="rating-9" class="ratingInput" name="lecturerSatis" type="radio" value="9" required="required">
            <label for="rating-9" class="ratingLabel">꿀잼이에요! 9점!</label>
            <input id="rating-10" class="ratingInput" name="lecturerSatis" type="radio" value="10" required="required">
            <label for="rating-10" class="ratingLabel">최고예요! 10점!</label>
        </div>
    </fieldset>
    <fieldset class="rating">
    <legend class="ratingLegend">취업연계 만족도</legend>
        <div class="ratingGroup">
            <input id="rating-1" class="ratingInput" name="empLinksSatis" type="radio" value="1" required="required">
            <label for="rating-1" class="ratingLabel">최악이에요! 1점!</label>
            <input id="rating-2" class="ratingInput" name="empLinksSatis" type="radio" value="2" required="required">
            <label for="rating-2" class="ratingLabel">실망이에요! 2점!</label>
            <input id="rating-3" class="ratingInput" name="empLinksSatis" type="radio" value="3" required="required">
            <label for="rating-3" class="ratingLabel">그저그래요! 3점!</label>
            <input id="rating-4" class="ratingInput" name="empLinksSatis" type="radio" value="4" required="required">
            <label for="rating-4" class="ratingLabel">별로예요! 4점!</label>
            <input id="rating-5" class="ratingInput" name="empLinksSatis" type="radio" value="5" required="required">
            <label for="rating-5" class="ratingLabel">보통이에요! 5점!</label>
            <input id="rating-6" class="ratingInput" name="empLinksSatis" type="radio" value="6" required="required">
            <label for="rating-6" class="ratingLabel">괜찮아요! 6점!</label>
            <input id="rating-7" class="ratingInput" name="empLinksSatis" type="radio" value="7" required="required">
            <label for="rating-7" class="ratingLabel">좋았어요! 7점!</label>
            <input id="rating-8" class="ratingInput" name="empLinksSatis" type="radio" value="8" required="required">
            <label for="rating-8" class="ratingLabel">재미있어요! 8점!</label>
            <input id="rating-9" class="ratingInput" name="empLinksSatis" type="radio" value="9" required="required">
            <label for="rating-9" class="ratingLabel">꿀잼이에요! 9점!</label>
            <input id="rating-10" class="ratingInput" name="empLinksSatis" type="radio" value="10" required="required">
            <label for="rating-10" class="ratingLabel">최고예요! 10점!</label>
        </div>
    </fieldset>
    <fieldset class="rating">
    <legend class="ratingLegend">교통편 만족도</legend>
        <div class="ratingGroup">
            <input id="rating-1" class="ratingInput" name="trafficSatis" type="radio" value="1">
            <label for="rating-1" class="ratingLabel">최악이에요! 1점!</label>
            <input id="rating-2" class="ratingInput" name="trafficSatis" type="radio" value="2">
            <label for="rating-2" class="ratingLabel">실망이에요! 2점!</label>
            <input id="rating-3" class="ratingInput" name="trafficSatis" type="radio" value="3">
            <label for="rating-3" class="ratingLabel">그저그래요! 3점!</label>
            <input id="rating-4" class="ratingInput" name="trafficSatis" type="radio" value="4">
            <label for="rating-4" class="ratingLabel">별로예요! 4점!</label>
            <input id="rating-5" class="ratingInput" name="trafficSatis" type="radio" value="5">
            <label for="rating-5" class="ratingLabel">보통이에요! 5점!</label>
            <input id="rating-6" class="ratingInput" name="trafficSatis" type="radio" value="6">
            <label for="rating-6" class="ratingLabel">괜찮아요! 6점!</label>
            <input id="rating-7" class="ratingInput" name="trafficSatis" type="radio" value="7">
            <label for="rating-7" class="ratingLabel">좋았어요! 7점!</label>
            <input id="rating-8" class="ratingInput" name="trafficSatis" type="radio" value="8">
            <label for="rating-8" class="ratingLabel">재미있어요! 8점!</label>
            <input id="rating-9" class="ratingInput" name="trafficSatis" type="radio" value="9">
            <label for="rating-9" class="ratingLabel">꿀잼이에요! 9점!</label>
            <input id="rating-10" class="ratingInput" name="trafficSatis" type="radio" value="10">
            <label for="rating-10" class="ratingLabel">최고예요! 10점!</label>
        </div>
    </fieldset>
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

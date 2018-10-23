<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="sec" uri="http://www.springframework.org/security/tags"%>
<script type="text/javascript">
	var acaNoA = "";
	var curriNoA = "";
	var acaNoB = "";
	var curriNoB = "";

	$(document).ready(function(){		
		
		$('input:radio[name="radioGroupA"]').change(function(){
			$.ajax({
				type:"GET",
				url:"${pageContext.request.contextPath}/listCurriculumAsAcademy.do?acaNo="+$(this).val(),
				data:$("#register_form").serialize(),
				success:function(result){
					var info = "<select id='curriNoA'>"
					    info += "<option>과정선택</option>"
				    	for(var i=0;i<result.curriculumList.length;i++){
				    		info += "<option value="+result.curriculumList[i].curNo+">"+result.curriculumList[i].curName+"</option>"
				    	}
					    info +="</select>"
					$("#ListCurriculumA").html(info);
				}
			}); //ajax
		}); // change
		
		
		//ListCurriculumA
		$("#ListCurriculumA").on("change","#curriNoA",function(){
			acaNoA = $('input:radio[name="radioGroupA"]:checked').val();
			curriNoA = $("#curriNoA").val();
		});
		
		
		$('input:radio[name="radioGroupB"]').change(function(){
			$.ajax({
				type:"GET",
				url:"${pageContext.request.contextPath}/listCurriculumAsAcademy.do?acaNo="+$(this).val(),
				data:$("#register_form").serialize(),
				success:function(result){
					var info = "<select id='curriNoB'>"
					    info += "<option>과정선택</option>"
				    	for(var i=0;i<result.curriculumList.length;i++){
				    		info += "<option value="+result.curriculumList[i].curNo+">"+result.curriculumList[i].curName+"</option>"
				    	}
					    info +="</select>"
					$("#ListCurriculumB").html(info);
				}
			}); //ajax
		}); // change
		$("#ListCurriculumB").on("change","#curriNoB",function(){
			acaNoB = $('input:radio[name="radioGroupB"]:checked').val();
			curriNoB = $("#curriNoB").val();
		});
		
	});
	
	function formSubmit() {
		location.href ="${pageContext.request.contextPath}/academyCompare.do?acaNoA="+acaNoA+"&curriNoA="+curriNoA+"&acaNoB="+acaNoB+"&curriNoB="+curriNoB;
	}
</script>
<div class="container">
	<div class="row">
		<div class="col-sm-1"></div>
		<div class="col-sm-10 text-center" style="margin-top: 50px; padding-bottom: 100px;">
			<div style="margin-top: 100px; text-align: center;" align="center">
				<table class="table" >
					<thead>
						<tr>
							<td colspan="2" align="center"><h3>IT 기관 비교</h3></td>
						</tr>
						<tr>
							<td style="border-top:0px"></td>
						</tr>
						<tr >
							<th style="width:50%"><span id="AcademyA" style="width:70%">비교할 첫번째 학원을 선택해주세요.</span></th>
							<th><span id="AcademyB" style="width:70%">비교할 두번째 학원을 선택해주세요.</span></th>
						</tr>
					</thead>
					<tbody>
						<tr>
							<td>
								<div id="ListCurriculumA"></div>
							</td>
							<td>
								<div id="ListCurriculumB"></div>
							</td>
						</tr>
						<tr style="height:350px">
							<td>
								<div style="overflow-y:scroll; width:100%; height:350px;">
									<c:forEach var="academy"  items="${ListAcademy}" >
						            	<input type="radio" name="radioGroupA" value="${ academy.acaNo}"><span id="${academy.acaNo}">${academy.acaName }</span><br><br>
							        </c:forEach>
								</div>
							</td>
							<td>
								<div style="overflow-y:scroll; width:100%; height:350px;">
									<c:forEach var="academy"  items="${ListAcademy}">
						            	<input type="radio" name="radioGroupB" value="${ academy.acaNo}"><span id="${academy.acaNo }">${academy.acaName }</span><br><br>
							        </c:forEach>
								</div>
							</td>
						</tr>
					</tbody>
					<tfoot>
						<tr>
						   	<td colspan="2" align="right">
						   		<sec:authorize access="hasRole('ROLE_USER')">
						   		<sec:csrfInput />
								     <div class="btnArea">
									     <button type="button" class="aca-btn" onClick="formSubmit()">확인</button>  
									     <input type="hidden" value="${mvo.usrId}" name="userVO.usrId">
									     <button type="reset" class="aca-btn" >취소</button>   
								    </div>  
							    </sec:authorize>
						   	</td>
				   		</tr>
					</tfoot>
				</table>
			</div>
		</div>
	</div>
</div>

<script type="text/javascript">
$(document).ready(function(){
	$('input:radio[name="radioGroupA"]').change(function(){
		//alert($("#"+$(this).val()).text());
		$('#AcademyA').text($("#"+$(this).val()).text())
	});
	$('input:radio[name="radioGroupB"]').change(function(){
		$('#AcademyB').text($("#"+$(this).val()).text())
	});
});	
</script>
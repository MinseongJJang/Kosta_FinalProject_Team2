<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="sec"
	uri="http://www.springframework.org/security/tags"%>
<script type="text/javascript">
$(document).ready(function(){
	$("#deleteForm").submit(function(){
		if(confirm("삭제하시겠습니까?")==false){
			return false;
		}else{
			return true;
		}
	});//submit
	$("#updateForm").submit(function(){
		if(confirm("수정하시겠습니까?")==false){
			return false;
		}else{
			return true;
		}
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
					</thead>
				   <tbody>
				      	<c:set var="detailQNA" value="${requestScope.detailQNA}" />
				         <tr>
				            <td>과정번호</td>
				            <td>${requestScope.DetailCurriculum.curNo }</td>
				            <td>과정이름</td>
				            <td>${requestScope.DetailCurriculum.curName}</td>
				            <tD>강사명</td>
				            <td>${requestScope.DetailCurriculum.curLecturer}</td>
				         </tr>
				         <tr>
				            <td>정원</td>
				            <td>${requestScope.DetailCurriculum.limitMem }</td>
				            <td>사용교재</td>
				            <td>${requestScope.DetailCurriculum.curTextbook}</td>
				            <tD>기관이름</td>
				            <td>${requestScope.DetailCurriculum.academyVO.acaName}</td>
				         </tr>
				         <tr>
				         	<td colspan="1">내용</td>
				         	<td colspan="7"><pre style="white-space: pre-wrap;">${requestScope.DetailCurriculum.curContent}</pre></td>
				         </tr>
			      		<sec:authorize access="hasRole('ROLE_ADMIN')">
					      <tr>
					      	<td colspan="1" align="left">
					      		<button form="detailAcaForm" type="submit" class="aca-btn">목록</button>
					      		<form action="detailAcademy.do" id="detailAcaForm">
				      				<input type="hidden" name="acaNo" value="${requestScope.DetailCurriculum.academyVO.acaNo}">
					      		</form>
					      	</td>
					      	<td colspan="7" align="right">
							   	<button form="deleteForm" type="submit" class="aca-btn">삭제</button>
								<button form="updateForm" type="submit" class="aca-btn">수정</button>
							 	<form action="deleteCurriculum.do" id="deleteForm" method="post">
									<sec:csrfInput />
									<input type="hidden" name="curNo" value="${requestScope.DetailCurriculum.curNo}">
								</form>
								<form action="updateCurriculumForm.do" id="updateForm" method="post">
									<sec:csrfInput />
									<input type="hidden" name="curNo" value="${requestScope.DetailCurriculum.curNo}">
								</form>
					      	</td>
					      </tr>
						</sec:authorize>
					</tbody>
					<tfoot>
					</tfoot>
				</table>
			</div>
		</div>
		<div class="col-sm-1"></div>
	</div>
</div>

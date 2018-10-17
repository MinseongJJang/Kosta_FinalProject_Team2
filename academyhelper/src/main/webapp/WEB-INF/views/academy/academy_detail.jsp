<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<meta charset="utf-8">
 <%@ taglib prefix="sec" uri="http://www.springframework.org/security/tags" %>
<script type="text/javascript">
$(document).ready(function(){
	$("#deleteAca").submit(function(){
		if(confirm("삭제하시겠습니까?")==false){
			return false;
		}else{
			return true;
		}
	});//submit
	$("#updateAca").submit(function(){
		
	});//click
});//ready

</script>
<div>
	<c:set var="de" value="${requestScope.acaDetail}" />
	<table>
		<tr>
			<td>학원번호</td>
			<td>${de.acaNo}</td>
		</tr>
		<tr>
			<td>학원이름</td>
			<td>${de.acaName}</td>
		</tr>
		<tr>
			<td>학원주소</td>
			<td>${de.acaAddr}</td>
		</tr>
		<tr>
			<td>학원전화번호</td>
			<td>${de.acaTel}</td>
		</tr>
		<tr>
			<td colspan="2">시설 사진</td>
		</tr>
		<tr>
			<td colspan="2">위치 사진</td>
		</tr>
	</table>
		<table>
		<thead>
			<tr>
				<th class="curNo">NO</th>
				<th class="curName">과정이름</th>
				<th class="curLecturer">강사명</th>
				<th class="limitMem">정원</th>
				<th class="curTextbook">과정이름</th>
				<th class="acaName">학원이름</th>
			</tr>
		</thead>
		<tbody>
			<c:forEach var="curriculum" items="${requestScope.ListCurriculum}">
				<tr>
					<td>${curriculum.curNo }</td>
					<td><a
						href="${pageContext.request.contextPath}/detailCurriculum.do?curNo=${curriculum.curNo}">
							${curriculum.curName }</a></td>
					<td>${curriculum.curLecturer }</td>
					<td>${curriculum.limitMem }</td>
					<td>${curriculum.curTextbook }</td>
					<td>${curriculum.academyVO.acaName }</td>

				</tr>
			</c:forEach>
		</tbody>
	</table>
	<div class="pagingInfo">
		<%-- 코드를 줄이기 위해 pb 변수에 pagingBean을 담는다. --%>
		<c:set var="pb" value="${requestScope.pb}"></c:set>
		<!-- 
			step2 1) 이전 페이지 그룹이 있으면 화살표 보여준다
				   		페이징빈의 previousPageGroup 이용 
				   2)  이미지에 이전 그룹의 마지막 페이지번호를 링크한다. 
				   	    hint)   startPageOfPageGroup-1 하면 됨 		 
	 -->
		<!-- step1. 1)현 페이지 그룹의 startPage부터 endPage까지 forEach 를 이용해 출력한다
				   2) 현 페이지가 아니면 링크를 걸어서 서버에 요청할 수 있도록 한다.
				      현 페이지이면 링크를 처리하지 않는다.  
				      PagingBean의 nowPage
				      jstl choose 를 이용  
				      예) <a href="DispatcherServlet?command=list&pageNo=...">				   
	 -->
		<ul class="pagination">
			<c:if test="${pb.previousPageGroup}">
				<li><a
					href="${pageContext.request.contextPath}/listCurriculum.do?pageNo=${pb.startPageOfPageGroup-1}">&laquo;</a></li>
			</c:if>
			<c:forEach var="i" begin="${pb.startPageOfPageGroup}"
				end="${pb.endPageOfPageGroup}">
				<c:choose>
					<c:when test="${pb.nowPage!=i}">
						<li><a
							href="${pageContext.request.contextPath}/listCurriculum.do?pageNo=${i}">${i}</a></li>
					</c:when>
					<c:otherwise>
						<li class="active"><a href="#">${i}</a></li>
					</c:otherwise>
				</c:choose>
	&nbsp;
	</c:forEach>
			<c:if test="${pb.nextPageGroup}">
				<li><a
					href="${pageContext.request.contextPath}/listCurriculum.do?pageNo=${pb.endPageOfPageGroup+1}">&raquo;</a></li>
			</c:if>
		</ul>
	</div>
	<a href="${pageContext.request.contextPath}/registerCurriculumForm.do?acaNo=${requestScope.acaDetail.acaNo}">새 과정 등록하기</a>
	<sec:authorize access="hasRole('ROLE_ADMIN')">
	<c:set var="de" value="${requestScope.acaDetail}" />
	<form action="deleteAcademy.do" id="deleteAca" method="post">
	<sec:csrfInput/>
	<input type="hidden" name="acaNo" value="${de.acaNo}">
	<input type="submit" value="학원정보삭제">
	</form>
	</sec:authorize>
	
	<sec:authorize access="hasRole('ROLE_ADMIN')">
	<form action="academyUpdateForm.do" id="updateAca" method="post">
	<sec:csrfInput/>
	<input type="hidden" name ="acaNo" value="${de.acaNo}">
	<input type="hidden" name ="acaName" value="${de.acaName}">
	<input type="hidden" name ="acaAddr" value="${de.acaAddr}">
	<input type="hidden" name="acaTel" value="${de.acaTel}">
	<input type="hidden" name =userVO.usrEmail value="${de.userVO.usrEmail}">
	<input type="hidden" name ="userVO.usrTel" value="${de.userVO.usrTel}">
	<input type="hidden" name ="userVO.nickname" value="${de.userVO.nickname}">
	<input type="hidden" name ="userVO.usrId" value="${de.userVO.usrId}">
	<input type="submit" value="수정하기">	
	</form>
	</sec:authorize>
</div>

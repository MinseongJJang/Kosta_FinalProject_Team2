<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>

<table class="table table-hover">
				   <thead style="text-align:center;">
					   	<tr>
							<td colspan="4" align="center"><h3>학원 목록</h3></td>
						</tr>
						<tr>
							<td style="border-top:0px"></td>
						</tr>
				      <tr >
				         <th>학원번호</th>
				         <th>학원이름</th>
				         <th>교육번호</th>
				         <th>교육이름</th>
				      </tr>
				   </thead>
				   <tbody>
				     <c:forEach var="list"  items="${requestScope.searchList}">
				         <tr>
				            <td>${list.academyVO.acaNo }</td>
				            <td>${list.academyVO.acaName }</td>
				            <td>${list.curNo }</td>
				            <td>${list.curName }</td> 
				         </tr>
				      </c:forEach>
				   </tbody>
				      <tfoot>
				   <tr>
				   	<td colspan="4" >
				   		<div class="pagingInfo" >
						   <c:set var="pb" value="${requestScope.pb}"></c:set>
						   <ul class="pagination">
						      <c:if test="${pb.previousPageGroup}">
						         <li><a href="${pageContext.request.contextPath}/academySearch.do?pageNo=${pb.startPageOfPageGroup-1}&search=${requestScope.content.search}&academyVO.acaAddr=${requestScope.content.curriculumVO.academyVO.acaAddr}&curName=${requestScope.content.curriculumVO.curName}">&laquo;</a></li>
						      </c:if>
						      <c:forEach var="i" begin="${pb.startPageOfPageGroup}" end="${pb.endPageOfPageGroup}">
						         <c:choose>
						            <c:when test="${pb.nowPage!=i}">
						               <li><a href="${pageContext.request.contextPath}/academySearch.do?pageNo=${i}&search=${requestScope.content.search}&academyVO.acaAddr=${requestScope.content.curriculumVO.academyVO.acaAddr}&curName=${requestScope.content.curriculumVO.curName}">${i}</a></li>
						            </c:when>
						            <c:otherwise>
						               <li class="active"><a href="#">${i}</a></li>
						            </c:otherwise>
						         </c:choose>
						      </c:forEach>
						      <c:if test="${pb.nextPageGroup}">
						         <li><a href="${pageContext.request.contextPath}/academySearch.do?pageNo=${pb.endPageOfPageGroup+1}&search=${requestScope.content.search}&academyVO.acaAddr=${requestScope.content.curriculumVO.academyVO.acaAddr}&curName=${requestScope.content.curriculumVO.curName}">&raquo;</a></li>
						      </c:if>
						   </ul>
						</div>
				   	</td>
				   </tr>
				   </tfoot>
				</table>
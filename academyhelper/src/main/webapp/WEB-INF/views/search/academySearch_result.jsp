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
				     <c:forEach var="list"  items="${searchList}">
				         <tr>
				            <td>${list.academyVO.acaNo }</td>
				            <td>${list.academyVO.acaName }</td>
				            <td>${list.curNo }</td>
				            <td>${list.curName }</td>
				         </tr>
				      </c:forEach>
				   </tbody>
				</table>
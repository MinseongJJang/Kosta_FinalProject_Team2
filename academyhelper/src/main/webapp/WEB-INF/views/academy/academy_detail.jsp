<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<meta charset="utf-8">
<link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/css/bootstrap.min.css">
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
			<td>이메일</td>
			<td>${de.userVO.usrEmail}</td>
		</tr>
		<tr>
			<td>전화번호</td>
			<td>${de.userVO.usrTel}</td>
		</tr>
		<tr>
			<td>닉네임</td>
			<td>${de.userVO.nickname}</td>
		</tr>
		<tr>
			<td>아이디</td>
			<td>${de.userVO.usrId}</td>
		</tr>
		<tr>
			<td colspan="2">시설 사진</td>
		</tr>
		<tr>
			<td colspan="2">위치 사진</td>
		</tr>
	</table>
</div>

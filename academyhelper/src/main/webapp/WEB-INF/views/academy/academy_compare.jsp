<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="sec" uri="http://www.springframework.org/security/tags"%>
<link rel=“stylesheet” href="${pageContext.request.contextPath }/resources/css/Nwagon.css" type=“text/css”>
<script src="${pageContext.request.contextPath }/resources/js/Nwagon.js"></script>
 
 
  <div class="container">
	<div class="row">
		<div class="col-sm-1"></div>
		<div class="col-sm-10 text-center" style="margin-top: 50px; padding-bottom: 100px;">
			<div style="margin-top: 100px; text-align: center;" align="center">
			<form action="${pageContext.request.contextPath}/academyCompare.do" method="post" id="register_form">
				<table class="table" >
					<thead>
						<tr>
							<td colspan="3" align="center"><h3>IT 기관 비교 상세</h3></td>
						</tr>
						<tr>
							<td style="border-top:0px"></td>
						</tr>
						<tr>
							 <c:set var="academyA" value="${requestScope.academyA}" />
							 <c:set var="academyB" value="${requestScope.academyB}" />
							 <c:set var="curriculumA" value="${requestScope.curriculumA}" />
							 <c:set var="curriculumB" value="${requestScope.curriculumB}" />
							 <c:set var="satisfactionA" value="${requestScope.satisfactionA}" />
							 <c:set var="satisfactionB" value="${requestScope.satisfactionB}" />
							 <th>
							 	기관
							 </th>
							 <th>
							 	${academyA.acaName }
							 </th>
							 <th>
								${academyB.acaName }
							 </th>
						</tr>
					</thead>
					<tbody>
						<tr>
							<th>
								만족도
							</th>
							<td>
								<div id="AcademyA"></div>
							</td>
							<td>
								<div id="AcademyB"></div>
							</td>
						</tr>
						<tr>
							<th>
								정원
							</th>
							<td>
								${curriculumA.limitMem }
							</td>
							<td>
								${curriculumB.limitMem }
							</td>
						</tr>
						<tr>
							<th>
								교육 교재
							</th>
							<td>
								${curriculumA.curTextbook }
							</td>
							<td>
								${curriculumB.curTextbook }
							</td>
						</tr>
						<tr>
							<th>
								교육 내용
							</th>
							<td>
								<pre>${curriculumA.curContent }</pre>
							</td>
							<td>
								<pre>${curriculumB.curContent }</pre>
							</td>
						</tr>
						<tr>
							<th colspan="3">
								후기
							</th>
						</tr>
						<c:forEach var="reviewlistA"  items="${reviewListA }" >
						<c:forEach var="reviewlistB" items="${reviewListB }" >
						<tr>
							<td>
							</td>
							<td>
								<div style="text-align:left;">${reviewlistA.userVO.usrId }</div>
								<div><pre>${reviewlistA.acaRevContent}</pre></div>
								<div style="text-align:right;">${reviewlistA.acaRevRegdate}</div>
							</td>
							<td>
								<div style="text-align:left;">${reviewlistB.userVO.usrId }</div>
								<div><pre>${reviewlistB.acaRevContent }</pre></div>
								<div style="text-align:right;">${reviewlistB.acaRevRegdate}</div>
							</td>
						</tr>
						</c:forEach>
						</c:forEach>
						
					</tbody>
					<tfoot>
					</tfoot>
				</table>
				</form>
			</div>
		</div>
	</div>
</div>  
 


<script>
   var options = {
   		'legend':{
   			names: [
   				'교육과정 만족도',
   				'편의시설 만족도',
   				'취업연계 만족도',
   				'교통편 만족도',
   				'교육강사 만족도'
   			],
   			hrefs: [
   				'http://nuli.navercorp.com//sharing/a11y#k1',
   				'http://nuli.navercorp.com//sharing/a11y#k2',
   				'http://nuli.navercorp.com//sharing/a11y#k3',
   				'http://nuli.navercorp.com//sharing/a11y#k4',
   				'http://nuli.navercorp.com//sharing/a11y#k5'
   			]
   		},
   		'dataset': {
   			title: '${curriculumA.curName}',
   			values: [[${satisfactionA.curSatis},${satisfactionA.amenitiesSatis},${satisfactionA.empLinksSatis},${satisfactionA.trafficSatis},${satisfactionA.lecturerSatis}]],
   			bgColor: '#f9f9f9',
   			fgColor: '#004e92',
   		},
   		'chartDiv': 'AcademyA',
   		'chartType': 'radar',
   		'chartSize': { width: 500, height: 300 }
   };

   Nwagon.chart(options);

</script>
<script>
   var options = {
   		'legend':{
   			names: [
   				'교육과정 만족도',
   				'편의시설 만족도',
   				'취업연계 만족도',
   				'교통편 만족도',
   				'교육강사 만족도'
   			],
   			hrefs: [
   				'http://nuli.navercorp.com//sharing/a11y#k1',
   				'http://nuli.navercorp.com//sharing/a11y#k2',
   				'http://nuli.navercorp.com//sharing/a11y#k3',
   				'http://nuli.navercorp.com//sharing/a11y#k4',
   				'http://nuli.navercorp.com//sharing/a11y#k5'
   			]
   		},
   		'dataset': {
   			title: '${curriculumB.curName}',
   			values: [[${satisfactionB.curSatis},${satisfactionB.amenitiesSatis},${satisfactionB.empLinksSatis},${satisfactionB.trafficSatis},${satisfactionB.lecturerSatis}]],
   			bgColor: '#f9f9f9',
   			fgColor: '#004e92',
   		},
   		'chartDiv': 'AcademyB',
   		'chartType': 'radar',
   		'chartSize': { width: 500, height: 300 }
   };

   Nwagon.chart(options);

</script>

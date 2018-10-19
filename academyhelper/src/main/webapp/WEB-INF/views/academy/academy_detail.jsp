<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
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
 
<div class="container">
   <div class="row">
      <div class="col-sm-1"></div>
      <div class="col-sm-10 text-center"
         style="margin-top: 100px; padding-bottom: 100px;">
         <div style="margin-top: 100px; text-align: center;" align="center">
            <table class="table">
               <thead>
                     <tr>
                     <td colspan="8" align="center"><h3>학원 상세보기</h3></td>
                  </tr>
                  <tr>
							<td style="border-top:0px"></td>
				 </tr>
               </thead>
               <tbody>
                     <c:set var="de" value="${requestScope.acaDetail}" />
                     <tr>
                        <td>학원번호</td>
                     <td>${de.acaNo}</td>
                        <td>학원이름</td>
                     <td>${de.acaName}</td>
                        <td>학원주소</td>
                         <td>${de.acaAddr}</td>
                        <td>학원전화번호</td>
                     <td>${de.acaTel}</td>
                     </tr>
                     
                     <tr>
                        <td colspan="8">시설 사진</td>
                     </tr>
                     <tr>
                        <td colspan="8"><div id="map" style="width:100%;height:350px;"></div></td>
                     </tr>
                     <sec:authorize access="hasRole('ROLE_USER')">
                     <tr>
                        <td colspan="8" align="right">
                           <button form="deleteForm" type="submit" class="aca-btn">삭제</button>
                        <button form="updateForm" type="submit" class="aca-btn">수정</button>
                        <form action="deleteAcademy.do" id="deleteForm" method="post">
                        <sec:csrfInput/>
                        	<input type="hidden" name="acaNo" value="${de.acaNo}">
                        </form>
                        <form action="academyUpdateForm.do" id="updateForm" method="post">
	                        <sec:csrfInput/>
	                        <input type="hidden" name ="acaNo" value="${de.acaNo}">
	                        <input type="hidden" name ="acaName" value="${de.acaName}">
	                        <input type="hidden" name ="acaAddr" value="${de.acaAddr}">
	                        <input type="hidden" name="acaTel" value="${de.acaTel}">
	                        <input type="hidden" name =userVO.usrEmail value="${de.userVO.usrEmail}">
	                        <input type="hidden" name ="userVO.usrTel" value="${de.userVO.usrTel}">
	                        <input type="hidden" name ="userVO.nickname" value="${de.userVO.nickname}">
	                        <input type="hidden" name ="userVO.usrId" value="${de.userVO.usrId}">
                        </form>
                        </td>
                     </tr>
                  </sec:authorize>
                     <tr>
                        <td>과정번호</td>
                        <td colspan="3">과정이름</td>
                        <td>강사명</td>
                        <td>정원</td>
                        <td>과정이름</td>
                        <td>학원이름</td>
                     </tr>
                     <c:forEach var="curriculum" items="${requestScope.ListCurriculum}">
                     <tr>
                        <td>${curriculum.curNo }</td>
                        <td colspan="3"><a href="${pageContext.request.contextPath}/detailCurriculum.do?curNo=${curriculum.curNo}">${curriculum.curName }</a></td>
                        <td>${curriculum.curLecturer }</td>
                        <td>${curriculum.limitMem }</td>
                        <td>${curriculum.curTextbook }</td>
                        <td>${curriculum.academyVO.acaName }</td>
                     </tr>
                     </c:forEach>
                     <tr>
                     <td colspan="8" align="right">
                        <button form="registerCurriculumForm" type="submit" class="aca-btn">과정 등록</button>
                         <form action="${pageContext.request.contextPath}/registerCurriculumForm.do?acaNo=${requestScope.acaDetail.acaNo}" id="registerCurriculumForm" method="post">
                           <sec:csrfInput/>
                         </form>
                     </td>
                  </tr>
               </tbody>
               <tfoot>
                  <tr>
                     <td colspan="8" align="center">
                        <div class="pagingInfo">
                        <%-- 코드를 줄이기 위해 pb 변수에 pagingBean을 담는다. --%>
                        <c:set var="pb" value="${requestScope.pb}"></c:set>
                        <ul class="pagination">
                           <c:if test="${pb.previousPageGroup}">
                              <li><a href="${pageContext.request.contextPath}/detailAcademy.do?pageNo=${pb.startPageOfPageGroup-1}&acaNo=${de.acaNo}">&laquo;</a></li>
                           </c:if>
                           <c:forEach var="i" begin="${pb.startPageOfPageGroup}" end="${pb.endPageOfPageGroup}">
                              <c:choose>
                                 <c:when test="${pb.nowPage!=i}">
                                    <li><a href="${pageContext.request.contextPath}/detailAcademy.do?pageNo=${i}&acaNo=${de.acaNo}">${i}</a></li>
                                 </c:when>
                                 <c:otherwise>
                                    <li class="active"><a href="#">${i}</a></li>
                                 </c:otherwise>
                              </c:choose>
                              &nbsp;
                              </c:forEach>
                                 <c:if test="${pb.nextPageGroup}">
                              <li><a href="${pageContext.request.contextPath}/detailAcademy.do?pageNo=${pb.endPageOfPageGroup+1}&acaNo=${de.acaNo}">&raquo;</a></li>
                           </c:if>
                        </ul>
                     </div>
                     </td>
                  </tr>
                  
               </tfoot>
            </table>
         </div>
      </div>
      <div class="col-sm-1"></div>
   </div>
</div>
<!-- 다음 지도 api -->
 
<script type="text/javascript" src="//dapi.kakao.com/v2/maps/sdk.js?appkey=6780a937177186a47b9c5eb500d22ad2&libraries=services"></script>
<script>
	var mapContainer = document.getElementById('map'), // 지도를 표시할 div 
	    mapOption = {
	        center: new daum.maps.LatLng(33.450701, 126.570667), // 지도의 중심좌표
	        level: 3 // 지도의 확대 레벨
	    };  
	// 지도를 생성합니다    
	var map = new daum.maps.Map(mapContainer, mapOption); 
	// 주소-좌표 변환 객체를 생성합니다
	var geocoder = new daum.maps.services.Geocoder();
	// 주소로 좌표를 검색합니다
	geocoder.addressSearch('${de.acaAddr}', function(result, status) {
	
	    // 정상적으로 검색이 완료됐으면 
	     if (status === daum.maps.services.Status.OK) {
	
	        var coords = new daum.maps.LatLng(result[0].y, result[0].x);
	
	        // 결과값으로 받은 위치를 마커로 표시합니다
	        var marker = new daum.maps.Marker({
	            map: map,
	            position: coords
	        });
	
	        // 인포윈도우로 장소에 대한 설명을 표시합니다
	        var infowindow = new daum.maps.InfoWindow({
	            content: '<div style="width:150px;text-align:center;padding:6px 0;">${de.acaName}</div>'
	        });
	        infowindow.open(map, marker);
	
	        // 지도의 중심을 결과값으로 받은 위치로 이동시킵니다
	        map.setCenter(coords);
	    } 
	});    
</script>

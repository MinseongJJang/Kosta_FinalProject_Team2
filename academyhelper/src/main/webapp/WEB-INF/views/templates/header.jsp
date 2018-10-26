<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@taglib prefix="sec"
	uri="http://www.springframework.org/security/tags"%>

<script type="text/javascript">
	$(function() {
		// .attr()은 속성값(property)을 설정할 수 있다.
		$('#imgChange').click(function() {
			if ($(this).attr('src') == '/academy/resources/img/chatting_off.png') {
				$('#imgChange').attr("src","${pageContext.request.contextPath}/resources/img/chatting_on.png");
			} else {
				$('#imgChange').attr("src","${pageContext.request.contextPath}/resources/img/chatting_off.png");
			}
		});
	});
</script>
<script type="text/javascript">
	$(document).ready(function() {
		$("#logoutAction").click(function() {
			$("#logoutForm").submit();
		});

	});
</script>

<!-- Sidebar -->
<div id="sidebar-wrapper" class=".row-sm-3">
	<ul class="sidebar-nav">
		<li class="sidebar-brand" style="color:white">
			<sec:authorize access="!hasRole('ROLE_USER')">
				<a href="${pageContext.request.contextPath}/loginForm.do">로그인</a>
			</sec:authorize> 
			<sec:authorize access="hasRole('ROLE_USER')">
				<sec:authentication property="principal.usrName" />님 반갑습니다.<br>
			</sec:authorize>
		</li>
		<li>
			<textarea rows="18" cols="27"></textarea>
		</li>
		<li>
			<input type="text" placeholder="채팅 메세지를 입력하세요"  style="width:210px">
		</li>
	</ul>
</div>
<!-- /#sidebar-wrapper -->
<div class="wrap">
<header id="header" style="border-bottom: 1px solid #c0c0c0;">
	<div class="container" >
		<div class="row" >
			<div class="col-sm-4">
				<div class="logo" style="width: 220px; height: 110px; padding-top: 10px" id="logoDiv">
					<a href="${pageContext.request.contextPath }/home.do"><img src="${pageContext.request.contextPath}/resources/img/home_logo.png"></a>
				</div> 
			</div>
			<div class="col-sm-8">		
				<nav id="primary-nav" class="dropdown cf">
					<ul class="pdown menu">
						<li><a href="#">IT기관 </a>
							<ul class="sub-menu">
								<li><a href="${pageContext.request.contextPath}/academyCompareForm.do">IT기관 비교</a></li>
								<li><a href="${pageContext.request.contextPath}/acaReviewList.do">IT기관 후기</a></li>
							</ul>
						</li>
						<li><a href="#">IT기관 정보</a>
							<ul class="sub-menu">
								<li><a href="${pageContext.request.contextPath}/acaPromoList.do">IT기관 홍보</a></li>
								<li><a href="${pageContext.request.contextPath}/listAcademy.do">IT기관 정보</a></li>
							</ul>						
						</li>
						<li><a href="#">Contact</a>
							<ul class="sub-menu">
								<li><a href="${pageContext.request.contextPath}/listNotice.do">NOTICE</a></li>	
								<li><a href="${pageContext.request.contextPath}/listAcaQNA.do">질의응답</a></li>
								<li><a href="${pageContext.request.contextPath}/listSuggestionPost.do">건의하기</a></li>
								<li><a href="listFAQ.do">FAQ</a></li>
							</ul>
						</li>
						<li>
							<a href="#">
								<img src="${pageContext.request.contextPath}/resources/img/login.png" style="width: 20px; height: 20px;">
							</a>
							<ul class="sub-menu">
								<sec:authorize access="!hasRole('ROLE_USER')">
									<a href="${pageContext.request.contextPath}/loginForm.do">로그인</a>
								</sec:authorize>
								<sec:authorize access="hasRole('ROLE_USER')">
									<li>
										<a href="#" id="logoutAction">로그아웃</a>
										<form id="logoutForm" action="${pageContext.request.contextPath}/logout.do" method="post" style="display: none">
											<sec:csrfInput />
										</form>
									</li>
									<li>
										<sec:authorize access="hasRole('ROLE_USER') and !hasRole('ROLE_ACADEMY')">
											<a href="${pageContext.request.contextPath}/userInfo.do?usrId=<sec:authentication property="principal.usrId"/>">회원 정보</a>
										</sec:authorize>
									</li>
								</sec:authorize>
								<li>
									<sec:authorize access="hasRole('ROLE_ADMIN') and hasRole('ROLE_USER')">
										<sec:authentication var="mvo" property="principal" />  
						 				<a href="userList.do">회원 목록</a>
									</sec:authorize>
								</li>
								<li>
									<sec:authorize access="hasRole('ROLE_USER') and hasRole('ROLE_ACADEMY') and hasRole('ROLE_ADMIN')">
										<a href="${pageContext.request.contextPath}/userInfo.do?usrId=<sec:authentication property="principal.usrId"/>">관리자 정보</a>
									</sec:authorize>
								</li>
							</ul>
						</li>
						<li>
							<a href="#menu-toggle" class="btn btn-secondary" id="menu-toggle">
								<img src="${pageContext.request.contextPath}/resources/img/chatting_off.png" style="width: 20px; height: 20px" name="img" id="imgChange">
							</a>
						</li>
					</ul>
				</nav>
				<!-- / #primary-nav -->
			</div>
		</div>
	</div>
</header>
</div>
<script>
	$("#menu-toggle").click(function(e) {
		e.preventDefault();
		$("#wrapper").toggleClass("toggled");
	});
</script>
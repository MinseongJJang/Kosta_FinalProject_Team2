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

<!-- Sidebar -->
<div id="sidebar-wrapper">
	<ul class="sidebar-nav">
		<li class="sidebar-brand"><sec:authorize
				access="!hasRole('ROLE_USER')">
				<a href="${pageContext.request.contextPath}/loginForm.do">로그인</a>
			</sec:authorize> <sec:authorize access="hasRole('ROLE_USER')">
				<%-- 
Spring Security를 이용하면 Authentication Bean 이 생성
로그인 한 사용자의 정보는 Authentication 객체의 principal 에 저장된다 
 --%>
				<sec:authentication property="principal.usrName" />님 <br>

				<%-- <a href="${pageContext.request.contextPath}/logout.do">로그아웃</a> --%>
				<%-- spring security logout은 다음과 같은 처리가 필요하다
	로그인 로그아웃은 모두 post 방식 요청으로 해야 하면  csrf 토큰처리가 필요하다 --%>
				<script type="text/javascript">
					$(document).ready(function() {
						$("#logoutAction").click(function() {
							$("#logoutForm").submit();
						});
					});
				</script>
				<a href="#" id="logoutAction">로그아웃</a>
				<form id="logoutForm"
					action="${pageContext.request.contextPath}/logout.do" method="post"
					style="display: none">
					<sec:csrfInput />
				</form>
				<sec:authorize
				access="hasRole('ROLE_USER') and !hasRole('ROLE_ACADEMY')">
				<a
					href="${pageContext.request.contextPath}/userInfo.do?usrId=<sec:authentication property="principal.usrId"/>">회원
					정보</a>
					</sec:authorize>
					<sec:authorize
				access="hasRole('ROLE_USER') and hasRole('ROLE_ACADEMY') and !hasRole('ROLE_ADMIN')">
				<a
					href="${pageContext.request.contextPath}/acaUserInfo.do?usrId=<sec:authentication property="principal.usrId"/>">회원
					정보</a>
					</sec:authorize>
					<sec:authorize
				access="hasRole('ROLE_USER') and hasRole('ROLE_ACADEMY') and hasRole('ROLE_ADMIN')">
				<a
					href="${pageContext.request.contextPath}/userInfo.do?usrId=<sec:authentication property="principal.usrId"/>">관리자 정보</a>
					</sec:authorize>
			</sec:authorize>
			<sec:authorize
				access="hasRole('ROLE_ADMIN') and hasRole('ROLE_USER')">
				<%-- 아래는 관리자이자 회원일 때 보이는 메뉴 --%>
				<sec:authentication var="mvo" property="principal" />  
				${mvo.usrName} 관리자님  admin 메인화면입니다. <br>
 				<a href="userList.do">회원 목록</a><br>
				<a href="${pageContext.request.contextPath}/academyRegisterForm.do">학원등록</a><br>
			</sec:authorize></li>
	</ul>
</div>
<!-- /#sidebar-wrapper -->
<header id="header">
	<div class="container">
		<div class="row">
			<div class="col-md-12">
				<button id="primary-nav-button" type="button">Menu</button>
				<div class="logo"
					style="width: 220px; height: 110px; padding-top: 10px">
					<a href="${pageContext.request.contextPath}/home.do"> <img
						src="${pageContext.request.contextPath}/resources/img/home_logo.png"
						alt="Venue Logo">
					</a>
				</div>
				<nav id="primary-nav" class="dropdown cf">
					<ul class="dropdown menu">
						<li><a class="scrollTo" data-scrollTo="services" href="#">IT기관 비교</a></li>
						<li><a class="scrollTo" data-scrollTo="services" href="#">IT기관 후기</a></li>
						<li><a class="scrollTo" data-scrollTo="contact" href="acaPromoList.do">IT기관 홍보</a></li>
						<li><a class="scrollTo" data-scrollTo="services" href="listAcademy.do">IT기관 정보</a></li>
						<li><a class="scrollTo" data-scrollTo="services" href="listNotice.do">NOTICE</a></li>	
						<li><a class="scrollTo" data-scrollTo="services" href="${pageContext.request.contextPath}/listAcaQNA.do">질의 응답</a></li>
						<li><a class="scrollTo" data-scrollTo="services" href="${pageContext.request.contextPath}/listSuggestionPost.do">건의</a></li>
						<li><a class="scrollTo" data-scrollTo="contact" href="listFAQ.do">FAQ</a></li>
						<li><a href="#"><img
								src="${pageContext.request.contextPath}/resources/img/login.png"
								style="width: 20px; height: 20px;"></a></li>
						<li></li>
						<li><a href="#menu-toggle" class="btn btn-secondary"
							id="menu-toggle"><img
								src="${pageContext.request.contextPath}/resources/img/chatting_off.png"
								style="width: 20px; height: 20px" name="img" id="imgChange"></a></li>
					</ul>
				</nav>
				<!-- / #primary-nav -->
			</div>
		</div>
	</div>
</header>

<script>
	$("#menu-toggle").click(function(e) {
		e.preventDefault();
		$("#wrapper").toggleClass("toggled");
	});
</script>
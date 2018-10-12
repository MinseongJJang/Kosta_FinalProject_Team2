<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@taglib prefix="sec"
	uri="http://www.springframework.org/security/tags"%>

<!-- Sidebar -->
<div id="sidebar-wrapper">
	<ul class="sidebar-nav">
		<li class="sidebar-brand">
		<sec:authorize access="!hasRole('ROLE_USER')">
	<a href="${pageContext.request.contextPath}/loginForm.do">로그인</a>
</sec:authorize>
<sec:authorize access="hasRole('ROLE_USER')">
	<%-- 
Spring Security를 이용하면 Authentication Bean 이 생성
로그인 한 사용자의 정보는 Authentication 객체의 principal 에 저장된다 
 --%>
	<sec:authentication property="principal.usrName" />님 <br>
	<a href="${pageContext.request.contextPath}/enterCafe.do">카페가기</a>
	<br>
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
	<a href="${pageContext.request.contextPath}/userInfo.do?usrId=<sec:authentication property="principal.usrId"/>">회원 정보</a>

<br>
<br>
파일업로드테스트
<br>
<a
	href="${pageContext.request.contextPath}/product/registerProductForm_FileUpload.do">상품등록(파일업로드)</a>
<br>
<a
	href="${pageContext.request.contextPath}/product/multifileupload_form.do">멀티파일업로드</a>
<br>
<!-- FileUploadController에서 처리한다 -->
</sec:authorize>
<br>
<br>
<sec:authorize access="hasRole('ROLE_ADMIN') and hasRole('ROLE_USER')">
	<%-- 아래는 관리자이자 회원일 때 보이는 메뉴 --%> 
	<a href="adminMain.do">관리자모드</a>	
</sec:authorize></li>
	</ul>
</div>
<!-- /#sidebar-wrapper -->
<header id="header">
	<div class="container">
		<div class="row">
			<div class="col-md-12">
				<button id="primary-nav-button" type="button">Menu</button>
				<div class="logo" style="width:220px; height:110px; padding-top:10px ">
					<a href="index.html">
						<img src="${pageContext.request.contextPath}/resources/img/home_logo.png" alt="Venue Logo" >
					</a>
				</div>
				<nav id="primary-nav" class="dropdown cf">
					<ul class="dropdown menu">
						<li><a class="scrollTo" data-scrollTo="services" href="#">IT기관 비교</a></li>
						<li><a class="scrollTo" data-scrollTo="services" href="#">IT기관 후기</a></li>
						<li><a class="scrollTo" data-scrollTo="contact" href="#">IT기관 홍보</a></li>
						<li><a class="scrollTo" data-scrollTo="services" href="#">IT기관 정보</a></li>
						<li><a class="scrollTo" data-scrollTo="services" href="#">질의 응답</a></li>
						<li><a class="scrollTo" data-scrollTo="contact" href="#">FAQ</a></li>
						<li><a href="#menu-toggle" class="btn btn-secondary" id="menu-toggle"><img src="${pageContext.request.contextPath}/resources/img/menu.png" style="width:15px; height:15px"></a></li>
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
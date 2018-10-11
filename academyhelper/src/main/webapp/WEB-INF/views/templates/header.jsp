<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@taglib prefix="sec"
	uri="http://www.springframework.org/security/tags"%>

<!-- Sidebar -->
<div id="sidebar-wrapper">
	<ul class="sidebar-nav">
		<li class="sidebar-brand"><a href="#"> Start Bootstrap </a></li>
		<li><a href="#">Dashboard</a></li>
		<li><a href="#">Shortcuts</a></li>
		<li><a href="#">Overview</a></li>
		<li><a href="#">Events</a></li>
		<li><a href="#">About</a></li>
		<li><a href="#">Services</a></li>
		<li><a href="#">Contact</a></li>
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
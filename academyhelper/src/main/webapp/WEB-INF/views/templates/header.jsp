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
				<div class="logo">
					<a href="index.html">
						<img src="${pageContext.request.contextPath}/resources/img/logo.png" alt="Venue Logo">
					</a>
				</div>
				<nav id="primary-nav" class="dropdown cf">
					<ul class="dropdown menu">
						<li><a class="scrollTo" data-scrollTo="services" href="#">Our
								Services</a></li>
						<li><a class="scrollTo" data-scrollTo="contact" href="#">Contact
								Us</a></li>
						<li><a href="#menu-toggle" class="btn btn-secondary"
							id="menu-toggle">Toggle Menu</a></li>
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
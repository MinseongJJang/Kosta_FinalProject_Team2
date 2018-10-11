<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@taglib prefix="tiles" uri="http://tiles.apache.org/tags-tiles"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title><tiles:insertAttribute name="title" ignore="true" /></title>
<meta http-equiv="X-UA-Compatible" content="IE=edge,chrome=1">
<meta name="description" content="">
<meta name="viewport" content="width=device-width, initial-scale=1">
<meta name="viewport"
	content="width=device-width, initial-scale=1, shrink-to-fit=no">
<meta name="description" content="">
<meta name="author" content="">
<link rel="stylesheet"
	href="${pageContext.request.contextPath}/resources/css/bootstrap.min.css">
<link rel="stylesheet"
	href="${pageContext.request.contextPath}/resources/css/bootstrap-theme.min.css">
<link rel="stylesheet"
	href="${pageContext.request.contextPath}/resources/css/fontAwesome.css">
<link rel="stylesheet"
	href="${pageContext.request.contextPath}/resources/css/hero-slider.css">
<link rel="stylesheet"
	href="${pageContext.request.contextPath}/resources/css/owl-carousel.css">
<link rel="stylesheet"
	href="${pageContext.request.contextPath}/resources/css/datepicker.css">
<link rel="stylesheet"
	href="${pageContext.request.contextPath}/resources/css/templatemo-style.css">

<!-- Bootstrap core CSS -->
<link
	href="${pageContext.request.contextPath}/resources/vendor/bootstrap/css/bootstrap.min.css"
	rel="stylesheet">
<!-- Custom styles for this template -->
<link
	href="${pageContext.request.contextPath}/resources/css/simple-sidebar.css"
	rel="stylesheet">
<link
	href="https://fonts.googleapis.com/css?family=Raleway:100,200,300,400,500,600,700,800,900"
	rel="stylesheet">
<script
	src="${pageContext.request.contextPath}/resources/js/vendor/modernizr-2.8.3-respond-1.4.2.min.js"></script>
<script
	src="https://ajax.googleapis.com/ajax/libs/jquery/1.11.2/jquery.min.js"
	type="text/javascript"></script>
<script>
	window.jQuery
			|| document
					.write('<script src="${pageContext.request.contextPath}/resources/js/vendor/jquery-1.11.2.min.js"><\/script>')
</script>

<script
	src="${pageContext.request.contextPath}/resources/js/vendor/bootstrap.min.js"></script>
<script
	src="${pageContext.request.contextPath}/resources/js/datepicker.js"></script>
<script src="${pageContext.request.contextPath}/resources/js/plugins.js"></script>
<script src="${pageContext.request.contextPath}/resources/js/main.js"></script>
<!-- Bootstrap core JavaScript -->
<script
	src="${pageContext.request.contextPath}/resources/vendor/jquery/jquery.min.js"></script>
<script
	src="${pageContext.request.contextPath}/resources/vendor/bootstrap/js/bootstrap.bundle.min.js"></script>
</head>
<body>
	<div id="wrapper">
		<div class="row">
			<div class="col-sm-12">
				<tiles:insertAttribute name="header" />
			</div>
		</div>
		<div class="width-main">
				<tiles:insertAttribute name="main" />
		</div>
	
		<tiles:insertAttribute name="footer" />
	</div>
</body>
</html>
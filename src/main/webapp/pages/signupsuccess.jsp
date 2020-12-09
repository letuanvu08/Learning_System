<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<!DOCTYPE html>
<html>
	<head>
		<meta charset="UTF-8">
		<meta name="description" content="Ogani Template">
	    <meta name="keywords" content="Ogani, unica, creative, html">
	    <meta name="viewport" content="width=device-width, initial-scale=1.0">
	    <meta http-equiv="X-UA-Compatible" content="ie=edge">
	    
	    <title>Đăng ký thành công</title>
		<!-- Google Font -->
	    <link href="https://fonts.googleapis.com/css2?family=Roboto:wght@200;300;400;600;900&display=swap" rel="stylesheet">
	
	    <!-- Css Styles -->
	    <link rel="stylesheet" href="${pageContext.request.contextPath}/css/bootstrap.min.css" type="text/css">
	    <link rel="stylesheet" href="${pageContext.request.contextPath}/css/font-awesome.min.css" type="text/css">
	    <link rel="stylesheet" href="${pageContext.request.contextPath}/css/elegant-icons.css" type="text/css">
	    <link rel="stylesheet" href="${pageContext.request.contextPath}/css/nice-select.css" type="text/css">
	    <link rel="stylesheet" href="${pageContext.request.contextPath}/css/jquery-ui.min.css" type="text/css">
	    <link rel="stylesheet" href="${pageContext.request.contextPath}/css/owl.carousel.min.css" type="text/css">
	    <link rel="stylesheet" href="${pageContext.request.contextPath}/css/slicknav.min.css" type="text/css">
	    <link rel="stylesheet" href="${pageContext.request.contextPath}/css/style.css" type="text/css">
			
		<!-- Favicon -->
		<link rel="shortcut icon" href="${pageContext.request.contextPath}/img/logo/favicon.ico">
	</head>
	<body>
		<!-- Page Preloder -->
    	<div id="preloder">
        	<div class="loader"></div>
    	</div>	
    	<!-- Login form -->
		<section class="form-window">
			<div class="form-content">
				<div class="form-title">
					<h2>Chúng mừng bạn đã đăng ký thành công</h2>
				</div>
				<form action="login">
					<div class="form-group text-center">
						<button type="submit" class="site-btn">Đăng nhập</button>
					</div>
				</form>
			</div>
			
		</section>
		<!-- Js Plugins -->
	    <script src="${pageContext.request.contextPath}/js/jquery-3.3.1.min.js"></script>
	    <script src="${pageContext.request.contextPath}/js/bootstrap.min.js"></script>
	    <script src="${pageContext.request.contextPath}/js/jquery.nice-select.min.js"></script>
	    <script src="${pageContext.request.contextPath}/js/jquery-ui.min.js"></script>
	    <script src="${pageContext.request.contextPath}/js/jquery.slicknav.js"></script>
	    <script src="${pageContext.request.contextPath}/js/mixitup.min.js"></script>
	    <script src="${pageContext.request.contextPath}/js/owl.carousel.min.js"></script>
	    <script src="${pageContext.request.contextPath}/js/main.js"></script>
	</body>
</html>